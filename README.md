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
| 2 | run_analysis.R |Script   |
| 3 | Codebook.md    |Variables description |
| 4 | tidyData.txt   |Result file |


## The raw data (data source)

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps (instruction list)
The script, `run_analysis.R`, does the following,

* Load the various files which make-up the UCI dataset
* Merges the three `test` and three `train` files into a single data table, setting textual columns heading where possible
* Creates a smaller second dataset, containing only mean and std variables
* Computes the means of this secondary dataset, group by subject/activity.
* Saves this last dataset to `./data/tidy_data.txt`

### Loading Data

### Merge the training and the test sets

### Extracting Data

### Name with Descriptive activity names

### Labelling data set with descriptive variable names

### Getting Tidy Data 


## Script  run_analysis.R 
The script that does the following. 

 1.  Merges the training and the test sets to create one data set.
 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
 3.  Uses descriptive activity names to name the activities in the data set
 4.  Appropriately labels the data set with descriptive variable names. 
 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.









