# Introduction

In this data science project we are running a R Program script called `run_analysis.R`
This script performs the 5 steps noted by the project requirements. 

#Steps Involved    

* 1 - Data is read in and merged using `rbind()`. 
* 2 - mean and std measurements are retrieved the entire dataset with grep, this also means we have to fix the column names by using the names in the features.tx
* 3 - The activity_labels.txt is used to get the descriptive activity names to name the acitivies in the entire dataset for our mean and std rows 
* 4 - We have to assign the names of the (acitivy dataset) 'y_data` and subject.data to their columns 
* 5 - In the end we create a new tidy dataset with the averages for each variable (mean and std) for each acitvity and subject
* This `tidy.txt dataset` is uploaded to the repo 

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject.testfile` and `subject.trainfile` are the initial datasets from downloaded datasets 
* `x_data`, `y_data` and `subject.data` are merged subsetted datasets so we can perform furture analysis 
* `feature.data` contains the correct names of combined dataset`x_data` , this is used to apply the column names in `mean.std`, the num vector used to retrieve the specific data of mean and std measurements
* `activity.labels` contains the correct names of combined dataset 'y_data' where column names is added to the 'y_data'
* `CDATA` is the combine merged data of `x_data`, `y_data` and `subject_data`, this is clean data ready to be analyzed
* `ddply()` function part of the plyr package applies `colMeans()` as a parameter to find the means of the cols of mean, std
* `AVGDATA` is the dataset that has the averages for the variables mean, std which is stored outside as `tidy.txt`
