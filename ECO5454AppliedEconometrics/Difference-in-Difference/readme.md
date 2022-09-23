 The difference-in-difference project deals with the following research question: How natuaral disaster disrupted a region's labor market in in terms of employment? Using Hurricane Katrina as an example.
 
 Whether places with more innovation can have better ability to survive under the external shock
 
 whether technology network structure influence the places' ability to survice?

1) I first pre-process and clean the raw data. The code is in 1_clean_data_for_DID.ipynb. 
The output is the cleaned data used for DID model,that is louisana_clean_emp_with_shock_info.csv

2. I change the louisana_clean_emp_with_shock_info.csv into louisana_clean_emp_with_shock_info.dta

3. I run the stata code of dif_in_diff_code, to examine whether the hurricane in 2005 quarter 3 will negatively influence the employmnet number and total wages after the disaster.

4.the log file is as follows: DID_Ayla_0922.log
