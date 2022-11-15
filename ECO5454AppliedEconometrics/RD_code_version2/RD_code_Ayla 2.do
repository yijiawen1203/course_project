cd "/Users/yoga/Dropbox/0 FSU/4_2022 fall/2_applied economics/2 generate my dataset_run code/RD code"

capture log close
log using RDregression_1114, replace text
clear all
set linesize 85
macro drop _all

// install rdrobust
//net install rdrobust, from(https://raw.githubusercontent.com/rdpackages/rdrobust/master/stata) replace

//use industrial file
cls
clear 
sysuse rd_data_industrial_peroperty.dta

//my dependent variable is  transaction volumns
/* my focused variable is stay at home policy, 
which is the percentage of how many days in a quarter that a MSA have the stay at home 
policy..
 
meanwhile, I control for the number of covid cases and deaths.
*/

rdrobust salesvolumetransactions ln_cases_current, c(4.6)

rdrobust salesvolumetransactions ln_cases_current percentage_stayathome i.cbsacode i.timeindex, c(4.6)
