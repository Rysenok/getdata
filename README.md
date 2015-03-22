---
title: "README"
author: "Maria"
date: "Sunday, March 22, 2015"
output: html_document
---

The script **run_analysis.R** was used to merge and tidy data from original 'train' and 'test' datasets

The script does following steps:

1. from **test** folder read following data using *readLines* or *read.table*:
  + test_subject containes subject ids from subject_test.txt
  + test_x containes all features estimations for every subject and activity from test.txt
  + test_y containes test labels from y_test.txt
  + features containes all features from features.txt
  + binds *subject*, *labels*, *test_x* as columns in bid data named **test**
2. repeat step 1 for **train** folder
3. bind **test** and **train** data frames into **all** data frame. Binding was done with *rbind* operator since every row from 2 datasets are obsevations
4. load tidyr and dplyr libraries
5. use *select* to extracts only the measurements on the mean and standard deviation for each measurement. This step first extracts every measurement with "mean()" in the name of feature, then with "std()". Script **does not** take measurements with 'mean' without brakets such as *gravityMean*, etc. To get whole dataset scritp uses *cbind* operator since every column in each dataset is different variable in final merged dataset.
6. To make long form of data script uses *gather* function. This puts every variable name into single column as one variable. 
7. To make each observation in one row and each variable in one column script uses *separate* function. This step creates 4 columns with different variables such are: feature_id, feature, measure, letter. This way each row containes a full observation and each variable has a separate column
8. This step reads activity labels and then replaces activity ids with names. This was done in a simple cycle
9. **The tidy data for step 4 was created and completed** 
10. The last step creates a second, independent tidy data set with the average of each variable for each activity and each subject. To do this script uses *filter* function. It takes a part of step4 data for every subject and activity. Then *groups* data by feature id and uses *summarize* to create a vector of mean values for every feature. Then in cycle this was done for every subject-activity pair and then *rbind*ed and every feature and measure and direction.
11. **The tidy data for step 5 was created and completed** 