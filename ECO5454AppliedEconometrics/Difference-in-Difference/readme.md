 The difference-in-difference project deals with the following research question: How natuaral disaster disrupted a region's labor market in in terms of employment and total wages? Using Hurricane Katrina as an example.
 
1) I first pre-process and clean the raw data. The code is in 1_clean_data_for_DID.ipynb. 
The output is the cleaned data used for DID model,that is louisana_clean_emp_with_shock_info.csv

2. I change the louisana_clean_emp_with_shock_info.csv into louisana_clean_emp_with_shock_info.dta

3. I run the stata code of dif_in_diff_code, to examine whether the hurricane in 2005 quarter 3 will negatively influence the employmnet number and total wages after the disaster. I use 2003 to 2005 quarter 3 as pre-shock time, and 2005 quarter 4 to 2007 as after-shock time.

4.the log file is as follows: DID_Ayla_0922.log
