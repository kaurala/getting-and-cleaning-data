Code Book
======================
### Getting and Cleaning Data_Course Project

This document contains a R script that explained the process of transforming
to a tidy data from raw data, a descriptive table of variables.

1. The code describes 6 steps of the cleaning process

* Read and Load the raw data, including measure data, labels, description of variables. 

        function : read.table
        raw data : X_train.txt, X_test.txt, 
        tip : an alternative fast way to read the data is to use colClasses
                to define the class of variables.

* Create three new variables that individually identify the test and train data, the number of volunteers, the label of activities.

        function : Example : traindata$identity <- "train"
        raw data : features.txt, subject_test.txt, subject_train.txt
        tip : pay attention to the dimension of two datas in case they have different dimention.

* Merge the training and testing dataset.
        
        function : rbind()
        tip : using which(), ifelse() functions if error occurs.
        
* Extract the columns which include "mean()" or "std()" and subset the data.
       
        function : grep(), subset() 
        tip : use the fixed = TRUE parameter in grep function.
        
* Add descriptive activity names to the label column which is factor variable. 
       
        function : factor(), unique()
        raw data : activity_label.txt, y_train.txt, y_test.txt

* Write a function that produce a new dataset with the average of each variable for each activity and each subject.

        function : aggregate(), dim(), names(), cbind()
        
-----------------------------------------------------------------------------

2. Description of varibles

* The variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

* The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
        
* 
The set of variables that were estimated from these signals are: 

        mean(): Mean value
        std(): Standard deviation
        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
