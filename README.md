# Getting and Cleaning Data Course Project - Human Activity Recognition Using Smartphones

## Introduction
________________
Human Activity Recognition Using Smartphones Data Set are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Raw data to download for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Files used in the Script
________
- <code>features.txt</code>: List of all measurement variable
- <code>activity_labels.txt</code>: Activity names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- <code>train/X_train.txt</code>: Training set
- <code>train/y_train.txt</code>: Training labels
- <code>test/X_test.txt</code>: Test set
- <code>test/y_test.txt</code>: Test labels
- <code>train/subject_train.txt</code> & <code>test/subject_test.txt</code>: Each row identifies the subject who performed the activity for each window sample.


## run_analysis R Script
________
<code>run_analysis.R</code> is created to do the following:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Result
__________________
A tidy dataset in file named - <code>tidydataset.txt</code>