## Getting and Cleaning Data Course Projectless

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


# run_analysis.R  performs the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# run_analysis.R explained and pre-work:
First use first line of code to set your working directory. This directory also need to contains all the files from the .zip file.

1. Loads the train and test data sets and combines these two datasets into one data frame. This is done using  rbind.
2. Extracts only mean and standard deviation for each measurement using grep function.
3. Set descriptive activity names to name the activities in the data set
4. After loading activities data set, it converts it to lower case using  tolower  and removes underscore using  gsub . activity and subject column names are named for y_data and subject_data.
5. The three data sets are merged. 
6. The mean of activities and subjects are created into a separate tidy data set which is exported into the Project folder as txt file: new_data.txt
