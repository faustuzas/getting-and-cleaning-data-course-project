library(dplyr)

# Read measurements data sets and merge it into one
x_train <- read.table(file.path("train", "X_train.txt"))
x_test <- read.table(file.path("test", "X_test.txt"))
x <- rbind(x_train, x_test)
rm(x_train, x_test)

# Filter out only necessary features
features <- read.table(file.path("features.txt"), stringsAsFactors = FALSE, col.names=c("feature_id", "feature_name"))
mean_std_features <- grep("mean|std", features$feature_name, ignore.case = TRUE)
data <- x[, mean_std_features]

# Set column names and tidy them up
colnames(data) <- features$feature_name[mean_std_features]
colnames(data) <- gsub("\\()", "", colnames(data))
colnames(data) <- gsub("-", "_", colnames(data))
colnames(data) <- tolower(colnames(data))
rm(features, mean_std_features)

# Read results data sets and merge it into one
y_train <- read.table(file.path("train", "y_train.txt"), col.names = "activity_id")
y_test <- read.table(file.path("test", "y_test.txt"), col.names = "activity_id")
y <- rbind(y_train, y_test)
rm(y_train, y_test)

# Read subject data sets and merge it into one
subjects_train <- read.table(file.path("train", "subject_train.txt"), col.names = "subject_id")
subjects_test <- read.table(file.path("test", "subject_test.txt"), col.names = "subject_id")
subjects <- rbind(subjects_train, subjects_test)
rm(subjects_train, subjects_test)

# Bind all data sets into a single data set
data <- cbind(data, y, subjects)
rm(x, y, subjects)

# Merge data with activities to get human readable activity names
activities <- read.table(file.path("activity_labels.txt"), col.names = c("activity_id", "activity_name"))
data <- merge(data, activities, by="activity_id")
rm(activities)

# Summarize raw data
data_summary <- data %>%
  group_by(activity_name, subject_id) %>%
  summarise(across(-c("activity_id"), list(mean = mean)))

# Write summarized data into file
write.table(data_summary, row.names = FALSE, file="result.txt")