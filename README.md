# Getting and Cleaning Data Week 4 Course Project

`CodeBook.md` file describes how to use the files contained in this repo, including descriptions regarding variables, data, and any transformation to clean up the original data.

`run_analysis.R` script file contains all the code to perform the analyses described in the week 4 course project assignment. This file could be launched in RStudio. Run the code in this file to see how it performs.

The five steps performed by the `run_analysis.R` script file is as below:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set.
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
The output file is called `tidy_data.txt`. It is included in this repo.
