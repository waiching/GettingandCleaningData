## load library
library(plyr)
library(knitr)

## Load all dataset
## Read subject files
dataSubjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
dataSubjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## Read Activity files
dataActivityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header=FALSE)
dataActivityTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header=FALSE)


## Read features files
dataFeaturesTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header=FALSE)
dataFeaturesTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)

## check properties of above
str(dataActivityTest)
str(dataActivityTrain)
str(dataSubjectTrain)
str(dataSubjectTest)
str(dataFeaturesTest)
str(dataFeaturesTrain)

## 1. Merges the training and the test sets to create one data set
data_subject <- rbind(dataSubjectTrain, dataSubjectTest)
data_activity <- rbind(dataActivityTrain, dataActivityTest)
data_features <- rbind(dataFeaturesTrain, dataFeaturesTest)

## define names to variables
names(data_subject)<-c("Subject")
names(data_activity)<-c("Activity")
getfeaturesnames<-read.table("./data/UCI HAR Dataset/features.txt", head=FALSE)
names(data_features)<-getfeaturesnames$V2

## merge columns
combinedata<-cbind(data_subject,data_activity)
mergeddata<-cbind(data_features,combinedata)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
subdatafeaturenames<-getfeaturesnames$V2[grep("mean\\(\\)|std\\(\\)",getfeaturesnames$V2)]

selectedcolnames<-c(as.character(subdatafeaturenames),"Subject", "Activity")
mergeddata<-subset(mergeddata,select=selectedcolnames)
str(mergeddata)

## 3. Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt",header=FALSE)
mergeddata$Activity <- factor(mergeddata$Activity, levels = activity_labels[,1], labels = activity_labels[,2])

## 4. Appropriately labels the data set with descriptive variable names
names(mergeddata)<-gsub("^t", "Time", names(mergeddata))
names(mergeddata)<-gsub("^f", "Frequency", names(mergeddata))
names(mergeddata)<-gsub("Acc", "Accelerometer", names(mergeddata))
names(mergeddata)<-gsub("Gyro", "Gyroscope", names(mergeddata))
names(mergeddata)<-gsub("Mag", "Magnitude", names(mergeddata))
names(mergeddata)<-gsub("BodyBody", "Body", names(mergeddata))
names(mergeddata)

tidydata<-aggregate(. ~Subject + Activity, mergeddata, mean)
tidydata<-tidydata[order(tidydata$Subject, tidydata$Activity),]
write.table(tidydata,file="tidydataset.txt", row.name=FALSE)