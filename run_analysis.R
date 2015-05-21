# run_analysis.R
# 21-May-2015
# Coursera: Getting and Cleaning Data
#
#    1.- Downloading and unzipping datafile
#    2.- Generate worktables (data sets)
#          - Train data
#          - Test data
#          - Features  
#          - Activity labels
#    3.- Assign column names to the merged data
#    4.- Extract mean, std of measurements
#    5.- Merge worktables to create a single data set
#    6.- Uses descriptive activity names to name the activities in the data set
#    7.- Label the data set with descriptive variable names
#    8. From the previous data set, creates a second, independent tidy data set 
#       set with the average of each variable for each activity and each subject
#    9.- Write the tidy data set created to an output file
#
# Load libraries
library(data.table)
# Setting working directory
pathToRawData <- "./UCI HAR Dataset"
#-----------------------------------------------------------------------------#
## 1. Downloading and unzipping data files
#-----------------------------------------------------------------------------#
#     If there is input data directory, 
#     no download/unzipping  of data files are made.
if(!file.exists("UCI HAR Dataset")) {
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="./temp.zip", method="curl")
  unzip("temp.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir ="./", unzip = "internal", setTimes = FALSE)
} else {
  print("Input data directory already exists ...")
}
#-----------------------------------------------------------------------------#
##  2. Generate worktables
#-----------------------------------------------------------------------------#
print("Reading train  data")
train.x       <-read.table(paste(pathToRawData,"/train/X_train.txt",       sep=""),header = FALSE)
train.y       <-read.table(paste(pathToRawData,"/train/y_train.txt",       sep=""),header = FALSE)
train.subject <-read.table(paste(pathToRawData,"/train/subject_train.txt", sep=""),header = FALSE)

print("Reading test data")
test.x       <-read.table(paste(pathToRawData,"/test/X_test.txt",           sep=""),header = FALSE)
test.y       <-read.table(paste(pathToRawData,"/test/y_test.txt",           sep=""),header = FALSE)
test.subject <-read.table(paste(pathToRawData,"/test/subject_test.txt",     sep=""),header = FALSE)

print("Reading features and activity labels")
activity.labels <-read.table(paste(pathToRawData,"/activity_labels.txt",     sep=""),header = FALSE)
feature.names   <-read.table(paste(pathToRawData,"/features.txt",            sep=""),header = FALSE)

print ("Merging the x and y data sets")
X          <- rbind(train.x, test.x)
y          <- rbind(train.y, test.y)
subject_id <- rbind(train.subject, test.subject)
# free memory - remove old data sets from memory
rm(train.x, test.x, train.y, test.y, train.subject, test.subject) 

#-----------------------------------------------------------------------------#
#    3. Assign column names to the merged data
#-----------------------------------------------------------------------------#
feature <- as.character(feature.names[[2]])
colnames(X) <- feature

#-----------------------------------------------------------------------------#
#    4.- Extract mean, std of measurements
#-----------------------------------------------------------------------------#
# Select (filter) columns that contents mean or std
selector <- grep('mean|std', feature)   
# Extracting the measurements on the mean and standard deviation for each measurement
X_sel <- X[,selector]

#-----------------------------------------------------------------------------#
##  5. Merge worktables to create a single data set
#-----------------------------------------------------------------------------#
dataMerged <- cbind(subject_id, y, X_sel)
# free memory - remove old data sets from memory
rm(X, subject_id, y, X_sel)
# Assign column names
colnames(dataMerged)[1] <- 'subjectID'
colnames(dataMerged)[2] <- 'activity'

#-----------------------------------------------------------------------------#
## 6.- Uses descriptive activity names to name the activities in the data set
#-----------------------------------------------------------------------------#
dataMerged$activity <- factor(dataMerged$activity, levels=activity.labels[[1]],
                           labels=as.character(activity.labels[[2]]))

#-----------------------------------------------------------------------------#
## 7. Label the data set with descriptive variable names
#-----------------------------------------------------------------------------#
# Create the colNames vector to include the new column names after merge
colNames  <- colnames(dataMerged)
# Cleaning up the variable names to make them more descriptive
for (i in 1:length(colNames)) 
{
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
};
# reassigning the new descriptive column names to the dataMerged data set
colnames(dataMerged) = colNames
#-----------------------------------------------------------------------------#
## 8. From the previous data set, creates a second, independent tidy data set 
##    set with the average of each variable for each activity and each subject
#-----------------------------------------------------------------------------#
# group the data by activity and subjectID
dataGrouped <- group_by(dataMerged, activity, subjectID)
# calculate the mean of each column within each group
activityMeans <- summarise_each(dataGrouped , funs(mean))
# free memory - remove old data sets from memory
rm(dataMerged, dataGrouped)

#------------------------------------------------------------------#
## 9. Write the tidy data set created to an output file
#------------------------------------------------------------------#
write.table(activityMeans, './tidyData.txt',row.names=FALSE,sep='\t')
