##Project: Data Science (Getting and Cleaning Data) Project

##Data Used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Purpose of the project
##To merge the training and the test sets to create one data set.
##To extract only the measurements on the mean and standard deviation for each measurement.
## To use descriptive activity names to name the activities in the data set
##To appropriately label the data set with descriptive variable names.
## From the data set in step 4, to create a second, independent tidy data set with the average of each variable for each activity and each subject.


##Load required packages
library(dplyr)

##Check if file exists; create if it doesn't.
if(!file.exists("./data")){dir.create("./data")}

##Download thedata from URL and unzip the files.
urlzip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlzip, destfile = "./data.zip")
unzip(zipfile="./data.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files

##Assign data frames to each file and check their outputs
features <- read.table("features.txt", col.names = c("n","functions"))
head(features)
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
head(activities)
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
head(subject_test)
x_test <- read.table("test/X_test.txt", col.names = features$functions)
head(x_test)
y_test <- read.table("test/y_test.txt", col.names = "code")
head(y_test)
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
head(subject_train)
x_train <- read.table("train/X_train.txt", col.names = features$functions)
head(x_train)
y_train <- read.table("train/y_train.txt", col.names = "code")
head(y_train)

##Merged the training and the test sets to create one data set called 'FinalData' and check the outcome.
Mainx<-rbind(x_train,x_test)
Mainy<-rbind(y_train,y_test)
FinalData<-cbind(Subject,Mainx,Mainy)
str(FinalData)

#Extracted the measurements on the mean and standard deviation for each measurement in FinalData set.
MeanandSDdata<- FinalData %>% select(subject,code,contains("mean"),contains("std"))

#Assigned descriptive activity names to name the activities in the data set.
FinalData$activity<-FinalData$code

##Labeled the FinalData set with descriptive variable names and checked the result.
names(FinalData)<-gsub("^t", "Time", names(FinalData))
names(FinalData)<-gsub("^f", "Frequency", names(FinalData))
names(FinalData)<-gsub("Mag", "Magnitude", names(FinalData))
names(FinalData)<-gsub("Acc", "Accelerometer", names(FinalData))
names(FinalData)<-gsub("Gyro", "Gyroscope", names(FinalData))
names(FinalData)<-gsub("Coeff", "Coefficient", names(FinalData))
names(FinalData)<-gsub("Freq", "Frequency", names(FinalData))
names(FinalData)<-gsub("mean", "Mean", names(FinalData),ignore.case = TRUE)
names(FinalData)<-gsub("-std()", "Standard Deviation", names(FinalData), ignore.case = TRUE)
names(FinalData)<-gsub("iqr", "Inter Quartile Range", names(FinalData),ignore.case = TRUE)
names(FinalData)<-gsub("sma", "Simple Moving Average", names(FinalData))
colnames(FinalData)

##Create a second, independent tidy data set with the average of each variable for each activity and each subject.
MainData<-FinalData %>% group_by(subject,activity) %>% summarise_all(funs(mean))
write.table(MainData, "MainData.txt", row.names = FALSE)

##Check final file
View(MainData)

