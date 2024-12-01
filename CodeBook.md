## Dataset Description
This dataset contains measurements derived from accelerometer and gyroscope sensors in wearable devices. The data has been processed, cleaned and summarized per subject and activity.

Raw data [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
). 

## Variables
* subject_id: identifier for the subject who performed the activity.
* activity_name: name of the activity performed
* averages of measurements variables: variables represent averages of the respective mean and standard deviation measures for each activity and subject from the raw data set.

## Transformations and Cleaning Steps
1. Merged train and test data sets into one.
2. Filtered out columns that were mean and standard deviation of respecitve measurements.
3. Filtered out special characters from column names to make it more R friendly.
4. Merged the measurement data set with activity names and subject ids.
5. Summarized the data set by grouping it by subject_id and and activity_mean, and calculated average for each measurement column.
