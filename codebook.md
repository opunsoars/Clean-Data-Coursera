# Course Project Code Book

The original dataset is available here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

HAR Data Project info: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:  

* It reads the training and test data files from the directory in which it is placed. It looks for the following files: X-train.txt, Y-train.txt, subject-train.txt in the /train/ folder, X-test.txt, Y-test.txt, subject-test.txt in the /test/ folder. It will then read the features.txt and activity_labels.txt from the home directory. All the read data is stored into variables using read.table command.  

* The training data that is stored has 7352 observations (measurements in the X dataframe have 561 variables) while the testing data has 2947 observations.  

* It now merges the training and test data frames using rbind command and simultaneously assigns column names for the X,Y, and S frames.  
      + The features data variable contains the 561 descriptions for the variables of measurement in X. These are assigned as the column names for X.   
      + Y and S are assigned the column names "Activity" and "Subject" respectively to reflect on their labels.   
 
* It now filters out the variable columns in X data frame that contain the word "mean ()" or "std ()". Thus the X data frame is now updated to consist only of the mean and standard deviations of the various measurements.Now the 561 variables reduce to just 66 in number. They would look like:  

    tbodyacc-mean-x 

    tbodyacc-mean-y 

    tbodyacc-mean-z 

    tbodyacc-std-x 

    tbodyacc-std-y 

    tbodyacc-std-z 

    tgravityacc-mean-x 

    tgravityacc-mean-y  

* The activities data contains 6 rows with 6 different activities for categorizing the measurement of data. The script now replaces the numbers in the Y column labels with the corresponding activity:  

    walking

    walkingupstairs

    walkingdownstairs

    sitting

    standing

    laying

* Now it merges the thre data frames X, Y, and S into a single cleaned data by the name mrg1 using cbind command. mrg1 is a data frame with 10299 observations of 68 variables in all.  

* Finally the aggregate command is used to reshape the data as per the requirement. The data is grouped based on each activity against each subject, and the mean value of each variable is computed. So, since there are 30 subjects and 6 activities, 180 instances are formed recording the average  measurement for each of the combinations. This is stored in a data frame called tidydata that has the dimensions 180 x 68.  

* The resultant tidydata is written to a text file usingg write.table command to export and view separately.

### Features info provided with the source HAR dataset

_The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz._ 

_Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)._ 

_Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)._ 

_These signals were used to estimate variables of the feature vector for each pattern:_  
_'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions._
