
require(dplyr)
require(tidyr)
require(stringr)


########################################################
#Assignment Requirement 1: Merges the training and the test sets to create one data set
#reading in all the needed data files
#
#train data
xTrain<-read.table('train/X_train.txt')
yTrain<-read.table('train/y_train.txt')
sTrain<-read.table('train/subject_train.txt')
#
#test data
xTest<-read.table('test/X_test.txt')
yTest<-read.table('test/y_test.txt')
sTest<-read.table('test/subject_test.txt')
#
#additional data
feat<-read.table("features.txt")
activity<-read.table("activity_labels.txt")
#
#merging tables
allTrain<-cbind(xTrain,yTrain)
allTrain<-cbind(allTrain,sTrain)
#
allTest<-cbind(xTest,yTest)
allTest<-cbind(allTest,sTest)
#
allData<-rbind(allTrain,allTest)
#
#renaming the newly added columns to avoid column name clashes
colnames(allData)[562]<-"labels"
colnames(allData)[563]<-"subjects"


########################################################
#Assignment Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement
#keeping only the feature names that contain the means and stds of variables
selectFeat<-feat %>% filter(str_detect(V2, "mean\\(|std"))
tidyData<-allData %>% select(selectFeat$V1, labels, subjects)


########################################################
#Assignment Requirements 3 & 4: Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#
#changing the activity labels for the label column
tidyData$labels<-as.factor(tidyData$labels)
tidyData$subjects<-as.factor(tidyData$subjects)
activity$V2<-as.factor(activity$V2)
levels(tidyData$labels)<-activity$V2
#
#fixing the variable names
colnames(tidyData)[1:66]<-make.names(as.character(selectFeat$V2))
colnames(tidyData)[1:66]<-str_replace_all(colnames(tidyData)[1:66], "\\.", "")


########################################################
#Assignment Requirement 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
#data frame summarizing the mean of every variable for each activity per subject
summarizingTable<-aggregate(tidyData[, 1:66], list(Activity=tidyData$labels, Subject=tidyData$subjects), mean)


########################################################
#
write.table(summarizingTable, "summarizingTable.txt", row.name=FALSE) 


