---
title: "CodeBook"
author: "Maria"
date: "Sunday, March 22, 2015"
output: html_document
---

Step5.txt containes tidy data which was merged and transformed from original "test" and "train" data.

File 'step5.txt' containes following variables:

* subject - Each row identifies the subject who performed each activity. Its range is from 1 to 30. 
* activity - Containes activity names for each subject and feature. Class is character, range is (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING LAYING)
* feature - Containes features' names for every possible option without X-Y-Z specification. Has 17 different features such as: "tBodyAcc", "tGravityAcc", "tBodyAccJerk", "tBodyGyro", "tBodyGyroJerk", "tBodyAccMag", "tGravityAccMag", "tBodyAccJerkMag", "tBodyGyroMag", "tBodyGyroJerkMag", "fBodyAcc", "fBodyAccJerk", "fBodyGyro", "fBodyAccMag", "fBodyBodyAccJerkMag"  "fBodyBodyGyroMag", "fBodyBodyGyroJerkMag"
* measure - Defines either mean or standart deviation estimation for each feature, subject and activity
* letter - Defines either X, Y or Z direction for each feature
* mean(number) - Containes means of each variable for each activity, each signal direction, each measure and each subject.

Step5.txt is a long form of data, each variable is in one column, each different observation of that variable is in a different row
