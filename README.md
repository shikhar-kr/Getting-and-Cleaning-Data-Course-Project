# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project
## R file
run_analysis.R
### Explanation

Change your Working directory to extraced one
> dir()
[1] "README.txt"          "activity_labels.txt" "features.txt"        "features_info.txt"  
[5] "test"                "train"

load library dplyr

1. Merge the training and the test sets to create one data set.

2. Extract only the measurements on the mean and standard deviation for each measurement.
Use regular expression to find mean and std and select them

3. Uses descriptive activity names to name the activities in the data set
Use activity labels

4. Appropriately labels the data set with descriptive variable names.
use other descritive labels for rest of the dataset

5. From the data set in step 4, creates a second, independent tidy data set 
Use group by and summarise to get the average of each variable for each activity and each subject.

## Tidy data
avg.txt
## Code Book
codebook.md
