# 1. Merges the training and the test sets to create one data set.

## Before reading in datasets, download the files from project website following
## the link, and store the data in a path called "Week4_Project/UCI_HAR_Dataset"
## on the desktop.


## 1.1 Read in training datasets.
x_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")

## 1.2 Read in testing datasets.
x_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")

## 1.3 Read in feature vector
features <- read.table("UCI_HAR_Dataset/features.txt")

## 1.4 Read in activity labels
act_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")

## 1.5 Assign variable names
    ### Training
    colnames(x_train) <- features[, 2]
    colnames(y_train) <- "activity_id"
    colnames(subject_train) <- "subject_id"

    ### Testing
    colnames(x_test) <- features[, 2]
    colnames(y_test) <- "activity_id"
    colnames(subject_test) <- "subject_id"
    
    colnames(act_labels) <- c("activity_id", "activity_type")

## 1.6 Merge all datasets
merged_train <- cbind(y_train, subject_train, x_train)
merged_test <- cbind(y_test, subject_test, x_test)
final_data <- rbind(merged_train, merged_test)



# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement.
col_names <- colnames(final_data)

## Different from grep(), grepl() function returns a logical vector, which makes
## it easier to subset (based on conditions).

mean_std <- (grepl("activity_id", col_names) |
            grepl("subject_id", col_names) |
            grepl("mean", col_names) |
            grepl("std", col_names))

subset_mean_std <- final_data[, mean_std == TRUE]


# 3. Uses descriptive activity names to name the activities in the data set.

subset_activity <- merge(subset_mean_std, act_labels,
                         by = "activity_id",
                         all.x = TRUE)


# 4. Appropriately labels the data set with descriptive variable names. 

## This has been done in step 1 above.
## Use the same dataset in step 3 for step 5.


# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

activity_summary <- subset_activity %>%
        select(-activity_type) %>%
        group_by(subject_id, activity_id) %>%
        summarize_each(funs = mean)

write.table(activity_summary, "tidy_data.txt", row.names = FALSE, quote = FALSE)
