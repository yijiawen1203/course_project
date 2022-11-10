cd "/Users/yoga/Dropbox/0 FSU/4_2022 fall/2_applied economics/2 generate my dataset_run code/RD code"

capture log close
log using RDregression_1109, replace text
clear all
set linesize 85
macro drop _all

//use office file
cls
clear 
sysuse office_data_for_RD.dta

//my dependent variable is office building transaction volumns
/* my focused variable is covid, which equals 1 when the time is after 2020 quarter 1,
which equals 0 when the time is before or equal to 2020 quarter 1. 
meanwhile, I use the metropolitan area and year fixed effect regression.
*/

reg salesvolumetransactions covid i.cbsacode i.year




