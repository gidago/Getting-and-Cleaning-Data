# Getting-and-Cleaning-Data
Collecting and cleaning data for downstream analysis and sharing.

## Introduction
The goal of this project is to prepare a tidy data that can be used for later analysis. 
The work was done by a R scritp (run_analysis.R) to convert raw data into Tidy data set.

![Tidy Data](https://cloud.githubusercontent.com/assets/6483001/7684670/3141045e-fd88-11e4-9b0c-5a9232842fc3.PNG)

This project tries to follow the guidelines given in  [“How to share data with a statistician”](https://github.com/jtleek/datasharing)

## Project files
|  | File  | Use |
|:-:|:--------       | -----:   |
| 1 | README.md      |This text |
| 2 | [run_analysis.R](https://github.com/gidago/Getting-and-Cleaning-Data/blob/master/run_analysis.R) |Script   |
| 3 | [Codebook.md](https://github.com/gidago/Getting-and-Cleaning-Data/blob/master/Codebook.md) |Variables description |
| 4 | tidyData.txt   |Result file |

## The raw data (data source)
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps (instruction list)

#### -Loading Data
If we verified that there is no "UCI HAR Dataset" directory, download and decompress the data.
By `download.file` from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and then `unzip` the downloaded data.

#### -Generate worktables
From the "UCI HAR Dataset" directory we get data from Train, Test, Features, Activity labels and then load it in the following tables by `read.table`.

train.x, train.y, train.subject, test.x, test.y, test.subject, activity.labels, feature.names

#### -Merge worktables to create a single data set

First merge *training set* and *test set* in the **X** data.frame, by rows, using `rbind`.
The same operation for *training labels* and *test labels* in the **y** data.frame.
Also create **subject_id** data.frame for subject of train and test, the same way as the previous two.
In a later step we will gather these three.

#### -Assign column names to the merged data

We create a vector of strings **feature** and the `colnames` function assign column names in the merged data.frame **X**.

#### -From previous data set (X), extract mean and std of measurements

For the extraction of measurements in the mean and standard deviation for each measurement, we create a vector **selector** applying a text search "mean" or "std" in the feature vector.
In the **X** data.frame, we subsetting the columns with vector **selector** (only contains columns with Mean value or Standard deviation) for get the data.frame **X_sel**.

#### -Uses descriptive activity names to name the activities in the data set

dataMerged$activity <- factor(dataMerged$activity, levels=activity.labels[[1]],
labels=as.character(activity.labels[[2]]))

#### -Label the data set with descriptive variable names


Name with Descriptive activity names
Labelling data set with descriptive variable names

colNames[i] <- gsub("\\(|)","",colNames[i])
colNames[i] <- gsub("-", "_",colNames[i])
colNames[i] <- gsub("\\()","",colNames[i])
colNames[i] <- gsub("_std$","StdDev",colNames[i])
colNames[i] <- gsub("_mean","Mean",colNames[i])
colNames[i] <- gsub("^(t)","time",colNames[i])
colNames[i] <- gsub("^(f)","freq",colNames[i])
colNames[i] <- gsub("([Gg]ravity)","Gravity",colNames[i])
colNames[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
colNames[i] <- gsub("[Gg]yro","Gyro",colNames[i])
colNames[i] <- gsub("AccMag","AccMagnitude",colNames[i])
colNames[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
colNames[i] <- gsub("JerkMag","JerkMagnitude",colNames[i])
colNames[i] <- gsub("GyroMag","GyroMagnitude",colNames[i])

#### -From the previous data set, creates a second, independent tidy data set
 
 set with the average of each variable for each activity and each subjec


#### -Write the tidy data set created to an output file
Getting Tidy Data 

All these actions are programmed in the script [run_analysis.R](https://github.com/gidago/Getting-and-Cleaning-Data/blob/master/run_analysis.R).

To execute this script in RStudio type in the console: source("run_analysis.R")
# group the data by activity and subjectID
dataGrouped <- group_by(dataMerged, activity, subjectID)
# calculate the mean of each column within each group
activityMeans <- summarise_each(dataGrouped , funs(mean))


## The tidy data 

The final data frame `activityMeans` looks like this:

      Activity Subject tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z
    1  WALKING       1         0.2773308       -0.01738382        -0.1111481
    2  WALKING       2         0.2764266       -0.01859492        -0.1055004
    3  WALKING       3         0.2755675       -0.01717678        -0.1126749

This data frame is saved without headers to tidyData.txt with `write.table` function.

