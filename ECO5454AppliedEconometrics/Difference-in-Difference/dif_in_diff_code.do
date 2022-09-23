cls
cd "/Users/yoga/Dropbox/0 FSU/4_2022 fall/2_applied economics/2 generate my dataset_run code/did code"

capture log close
log using DID_Ayla_0922, replace text
clear all
set linesize 85
macro drop _all

sysuse louisana_clean_emp_with_shock_info.dta

//examine how Hurricane influence county's labor market
/*the independent variable include 
1) affected_county_after_shock: is the interaction term of affected county* after shock
2) affected county is a dummy variable equal to 1 when the county is shocked by hurricane
3) after 2005q3 is a dummy variable equal to 1 if the time is after 20005 quarter three
*/
//first is the employment_number_in_quarter, the dependent variable is qtr_emp

reg qtr_emp affected_county_after_shock after_2005q3 affected_county year, r

reg qtr_emp affected_county_after_shock after_2005q3 affected_county year

reg qtr_emp affected_county_after_shock after_2005q3 affected_county i.year

reg qtr_emp affected_county_after_shock after_2005q3 affected_county i.year i.area_fips


//second  the total wages in quarter, the dependent variable is total_qtrly_wages
reg total_qtrly_wages affected_county_after_shock after_2005q3 affected_county year, r

reg total_qtrly_wages affected_county_after_shock after_2005q3 affected_county year

reg total_qtrly_wages affected_county_after_shock after_2005q3 affected_county i.year

reg total_qtrly_wages affected_county_after_shock after_2005q3 affected_county i.year i.area_fips


/* becasue the interaction term (i.e., affected_county_after_shock) is statistically significant,
my assumption that hurricane in 2005 heavily shocked the employment number are supported.

However, the hurricane in 2005 increase the total wage, which is beyond my expectation.
*/





