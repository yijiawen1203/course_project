clear 
set more on

** Please note that due to random elements in the code each run will generate different results. 

* Build dataset
set obs 10000

gen treatyr = 0
	replace treatyr = 1 if _n <= 5000 // we will come back to this later 
gen bday = round(runiform()*365) 
gen relx = bday-274
gen eligible = cond(bday >=274, 1, 0) // if you were old enough you were in the next grade level; would have received treatment if available
gen relxXelig = relx*eligible


gen earnings = rnormal(75,5)*1000 - 10*bday // build in age component; assume bday affects earnings so that kids born further apart have different outcomes
	replace earnings = earnings + 10000 if eligible == 1 & treatyr == 1 // effect of program 	
	
	
** A few charts
preserve
collapse earnings, by(relx treatyr elig)

twoway(scatter elig relx if treatyr == 1, , graphregion(color(white)))
more 
twoway(scatter earnings relx if treatyr == 1)(qfit earnings relx if relx < 0 & treatyr == 1)(qfit earnings relx if relx >= 0 & treatyr == 1, graphregion(color(white)))
more 
twoway(scatter earnings relx if treatyr == 1 & relx > -31 & relx < 31)(qfit earnings relx if relx < 0 & treatyr == 1 & relx > - 31, graphregion(color(white))) ///
	(qfit earnings relx if relx >= 0 & treatyr == 1 & relx < 31)	
more
restore 


**RD simple	
reg earnings relx relxXelig eligible if treatyr==1, robust
reg earnings relx relxXelig eligible if treatyr==1 & relx >-15 & relx < 15, robust // reducing bandwidth will avoid conflating treatment with bday effect. 

** Add in quadratic to more flexibly control for distance from cut-off 
gen relx2 = relx*relx
gen relxXelig2 = relxXelig*relxXelig
reg earnings relx relx2 relxXelig relxXelig2 eligible if treatyr==1 & relx >-15 & relx < 15, robust


** Finally, what if earnings are also partially dependent on being the oldest in your cohort? This would require an RD-DD
gen agerank = 365 - relx if relx>=0
	replace agerank = -relx if relx < 0 // relative age in cohort, larger = older 
replace earnings = earnings + 10*agerank
reg earnings relx relx2 relxXelig relxXelig2 eligible if treatyr==1 & relx >-15 & relx < 15, robust // this will overestimate the effect of the program because we are comparing older kids to younger kids
gen eligXtreatyr = treatyr*eligible
reg earnings relx relx2 relxXelig relxXelig2 treatyr eligible eligXtreatyr if relx >-15 & relx < 15, robust // the estimated effect should be smaller now

** Other ideas: see how various popular RD packages work (built-in bandwidth optimization), check for discontinuities in other variables, ensure absence of bunching, etc. 
** Also, the above is a sharp RD such that the first stage has perfect compliance. Consider how a fuzzy RD would work particularly in IV terminology (i.e., 1st vs 2nd stage)
