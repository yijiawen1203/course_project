clear

* Build dataset
set obs 20
gen treat = 0
	replace treat = 1 if _n >10
gen t = _n
	replace t = t - 10 if _n > 10

gen post = cond(t>5, 1, 0)

gen treatXpost = treat*post

gen outcome = t*100 + runiform()*100
	replace outcome = outcome - 50 if treat == 1
	replace outcome = outcome-250 if treatXpost == 1


gen xvar1 = runiform()*100
gen xvar2 = runiform()*10


** Regressions
reg outcome treat post treatXpost, robust // simplest version

xi: reg outcome i.t treat treatXpost, robust // time fixed effects instead of post dummy

xi: reg outcome i.t treat treatXpost xvar1 xvar2, robust // controlling for other "stuff"

xi: reg outcome i.t*treat, robust // this is the fastest way to do an event study, but you'll want to redefine your variables so that the omitted period is the last pre-period. (ignore lack of SEs)

xi i.t
forval x = 2/10 {
	gen treatXt`x' = treat*_It_`x'
	}

drop _It_5 treatXt5
gen _It_1 = cond(t == 1, 1, 0)
gen treatXt1 = treat*_It_1
order  _It_*  treatXt*, seq
reg outcome _It* treatXt* treat, robust // relative to last pre-period





** Chart
twoway(connect outcome t if treat == 0)(connect outcome t if treat == 1, xline(5.5) legend(lab(1 Control) lab(2 Treated)))

*I'll leave it to you to figure out how to grab coefficients and SEs in order to make your event study figures
