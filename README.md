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

#### - Loading Data
If we verified that there is no "UCI HAR Dataset" directory, download and decompress the data.
By `download.file` from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and then `unzip` the downloaded data.

#### - Generate worktables
  Extracting Data
   Train data
   Test data
   Features
   Activity labels
 
#### - Merge worktables to create a single data set

Merge the training and the test sets

#### -  Assign column names to the merged data
#### - From merge data, extract mean, std of measurements
#### - Label the data set with descriptive variable names
Name with Descriptive activity names
Labelling data set with descriptive variable names
#### - Write the tidy data set created to an output file
Getting Tidy Data 

All these actions are programmed in the script [run_analysis.R](https://github.com/gidago/Getting-and-Cleaning-Data/blob/master/run_analysis.R).

To execute this script in RStudio type in the console: source("run_analysis.R")

## The tidy data 

The final data frame `activityMeans` looks like this:

      Activity Subject tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z
    1  WALKING       1         0.2773308       -0.01738382        -0.1111481
    2  WALKING       2         0.2764266       -0.01859492        -0.1055004
    3  WALKING       3         0.2755675       -0.01717678        -0.1126749

This data frame is saved without headers to tidyData.txt

