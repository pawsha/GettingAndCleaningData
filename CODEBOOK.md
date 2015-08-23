
### CODEBOOK - GETTING AND CLEANING DATA PROJECT


#### PROJECT DESCRIPTION
-	The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.


#### PROJECT GOAL
-	The goal is to prepare tidy data that can be used for later analysis. 


#### PROJECT OBJECTIVES
-	Produce a tidy dataset  
-	A link to a Github repository with script for performing the analysis
-	A code book  (CodeBook.md) that 
    - Describes the variables
    - The data
    - Any transformations or work that was performed to clean up the data
-	A README.md file that explains how all of the scripts work and how they are connected.  

<br>

#### DEPENDENCIES
-	DATA
	UCI HAR Dataset **(Human Activity Recognition Using Smartphones Data Set Version 1.0)**

	<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

#### LIBRARIES USED

  plyr
  

#### RUNNING THE ANALYSIS (TRANSFORMATIONS):

There is only one R script: run_analysis.R and it contains only one function called run_analysis(). 

In order to run the script, please ensure that source data files are extracted as is under the working directory. There is also a dependency on plyr package.

**About the data**

There are two "types" of data sets: test and train data that is obtained from anonymised subjects. The data set pertains to tracking various activities of subjects using Samsung Galaxy smartphone.

R script called run_analysis.R performs the following activities in order:-

<br>
Step 1 Load data sets and combine

- Loads subject_test data, X_test data and y_test data into corresponding variables
- Renames the subject_test column to "subject_id"
- Renames the y_test column to "activity_id"
- Prepares the test_data dataframe that combines the subject_id, activity_id and all measurements from X_test dataset's values
- All four previous steps are performed for the train datasets and the train_data is prepared.
- Both test_data and train_data are combined into one whole data set into a variable called whole_data
    
<br>

Step 2 - Extracts only the mean and std measurement columns

- Loads the activity labels from activity_labels.txt
- Loads the features labels from the feature.txt

    *features.txt provides the column names for the measurements dataset provided in the X_test & X_train datasets*

- Using the grep function on the features dataset, prepares a dataframe containing only the columns that contain either [mM]ean or [sS]td. There are a total of 86 such columns from a tota of 561 measurements columns that are now relevant for us.
- Using the whole_data the first two columns are extracted (representing subject_id and activity_id) and those 86 columns. This is stored into a new variable called whole_data_mean_std. 


    *This whole_data_mean_std dataset now contains all the relevant data variables for the remainder of the exercise*
    
<br>

Step 3 - Applies descriptive activity names to the activity_id column

- Using the activity Id and names from the activity dataframe, and using the factor function the activity_id column in the whole_data_mean_std is updated with activity names
    - 1 = WALKING
    - 2 = WALKING_UPSTAIRS
    - 3 = WALKING_DOWNSTAIRS
    - 4 = SITTING
    - 5 = STANDING
    - 6 = LAYING
- Change the column name from activity_id to activity

<br>

Step 4 - Labels the measurement columns with the appropriate names

- The meausrement columns are available from the features_mean_std (after grep'ing)
- Note that the first two columns represent subject_id and activity, so only columns 3:88 are updated with new names

<br>

Step 5 - Prepares the tidy_data dataset using the ddply method, calculating mean for each of the 86 measurement columns

- Using ddply, calculates the mean for 86 columns and groups by subject_id and activity, storing the output in the tidy_data variable.
- Applies ordering to the tidy_data on subject_id and activity for an ordered output.

Step 6 - Write the output to the tidy_data.txt file

- Using write.table function, write the tidy_data into the file using semicolumn as separators (column names may contain comma).
    
    *Note: row numbers are suppressed in the output file*

<br>

#### VARIABLES USED

- subject_test = Raw data from subject_test.txt file
- x_test = Raw data from X_test.txt file
- y_test = Raw data from y_test.txt file
- subject_train = Raw data from subject_train file
- x_train = Raw data from X_train.txt file
- y_train = Raw data from y_train.txt file
- test_data = dataframe with column bounded from subject_test + y_test + x_test
- train_data = dataframe with column bounded from subject_train + y_train + x_train
- whole_data = Union of test and train data into a single dataframe
- activity_labels = Raw data from activity_labels.txt file
- features = Raw data from features.txt file
- features_mean_std = dataframe containing subsetted feature labels from feature dataframe
- whole_data_mean_std = A column subsetted dataframe from whole_data dataset using features_mean_std as a source for columns of interest
- tidy_data = Final dataframe that contains the mean of all 86 measurement columns per subject and activity



#### REFERENCES:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

