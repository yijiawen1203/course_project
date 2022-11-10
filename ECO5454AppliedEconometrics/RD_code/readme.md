This file inlcude code for the regression discontinuaty design.

1 introduction
==

I would like to see how the COVID-19 emergency announcement influences the office building sale volumn transaction in florida.the study time period is from 2018 to 2021.

My hypothesis is that investor would be hesitant in purchasing office building during the pandemic. 


2 data and code
==

the data file is **office_data_for_RD.dta**

the code do file for stata is **RD_code_Ayla**

the log file from stata is **RDregression_1109.log**

3 model
==

I use metropolitan area and year fixed effect regression. The 

In my regression discontinuaty research design, the focused variable is covid, which equals to 1 when the time period is after 2020 quarter one, but equals to 0 when the time period is before or equal to 2020 quarter one.

the dependent variable is the sale volume transactions.

4 results
==

we can see that the coefficients of covid is statistically significant and negative, which indicates that after covid, the sale volume transaction reduces dramatically due to covid.

My hypothesis is verified.




