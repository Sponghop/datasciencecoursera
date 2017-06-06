##1. Merges the training and the test sets to create one data set.
setwd("\\\\tsh.local/DFSRoot/Users/701344/My Documents/2017/Coursera 3/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
library(dplyr)
subject_train = read.table('./train/subject_train.txt',header=FALSE)
x_train = read.table('./train/x_train.txt',header=FALSE)
y_train = read.table('./train/y_train.txt',header=FALSE)
subject_test = read.table('./test/subject_test.txt',header=FALSE)

































