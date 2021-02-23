# Code book for Coursera Getting and Cleaning Data course project



__Source data:__

The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



__R Script (run_analysis.R):__

`run_analysis.R` file performs the 5 following steps:

1. Merges the training and the test sets to create one data set.
        1.1 Read in training datasets.
        1.2 Read in testing datasets.
        1.3 Read in feature vector
        1.4 Read in activity labels
        1.5 Assign variable names
        1.6 Merge all datasets

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



__Data:__

In summary, after running the code from run_analysis.R script file, the `features` dataset will contain the correct names for the `x_train` and `x_test` datasets.

`merged_train` is created through merging the `x_train`, `y_train`, and `subject_train` datasets. Similar for `merged_test`.

Merge `merged_train` and `merged_test` datasets to create `final_data`.

Create subsets based on instructions in step 3, called `subset_mean_std` and `subset_activity`.



__Variables:__

There are 561 variables in the original training and testing datasets.

See names of each variable in `features` dataset after running `run_analysis.R` script file.

A detailed description could be found in the `features_info.txt` file in the downloaded files.



