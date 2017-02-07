# Working directory is the downloaded and extracted directory
#> dir()
#[1] "README.txt"          "activity_labels.txt" "features.txt"        "features_info.txt"  
#[5] "test"                "train"

library(dplyr)

####### 1. Merges the training and the test sets to create one data set.

# read test data
test_X <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

# read train data
train_X <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")

# merge
X<-rbind(test_X,train_X)
y<-rbind(test_y,train_y)
subject<-rbind(test_subject,train_subject)

####### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

mean_or_std_features <- grep("(mean|std).*\\(\\)", features[, 2])

X_mean_or_std <- X[,mean_or_std_features]

####### 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")

y[, 1] <- activity_labels[y[, 1], 2]

####### 4. Appropriately labels the data set with descriptive variable names.

names(X_mean_or_std) <- features[mean_or_std_features, 2]
names(subject) <- "subject"
names(y) <- "activity"

####### 5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

all <- cbind(subject, y, X_mean_or_std)

avg <- all %>% group_by(subject,activity) %>% summarise_each(funs(mean))

