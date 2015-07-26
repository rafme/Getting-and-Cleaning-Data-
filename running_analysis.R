library(plyr)

#Project Getting and Cleaning Data
#You should create one R script called run_analysis.R that does the following. 
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#1. Merges the training and the test sets to create one data set.
#Reading TEST and TRAIN Data files 
subject.trainfile <- read.csv("train/subject_train.txt", sep="", header=FALSE)
x_train <- read.csv("train/X_train.txt", sep="", header=FALSE)
y_train <- read.csv("train/y_train.txt", sep="", header=FALSE)

subject.testfile <- read.csv("test/subject_test.txt", sep="", header=FALSE)
x_test <- read.csv("test/X_test.txt", sep="", header=FALSE)
y_test <- read.csv("test/y_test.txt", sep="", header=FALSE)

#make x and y datasets from both TRAIN AND TEST  and the SUBJECT DATASET
#USING RBIND to combine rows/cols 
subject.data <- rbind(subject.trainfile, subject.testfile)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# get features from the text file 
feature.data <- read.csv("features.txt", sep="", header=FALSE)

# Select mean or std columns. Also note there are some mean columns that are irrelavent to the answer 
mean.std <- grep("-(mean|std)\\(\\)", feature.data[, 2])

#Retrieve the mean.std columns
x_data <- x_data[,mean.std ]

#Clean the names of mean.std columns for later
feature.data[,2] = gsub('-mean', 'Mean', feature.data[,2])  # Replace `-mean' by `Mean'
feature.data[,2] = gsub('-std', 'Std', feature.data[,2]) # Replace `-std' by 'Std'
feature.data[,2] = gsub('[-()]', '', feature.data[,2]) # Remove the parenthesis and dashes

#Fix the x_data column names with the ones from mean.std cols 
names(x_data) <- feature_data[mean.std, 2]

# 3. Uses descriptive activity names to name the activities in the data set
#Read activity data and Retrieve activity names for y_data
activity.labels <- read.csv("activity_labels.txt", sep="", header=FALSE)
y_data[, 1] <- activity.labels[y_data[, 1], 2]

# 4. Appropriately labels the data set with descriptive variable names. 
#Fix column name for y_data, activity and subject
names(y_data) <- "activity"
names(subject.data) <- "subject"

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

#Use cbind to combine the 3 datasets of subject, y and x data 
#Now that all labels are corrected as the first step in creating
#a tidy dataset 
CDATA <- cbind(subject.data, y_data, x_data)

# Get average of each variable. Need the number of cols from combined Data
#Next is to ddply the combined Data with the subject and activity col and then get the AVG 
NumberofCols <- ncol(CDATA)
AVGDATA <- ddply(CDATA, .(subject, activity), function(x) colMeans(x[, 3:NumberofCols]))

#Create the final dataset into a text file 
write.table(AVGDATA, "tidy.txt", row.name=FALSE, sep=",", quote=FALSE)
