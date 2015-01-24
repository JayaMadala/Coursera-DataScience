##Getting and Cleaning Data
#Course Project

You should create one R script called run_analysis.R that does the following.

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Steps in creating the tidy data set

 1. Download the UCI HAR datasets to my working directory.
 2. Create a run_analysis.r script file in my work directory.
 3. Load testing, training, activity and features datasets in to RStudio.
 4. Labels are added to the columns of the data sets.
 5. Extract Mean and Standard Deviation columns.
 6. Process the test and train data sets respectively.	
 7. Merge testing and training data sets.
 8. Create a Merged data set.
 9. Create tidy data set that contains the means of all the columns grouped by subject and activity which is available in this repository.
 
# Code Book

  The CodeBook.md contains more description about the data and the out data set.



