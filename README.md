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
        

2. Description of varibles

There are 68 variables in the tidydata I submitted. the description of all varibles are as follows.

* subject : An identifier of person who carried out the experiment.
* activity: including six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* split apart the remaining variables.

        txxxxxx : that means time. these time domain signals were captured at a constant rate of 50Hz.
        fxxxxxx : that indicate frequency domain signals which come from Fast Fourier Transform. 
        xBodyAcc/xgraivityAcc : that means a acceleration signal which separated into body and gravity acceleration signals.
        xBodyxxxxJerk : these represent Jerk signal which derived by the body linear acceleration and angular velocity.
        xxxxxxxxxMag : this means the magnitude of three-dimensional signals which was caculated using the Euclidean norm.
        -XYZ : 3-axial signals in the X, Y, Z directions.
        mean(): Mean value.
        std(): Standard deviation.
        
























