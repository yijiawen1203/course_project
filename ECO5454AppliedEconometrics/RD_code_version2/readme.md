This file inlcude code for the regression discontinuaty design.

1 introduction
==

I would like to see how covid contagion cases influence the industrial properties' transaction volume after controlling for stay at home policy in Florida. the study time period is from 2018 to 2021.

2 data and code
==
I use python to clean data and get the clean version data for Stata. the notebook is **data preprocessing**.

I use a subset of the cleaned data to run the RD regression, the data file is **industrial property_covid_2018-2021.csv**

the data version for stata is **rd_data_industrial_peroperty.dta**, it is the same as **industrial property_covid_2018-2021.csv**

the stata code is **RD_code_Ayla 2**

the log file is **RDregression_1114.log**

3 concerns on the results
==

1) the results says "Mass points detected in the running variable. Estimates might be unreliable due to low number of effective observations." I am not sure why the effective number would be so few when my number of observation is large.

2) I am not sure why the result of two regression is the same. In the second regression,  I add control variables but in the first regression, I have no control variable. 


