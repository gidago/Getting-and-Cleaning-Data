# run_analysis.R
# 19-May-2015
# Coursera: Getting and Cleaning Data
#
#    === Get raw data ===
#    1.- Downloading and unzipping datafile
#    2.- Generate worktables (data sets)
#          - Train data
#          - Test data
#          - Features  
#          - Activity labels
#    3.- Merge worktables to create a single data set
#    === Operate ===
#    4.- Assign column names to the merged data
#    5.- From merge data, extract mean, std of measurements
#
# Load libraries
library(data.table)
# Setting working directory
#setwd("xxxx")
#------------------------------------------------------------------#
## 1. Downloading and unzipping data files
#------------------------------------------------------------------#
#     If there is input data directory, 
#     no download/unzipping  of data files are made.
if(!file.exists("UCI HAR Dataset")) {
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="./temp.zip", method="curl")
  unzip("temp.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir ="./", unzip = "internal", setTimes = FALSE)
} else {
  print("Input data directory already exists ...")
}
#------------------------------------------------------------------#
##  2. Generate worktables
#------------------------------------------------------------------#
print("Reading train  data")
train.x<-read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
train.y<-read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)
train.subject<-read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)

print("Reading test data")
test.x<-read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
test.y<-read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)
test.subject<-read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

print("Reading features and activity labels")
activity.labels<-read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)
feature.names<-read.table("./UCI HAR Dataset/features.txt",header = FALSE)
#------------------------------------------------------------------#
##  3. Merge worktables to create a single data set
#------------------------------------------------------------------#
print ("Merging the x and y data sets")
##train.data  <- cbind(train.subject, train.y, train.x) # "activity" is a KEY
##test.data   <- cbind(test.subject,  test.y , test.x)
##dataAll <- rbind(train.data, test.data)
X          <- rbind(train.x, test.x)
y          <- rbind(train.y, test.y)

subject_id <- rbind(train.subject, test.subject)

# free memory
#rm(test.data, train.data) 
#------------------------------------------------------------------#
#    4. Assign column names to the merged data
#------------------------------------------------------------------#
feature <- as.character(feature.names[[2]])
feature <- gsub("\\(|)","",feature)
feature <- gsub("-", "_",feature)
colnames(X) <- feature
#------------------------------------------------------------------#
#    5.- From merge data, extract mean, std of measurements
#------------------------------------------------------------------#
# Merge data, extract mean, std of measurements, 
#Select (filter) columns that contents mean or std
ind <- grep('mean|std', feature)    ## 86 features
X_sel <- X[,ind]
###### dplyr  ej.: select(mammals, contains("body"))
# and label variable names based on descriptive variable names

HARdata <- cbind(subject_id, y, X_sel)

colnames(HARdata)[1]  <- 'subjectID'
colnames(HARdata)[2] <- 'activity'

HARdata$activity <- factor(HARdata$activity, levels=activity_labels[[1]],
                           labels=as.character(activity_labels[[2]]))

# Extracting the measurements on the mean and standard deviation for each measurement
# Use descriptive activity names to name the activities in the data set.
# Updating the colNames vector to include the new column names after merge
colNames  = colnames(HARdata); 

# Cleaning up the variable names to make them more descriptive
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])        # quitar parentesis
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])   # sustituir tXXXXXX - time
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# reassigning the new descriptive column names to the finalData set
colnames(HARdata) = colNames;
# Label the data set with descriptive variable names.
# Create an independent tidy data set with the average of each variable 
# for each activity and each subject.
#finalData2  = HARdata[,names(HARdata) != 'activityType']
# Summarizing the finalData2 table to include only the average of each variable for each activity and each subject
#tidyData    = aggregate(finalData2[,names(finalData2) != c('activity','subjectId')],by=list(activity=finalData2$activity,subjectId = finalData2$subjectId),mean);
##
##
## Create a second tidy data set with 
## the average of each variable for each activity and each subject
##
###############################################################################
## group the data by Activity and Subject
activities <- group_by(HARdata, activity, subjectID)
## calculate the mean of each column
## within each group
activityMeans <- summarise_each(activities, funs(mean))
# Write the tidy data set created to an output file
write.table(activityMeans, './tidyData.txt',row.names=FALSE,sep='\t');


## remove old data sets from memory
#rm(testData)
#rm(trainData)
########### 
# dplyr approach: create a table grouped by Dest, and then summarise each group by taking the mean of ArrDelay
flights %>%
    group_by(Dest) %>%
    summarise(avg_delay = mean(ArrDelay, na.rm=TRUE))
    
# 1 aprox    
    activityMeans %>%
      group_by(activities) %>%
      summarise_each(funs(mean))
      
# for each carrier, calculate the percentage of flights cancelled or diverted
flights %>%
    group_by(UniqueCarrier) %>%
    summarise_each(funs(mean), Cancelled, Diverted)   
    
    
    # summarise with group_by:
head(summarise(group_by(mammals, order),
  mean_mass = mean(adult_body_mass_g, na.rm = TRUE)))

    
