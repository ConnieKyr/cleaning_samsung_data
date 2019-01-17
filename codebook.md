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

- 'train/y_train.txt': Training **labels**, containing the 7352 activity labels for the train set

- 'train/subject_train.txt': containing the 7352 **subject** ids for the train set

- 'test/X_test.txt': Test set, containing 2947 rows of **561-feature vectors** of our variables 

- 'test/y_test.txt': Test **labels**, containing the 2947 activity labels for the test set

- 'test/subject_test.txt': containing the 2947 **subject** ids for the train set

The script combines all these files into one dataset, binding by column first the label and the subject tables to their respective
561-feature table (train or test). Then the script binds train and test tables by row. The end result is a 10299 row table.


*Variables used*
 
The script extracts then only a smaller subset of variables, the ones that refer to the mean() and std() measurements
from the 561-feature vectors

*Transformations performed*

The script run_analysis.R does the following...


 


