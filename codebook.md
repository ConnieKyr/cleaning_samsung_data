######################
####
##
## CODEBOOK FOR THE SAMSUNG DATA CLEANING PROJECT



*Dataset that was analysed:*

The *Samsung data*, coming from the Human Activity Recognition Using Smartphones Dataset Version 1.0 were downloaded from the following 
repository:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

And their description can be found at this link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data contains measurements from experiments with 30 volunteers wearing smartphones that were recorded while the volunteers were doing certain
activities. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, the authors
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments had been video-recorded to label the data manually.
The obtained dataset was then randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Each record of the train and test dataset contained:
- All the measurements encoded as features, normalized and bounded within [-1,1]
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The exact descriptions of the names of the features are contained in the file features_info.txt.


*Data input*

The script run_analysis.R reads in the files:

- 'train/X_train.txt': Training set, containing 7352 rows of **561-feature vectors** of our variables 

- 'train/y_train.txt': Training **labels**, containing the 7352 activity labels for the train set, encoded as numbers

- 'train/subject_train.txt': containing the 7352 **subject** ids for the train set, encoded as numebrs

- 'test/X_test.txt': Test set, containing 2947 rows of **561-feature vectors** of our variables 

- 'test/y_test.txt': Test **labels**, containing the 2947 activity labels for the test set, encoded as numbers

- 'test/subject_test.txt': containing the 2947 **subject** ids for the train set, encoded as numbers

The script combines all these files into one dataset, binding by column first the label and the subject tables to their respective
561-feature table (train or test). Then the script binds train and test tables by row. The end result is a 10299 row table.
The files features.txt and activity_labels.txt are also read. The first is needed in order to get the descriptive variable names and also in order to extract the ones referring to the mean and the standard deviation.
The second file is needed to get the descriptive activity names.


*Variables used*
 
The script extracts then only a smaller subset of variables, the ones that refer to 66 mean() and std() feature names
from the 561-feature vectors. More particularly, the table from the features.txt file is queried for string matches to "mean(" or "std".
The parenthesis in "mean(" was put there so as not to get variables that contain the word mean in them (for example MeanFreq) -although the capitalization also makes that impossible. 
The indexes of the 66 mean and std measurements were kept, so that keeping only the columns with these indexes from the main data table of 10299 rows, and reattaching the labels and subjects columns gives a new table of tidy data, containing 10299 rows of only 68 variables.

*Other transformations performed*

Afterwards, the script performs other transformations, more particularly:

- Replaces the activity numbers with their corresponding labels taken from the activity_labels.txt file

- Replaces the 66 variable numbers with their corresponding descriptive names taken from the features.txt file
  (the make.names() command is used, because the descriptive names contain characters that are not allowed for column names)

- Replaces the dot characters that were produced from the make.names() command to make the column names cleaner

- From the tidy data set, the script creates a second, independent tidy data set with the average of each variable for each activity and    each subject, using the aggregate() function.

The output of the script, the latter independent tidy data set, is printed in the file summarizingTable.txt



 


