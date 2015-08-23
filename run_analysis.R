# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
# 
# A full description is available at the site where the data was obtained: 
#         
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Here are the data for the project: 
#         
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

########################################### Begin ###############################################
library(plyr)

run_analysis <- function (){
        # 1. Merges the training and the test sets to create one data set.
        # Use Test Sets to create test_data dataset. Column bind the activity and subject Ids
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
        names(subject_test) <- c("subject_id")
        x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
        names(y_test) <- c("activity_id")
        
        test_data <- cbind(subject_test, y_test, x_test)
        
        # Use Train Sets to create train_data dataset. Column bind the activity and subject Ids
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
        names(subject_train) <- c("subject_id")
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
        names(y_train) <- c("activity_id")
        
        train_data <- cbind(subject_train, y_train, x_train)
        
        # Combine the test_data and train data into one whole_data dataset using rbind()
        whole_data <- rbind(train_data, test_data)
        
        ##################################### Step 1 complete ############################################
        
        # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        
        # read in the activity labels info
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
        
        # read in the features info
        features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep = "")
        
        # Extract feature labels which have either mean or std in the label name.
        features_mean_std <- features[grep("[Mm]ean|[Ss]td", features$V2),]
        
        # The first two columns are subject_id and activity_id. We have to extract those mean & std columns from the 
        # whole_data using their index positions. Note that the index values vector from the features data set needs to be offset
        # by +2 because the whole_data data set have two extra columns in the front.
        whole_data_mean_std <- cbind(whole_data[, c(1,2)] , whole_data[,features_mean_std[,"V1"] + 2])
        
        ##################################### Step 2 complete ############################################
        
        # 3. Uses descriptive activity names to name the activities in the data set
        
        # Factor the existing activity_id using the activity_labels
        whole_data_mean_std$activity_id <- factor(whole_data_mean_std$activity_id,
                                                  levels = activity_labels$V1,
                                                  labels = activity_labels$V2)
        
        
        # Rename the activity_id column to activity as it is more reflective of the fact that the column now contains activity labels
        colnames(whole_data_mean_std)[2] <- c("activity")
        
        ##################################### Step 3 complete ############################################
        
        # 4. Appropriately labels the data set with descriptive variable names. 
        
        # Use the fearures_mean_std which contains the feature labels to rename the corresponding columns in the whole_data_mean_std
        colnames(whole_data_mean_std)[3:88] <- as.character(features_mean_std$V2) # First two columns are subject_id and activity, leaving them alone.
        
        ##################################### Step 4 complete ############################################
        
        # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
        # variable for each activity and each subject.
        
        tidy_data <- ddply(whole_data_mean_std, .(subject_id, activity), colwise(mean))
        
        # Sort on subject and activity
        tidy_data <- tidy_data[order(tidy_data$subject_id,
                                     desc(tidy_data$activity)),]
        
        ##################################### Step 5 complete ############################################
        
        # write the tidy_data into a file with column names
        write.table(tidy_data, file = "tidy_data.txt", quote = FALSE, sep = ";", row.names = FALSE)

}
