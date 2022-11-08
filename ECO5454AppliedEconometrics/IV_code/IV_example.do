clear

* Build dataset
set obs 100


gen Z_instr = runiform()*100 // instrument designed to be totally exogenous  

gen X_endog = Z_instr*10 + _n*5 + runiform()*5 // endogenous variable is function of instrument, _n which we can think of as unobservable, and noise
gen Y_outcome = _n*100 + X_endog*30 + runiform() // outcome is a function of X (and therefore Z) as well as unobservable, and noise

gen xvar1 = runiform()*100
gen xvar2 = rbinomial(1,.5)


** Regressions
reg Y_outcome X_endog x*, robust // "naive" regression
	local naiveBeta = _b[X_endog]

gen N = _n
reg Y_outcome X_endog N x*, robust // notice that the coefficient would be lower if we could direclty control for unobservable 
	
reg Y_outcome Z_instr x*, robust // reduced form, could be informative in some situations. Also, divide this by first stage coefficient to get 2SLS estimate. 
	

ivreg2 Y_outcome x* (X_endog = Z_instr), robust first // check that first stage has t-stat > about 3.17 (F stat > 10), and compare coefficient on X_endog
	local ivBeta = _b[X_endog]
	
di "Naive beta =" `naiveBeta' 
di "Beta from 2SLS = " `ivBeta'
** Bias is as we expected: unobservable (_n) affects Y and X, but we can't control for it directly. 



