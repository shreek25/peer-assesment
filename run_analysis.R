## Cleaning and preparing the training dataset

## Set the current working directory

setwd("C:/Users/subramr2/Desktop/Coursera/Getting and cleaning data/Data")

## Download the zip file from the server

smartdata<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./dataset.zip")

## Read Subject train from training data set

train_subject <- read.table(unz("dataset.zip", "UCI HAR Dataset/train/subject_train.txt"), header=FALSE)

## Add column name "subject_code" to train_subject

colnames(train_subject)<-c("subject_code")

## Read activity code from training dataset

train_activity_code <- read.table(unz("dataset.zip", "UCI HAR Dataset/train/y_train.txt"), header=FALSE)

## Add column name "actiity_code" to train_activity_code

colnames(train_activity_code)<-c("activity_code")

## Column bind the train_suject and train_activity_code

train_activity_subject_code<-cbind(train_subject,train_activity_code)

## Read the activity description file from training set

train_activity_descripion <- read.table(unz("dataset.zip", "UCI HAR Dataset/activity_labels.txt"), header=FALSE)

## Add Column names to the activity description

colnames(train_activity_descripion)<-c("activity_code","activity_description")

## Merge train_activity_subject_code and train_activity_descripion on activity_code Column

train_activity_subject_code_description<- merge(train_activity_subject_code,train_activity_descripion,by.x="activity_code"
                                                ,by.y="activity_code")

## Read the X_train object from training data set

train_dataset <- read.table(unz("dataset.zip", "UCI HAR Dataset/train/X_train.txt"), header=FALSE)

## Read the features dataset from the training dataset

train_features <- read.table(unz("dataset.zip", "UCI HAR Dataset/features.txt"), header=FALSE)

## Select the features description column from train_features dataset

train_features <- read.table(unz("dataset.zip", "UCI HAR Dataset/features.txt"), header=FALSE)

## Select the description field from train_features

train_features_description<-train_features[,2]

## Add the train_features_desctpion as column header for train_dataset

colnames(train_dataset)<-train_features_description

## Column bind train_dataset and train_activity_subject_code_description

train_dataset_activity_subject_code_description<-cbind(train_activity_subject_code_description,train_dataset)

## Cleaning and preparing the test dataset



## Read Subject test from test data set

test_subject <- read.table(unz("dataset.zip", "UCI HAR Dataset/test/subject_test.txt"), header=FALSE)

## Add column name "subject_code" to test_subject

colnames(test_subject)<-c("subject_code")

## Read activity code from test dataset

test_activity_code <- read.table(unz("dataset.zip", "UCI HAR Dataset/test/y_test.txt"), header=FALSE)

## Add column name "actiity_code" to test_activity_code

colnames(test_activity_code)<-c("activity_code")

## Column bind the test_suject and test_activity_code

test_activity_subject_code<-cbind(test_subject,test_activity_code)

## Read the activity description file from test set

test_activity_descripion <- read.table(unz("dataset.zip", "UCI HAR Dataset/activity_labels.txt"), header=FALSE)

## Add Column names to the activity description

colnames(test_activity_descripion)<-c("activity_code","activity_description")

## Merge test_activity_subject_code and test_activity_descripion on activity_code Column

test_activity_subject_code_description<- merge(test_activity_subject_code,test_activity_descripion,by.x="activity_code"
                                               ,by.y="activity_code")

## Read the X_test object from test data set

test_dataset <- read.table(unz("dataset.zip", "UCI HAR Dataset/test/X_test.txt"), header=FALSE)

## Read the features dataset from the test dataset

test_features <- read.table(unz("dataset.zip", "UCI HAR Dataset/features.txt"), header=FALSE)

## Select the features description column from test_features dataset

test_features <- read.table(unz("dataset.zip", "UCI HAR Dataset/features.txt"), header=FALSE)

## Select the description field from test_features

test_features_description<-test_features[,2]

## Add the test_features_desctpion as column header for test_dataset

colnames(test_dataset)<-test_features_description

## Column bind test_dataset and test_activity_subject_code_description

test_dataset_activity_subject_code_description<-cbind(test_activity_subject_code_description,test_dataset)

## Combine training and test dataset

train_test_dataset_activity_subject_code_description<-rbind(train_dataset_activity_subject_code_description,test_dataset_activity_subject_code_description)

## Tidy dataset number 1 (Merged test and training dataset)

write.csv(train_test_dataset_activity_subject_code_description, file = "tidy1.txt", row.names=FALSE)

## Reduce the columns in features by limiting to mean and std

toMatch <- c("mean()", "std()")

matches <- unique (grep(paste(toMatch,collapse="|"), test_features$V2
                        ,value=TRUE))


matches1 <- unique (grep("meanFreq", matches,value=TRUE,invert=TRUE))


summary_extract_descriptions<-train_test_dataset_activity_subject_code_description[,1:3]

summary_extract_measurements<-train_test_dataset_activity_subject_code_description[,4:564]

summary_filtered_extract_measurements <-summary_extract_measurements[,c(matches1)]

summary_filtered_extract_measurements_final<-cbind(summary_extract_descriptions,summary_filtered_extract_measurements)

## Prepare the tidy data by summarizing each variable for each activity and each subject. 

avg_tidy_day_2<-aggregate(. ~ activity_code+subject_code+activity_description, summary_filtered_extract_measurements_final, mean, na.rm = TRUE, na.action="na.pass")

## Write the final tidy data
write.csv(avg_tidy_day_2, file = "tidy2.txt", row.names=FALSE)

