# This CodeBook describes the variables, the data, and any transformations or work that you performed to clean up the data

Variables
=========

The variables studied are:


- Subject -> Number of the subject studied (1,..,30)

- Activity -> Activity made by the subject (WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS, SITTING
, STANDING
, LAYING)



- Data from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
 
	
	For each feature of the following, there is a variable for the mean and standard deviation (Std) in each axis (X, Y, Z), some in time domain (starting with a t) and others in the frequency domain(starting with a f).
	
		tBody Accelerometer 	
		tGravity Accelerometer	
		tBody AccelerometerJerk	
		tBody Gyroscope	
		tBody GyroscopeJerk
		tBody Accelerometer Walking
		tGravity Accelerometer Walking
		tBody AccelerometerJerk Walking	
		tBody Gyroscope Walking	
		fBody Accelerometer 
		fBody AccelerometerJerk
		fBody Accelerometer
		fBody Gyroscope 
		fBody AccelerometerMag
	
	For each of the following, there is a variable for the the mean and standard deviation (Std):


		tBody AccelerometerMag
		tGravity AccelerometerMag
		tBody AccelerometerJerkMag
		tBody GyroscopeMag
		tBody GyroscopeJerkMag
		fBody AccelerometerMag
		fBodyBody AccelerometerJerkMag
		fBodyBody GyroscopeMag

Data
====

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


Transformations made to clean the data
======================================

The main steps realised to clean the data were: (see the script)

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Appropriately labels the data set with descriptive variable names. 
4. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

5. Use descriptive activity names to name the activities in the data set

Note 
======
- Features are normalized and bounded within [-1,1].