#0. Get data

Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
ztest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
ztrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")


#1. Merges the training and the test sets to create one data set.

X <- rbind(Xtrain, Xtest)
y <- rbind(ytrain, ytest)
z <- rbind(ztrain, ztest)

#2. Uses descriptive activity names to name the activities in the data set.

names(X) <- read.table("./UCI HAR Dataset/features.txt")[,2]

#3. Extracts only the measurements on the mean and standard deviation for each measurement. 

X2 <- X[, rbind(grep("mean()" , names(X), value=TRUE),  grep("std", names(X), value=TRUE))]

#4. Appropriately labels the data set with descriptive variable names. 

names(X2) <- gsub("-", "", names(X2))
names(X2) <- gsub("mean", " Mean", names(X2))
names(X2) <- gsub("std", " Std", names(X2))
names(X2) <- gsub("Acc", " Accelerometer", names(X2))
names(X2) <- gsub("Gyro", " Gyroscope", names(X2))
names(X2) <- gsub("1", " Walking", names(X2))

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

X3 <- cbind(y, z, X2)
names(X3)[2] <- "Subject"
names(X3)[1] <- "Activit"
Xtidy <- aggregate(X3, by=list(as.numeric(z[,]), as.character(y[,])), FUN= mean, na.rm=TRUE)[3:96]

Activity <- gsub("1", "WALKING", data.matrix(Xtidy$Activit))
Activity <- gsub("2", "WALKING_UPSTAIRS", Activity)
Activity <- gsub("3", "WALKING_DOWNSTAIRS", Activity)
Activity <- gsub("4", "SITTING", Activity)
Activity <- gsub("5", "STANDING", Activity)
Activity <- gsub("6", "LAYING", Activity)
Xtidy <- cbind(data.frame(Activity), Xtidy[,2:94])

write.table(Xtidy, file = "tidydata.txt", row.name=FALSE, sep = " ")
