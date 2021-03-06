##1. Merges the training and the test sets to create one data set.
setwd("\\\\tsh.local/DFSRoot/Users/701344/My Documents/2017/Coursera 3/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
library(dplyr)
subject_train = read.table('./train/subject_train.txt',header=FALSE)
x_train = read.table('./train/x_train.txt',header=FALSE)
y_train = read.table('./train/y_train.txt',header=FALSE)
subject_test = read.table('./test/subject_test.txt',header=FALSE)
x_test = read.table('./test/x_test.txt',header=FALSE)
y_test = read.table('./test/y_test.txt',header=FALSE)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement
x_data_mean_std <- x_data[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
names(x_data_mean_std) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 

#3. Uses descriptive activity names to name the activities in the data set
y_data[, 1] <- read.table("activity_labels.txt")[y_data[, 1], 2]
names(y_data) <- "Activity"

#4. Appropriately labels the data set with descriptive variable names 
names(subject_data) <- "Subject"
single_data <- cbind(x_data_mean_std, y_data, subject_data)
names(single_data) <- make.names(names(single_data))
names(single_data) <- gsub('Acc',"Acceleration",names(single_data))
names(single_data) <- gsub('GyroJerk',"AngularAcceleration",names(single_data))
names(single_data) <- gsub('Gyro',"AngularSpeed",names(single_data))
names(single_data) <- gsub('Mag',"Magnitude",names(single_data))
names(single_data) <- gsub('^t',"TimeDomain.",names(single_data))
names(single_data) <- gsub('^f',"FrequencyDomain.",names(single_data))
names(single_data) <- gsub('\\.mean',".Mean",names(single_data))
names(single_data) <- gsub('\\.std',".StandardDeviation",names(single_data))
names(single_data) <- gsub('Freq\\.',"Frequency.",names(single_data))
names(single_data) <- gsub('Freq$',"Frequency",names(single_data))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
new_data<-aggregate(. ~Subject + Activity, single_data, mean)
new_data<-new_data[order(new_data$Subject,new_data$Activity),]
write.table(new_data, "new_data.txt", sep="\t", row.names = FALSE)




