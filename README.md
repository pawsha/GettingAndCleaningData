## Getting And Cleaning Data : Course Project

### Introduction
This repository contains the code and other files which are related to the Course Project.

The purpose of the project is to exercise learnings on data collection and cleaning activities.

Following are the main steps, which served as instructions for the project:-

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Project Goal
The goal of the Project was to download the source files in their raw format, analysis the separate files and find their associations in order to make a meaningful set of data. The data for means and standard deviations was then extracted from the dataset and identifiers (activities) given meaningful descriptions.

The columns of the source data (V1,V2….) were then updated to the appropriate description feature names. Finally the transformed (i.e. tidy) dataset was written to a file tidy_Data.txt

### Project Files
The project involved sourcing the source data sets from UCI HAR Dataset. The other files pertain to the activities that were undertaken during the project. A brief summary follows:-

- README.md > This file, summarising the repository
- run_analysis.R > The R script that processes the source data sets, merges, cleans (i.e. names columns and apply values to columns), extracts the relevant columns (as instructed in the course details) and prepares the final dataset containing means of mean & std columns.
- tidy_data.txt > This is the final output of the R script program containing means of mean & std columns per subject and activity.
- CODEBOOK.md > Describes the data transformation steps and the relationships between the original source file and the final tidy_data.txt output file.

### Original Source
Courtsey of UCI HAR, the data set was provided by UCI HAR website.
UCI HAR website can be found here (<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>)
Original datasets used can be obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### References
UCI HAR website can be found here (<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>)

Credits for Original datasets:-

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.