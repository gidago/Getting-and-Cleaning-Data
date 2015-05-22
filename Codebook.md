---
title: "Codebook for project Getting and Cleaning Data"
author: "student"
date: "22-May-2015"
output:
html_document:
keep_md: yes
---
 
## Project Description
The goal of this project is to prepare a tidy data that can be used for later analysis. The work was done by a R scritp (run_analysis.R) to convert raw data into Tidy data set.
 
##Study design and data processing
 
###Collection of the raw data
From README.txt in the "UCI HAR Dataset" directory, we get:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where **70%** of the volunteers was selected for generating the **training data** and **30%** the **test data**. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
 
###Notes on the original (raw) data
See `EADME.txt` and `features_info.txt` in the "UCI HAR Dataset" directory.
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
1. Downloading and unzipping datafile
2. Generate worktables (data sets)
 * Train data
 * Test data
 * Features  
 * Activity labels
3. Assign column names to the merged data
4. Extract mean, std of measurements
5. Merge worktables to create a single data set
6. Uses descriptive activity names to name the activities in the data set
7. Label the data set with descriptive variable names
8. From the previous data set, creates a second, independent tidy data set 
   set with the average of each variable for each activity and each subject
9. Write the tidy data set created to an output file
 
###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()
 
##Description of the variables in the tidyData.txt file
 
- Dimensions of the dataset: 180 obs. of  81 variables
- Variables present in the dataset

[ 1] "activity"                         
[ 2] "subjectID"                        
[ 3] "timeBodyAccMean_X"                
[ 4] "timeBodyAccMean_Y"                
[ 5] "timeBodyAccMean_Z"                
[ 6] "timeBodyAcc_std_X"                
[ 7] "timeBodyAcc_std_Y"                
[ 8] "timeBodyAcc_std_Z"                
[ 9] "timeGravityAccMean_X"
[10] "timeGravityAccMean_Y"             
[11] "timeGravityAccMean_Z"             
[12] "timeGravityAcc_std_X"             
[13] "timeGravityAcc_std_Y"             
[14] "timeGravityAcc_std_Z"             
[15] "timeBodyAccJerkMean_X"            
[16] "timeBodyAccJerkMean_Y"            
[17] "timeBodyAccJerkMean_Z"            
[18] "timeBodyAccJerk_std_X"            
[19] "timeBodyAccJerk_std_Y"
[20] "timeBodyAccJerk_std_Z"            
[21] "timeBodyGyroMean_X"               
[22] "timeBodyGyroMean_Y"               
[23] "timeBodyGyroMean_Z"               
[24] "timeBodyGyro_std_X"               
[25] "timeBodyGyro_std_Y"               
[26] "timeBodyGyro_std_Z"               
[27] "timeBodyGyroJerkMean_X"           
[28] "timeBodyGyroJerkMean_Y"           
[29] "timeBodyGyroJerkMean_Z"
[30] "timeBodyGyroJerk_std_X"           
[31] "timeBodyGyroJerk_std_Y"           
[32] "timeBodyGyroJerk_std_Z"           
[33] "timeBodyAccMagnitudeMean"         
[34] "timeBodyAccMagnitudeStdDev"       
[35] "timeGravityAccMagnitudeMean"      
[36] "timeGravityAccMagnitudeStdDev"    
[37] "timeBodyAccJerkMagnitudeMean"     
[38] "timeBodyAccJerkMagnitudeStdDev"   
[39] "timeBodyGyroMagnitudeMean"
[40] "timeBodyGyroMagnitudeStdDev"      
[41] "timeBodyGyroJerkMagnitudeMean"    
[42] "timeBodyGyroJerkMagnitudeStdDev"  
[43] "freqBodyAccMean_X"                
[44] "freqBodyAccMean_Y"                
[45] "freqBodyAccMean_Z"                
[46] "freqBodyAcc_std_X"                
[47] "freqBodyAcc_std_Y"                
[48] "freqBodyAcc_std_Z"                
[49] "freqBodyAccMeanFreq_X"
[50] "freqBodyAccMeanFreq_Y"            
[51] "freqBodyAccMeanFreq_Z"            
[52] "freqBodyAccJerkMean_X"            
[53] "freqBodyAccJerkMean_Y"            
[54] "freqBodyAccJerkMean_Z"            
[55] "freqBodyAccJerk_std_X"            
[56] "freqBodyAccJerk_std_Y"            
[57] "freqBodyAccJerk_std_Z"            
[58] "freqBodyAccJerkMeanFreq_X"        
[59] "freqBodyAccJerkMeanFreq_Y"
[60] "freqBodyAccJerkMeanFreq_Z"        
[61] "freqBodyGyroMean_X"               
[62] "freqBodyGyroMean_Y"               
[63] "freqBodyGyroMean_Z"               
[64] "freqBodyGyro_std_X"               
[65] "freqBodyGyro_std_Y"               
[66] "freqBodyGyro_std_Z"               
[67] "freqBodyGyroMeanFreq_X"           
[68] "freqBodyGyroMeanFreq_Y"           
[69] "freqBodyGyroMeanFreq_Z"
[70] "freqBodyAccMagnitudeMean"         
[71] "freqBodyAccMagnitudeStdDev"       
[72] "freqBodyAccMagnitudeMeanFreq"     
[73] "freqBodyAccJerkMagnitudeMean"     
[74] "freqBodyAccJerkMagnitudeStdDev"
[75] "freqBodyAccJerkMagnitudeMeanFreq"
[76] "freqBodyGyroMagnitudeMean"        
[77] "freqBodyGyroMagnitudeStdDev"      
[78] "freqBodyGyroMagnitudeMeanFreq"    
[79] "freqBodyGyroJerkMagnitudeMean"
[80] "freqBodyGyroJerkMagnitudeStdDev"  
[81] "freqBodyGyroJerkMagnitudeMeanFreq"

###activity (repeat this section for all variables in the dataset)
One of the six activities conducted by volunteers.
 
- Factor w/ 6 levels
- Levels of the variable:
1. WALKING                                             
2.  WALKING_UPSTAIRS                                    
3 WALKING_DOWNSTAIRS                                
4 SITTING                                         
5 STANDING                                       
6 LAYING     
- Unique values/levels of the variable
- Unit of measurement (if no unit of measurement list this as well)
- In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels).
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.
 
###subjectID
identifier of the volunteer who carried out the experiment
int
range is from 1 to 30

###features [3] to [81]

| (561)  | features  | feature vector with time and frequency domain variables  
num 
Features are normalized and bounded within [-1,1]

##Sources
"UCI HAR Dataset" directory and more detailed: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
