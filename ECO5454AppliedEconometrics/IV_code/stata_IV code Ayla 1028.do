cd "/Users/yoga/Dropbox/0 FSU/4_2022 fall/2_applied economics/2 generate my dataset_run code/iv code"

capture log close
log using IVregression_1028, replace text
clear all
set linesize 85
macro drop _all



//use office file
cls
clear 
sysuse 31_6_office_covid_2018-2021_include_us_florida_covid.dta

// the first stage regression, check whether stay at home order (IV) has a statistically significant influence on vacancy rate (endogeneous variable).
// Here I add quarter dummy variables to control the variation across quarters.
// the coefficient here is the beta 1 we talked in the class.
reg vacancyrate percentage_stayathome q2 q3 q4

// the reduced form of regression, I examine the influence of IV (i.e., stay at home order) on sales volume transactions of office building (dependent variable).
// here the control variables are the same as the first stage. That is the quarter's dummy variable
// the coefficient here is the beta 3 we talked in the class.
reg salesvolumetransactions percentage_stayathome q2 q3 q4

/* to get the targeted coefficient (i.e.,beta 2), we calculate beta3/beta1.
that is, beta2=0.2417275/ 0.0001784=1355
hence, I get the influence of vacancy rate on sale volume transactions is 1355.
*/
















