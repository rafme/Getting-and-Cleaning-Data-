Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data" a certified Coursera Course for Data Science Speclization.

One of the most exciting areas in all of data science right now is wearable computing - 
see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from 
the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The dataset being used is: 
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files
We are given a raw code downloaded from the archives of UCI.edu. This program takes this into consideration for tidy and analysis

`CodeBook.md` specifies and describes given/created variables, the datasets, and any load/transformations that was performed to clean up the data.

`run_analysis.R` is the R script that contains the code to carry out the 5 steps described below. It can be read and ran in R Studio or R. 

`run_analysis.R` is the only code run to achieve the output result of the final 5th step into a file called `tidy.txt`, and uploaded to the Repo 

##Steps Involved by Project Requirements     
* 1 - Merges the training and the test sets to create one data set.
* 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3 - Uses descriptive activity names to name the activities in the data set
* 4 - Appropriately labels the data set with descriptive variable names. 
* 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

