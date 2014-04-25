Peer Review Assignment
======================

By Ram Subramanian

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Below are some of the devliverables for the project

1) A detailed tidy data set (tidy1.txt) that has the clean data set with 10,299 rows and 564 columns. This has the detail information for all the measurements, activity code, subject code and the activity description

2) A summarized tidy data set (tidy2.txt) that has the clean summarized data set with the average of each variable for each activity and each subject. The columns have been filtered out for key words mean and std. This dataset has 180 rows and 69 columns

3) a link to a Github repository with the script for performing the analysis


Code Description
==================
The script run_analysis.R performs the following tasks

1) Downloads the raw data set from the webserver and copies to the local working directory

2) Reads the local files by unzipping the folder.

3) Read Subject train from training data set

4) Add column name "subject_code" to train_subject

5) Read activity code from training dataset

6) Add column name "actiity_code" to train_activity_code

7) Column bind the train_suject and train_activity_code

8) Read the activity description file from training set

9) Add Column names to the activity description

10) Merge train_activity_subject_code and train_activity_descripion on activity_code Column

11) Read the X_train object from training data set

12) Read the features dataset from the training dataset

13) Select the features description column from train_features dataset

14) Select the description field from train_features

15) Add the train_features_desctpion as column header for train_dataset

16) Column bind train_dataset and train_activity_subject_code_description

17) Similar steps are done for the test data sets

18) Combine training and test dataset

19) Prepare tidy dataset 1

20) Reduce the columns in features by limiting to mean and std

21) Prepare the tidy data by summarizing each variable for each activity and each subject. 

22) Write the final tidy data set 2
