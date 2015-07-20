## Load the data files into R objects
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt", col.names=features$V2)
X_test <- read.table("X_test.txt", col.names=features$V2)
Y_train <- read.table("Y_train.txt")
Y_test <- read.table("Y_test.txt")

## Combine the data into one dataset
test <- cbind(X_test, Y_test)
test <- cbind(test, subject_test)
train <- cbind(X_train, Y_train)
train <- cbind(train, subject_train)
data <- rbind(test, train)

## Extract out the measurements on mean and standard deviation
index <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254,
           266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543, 562, 563)
colnames(data)[562] <- "Activity"
colnames(data)[563] <- "Subject"
data_sub <- data[,index]

## Name the activities in the set
for (i in 1:nrow(data_sub)) {
     data_sub$Activity[i] <- activity_labels[data_sub$Activity[i], 2]
}

## Label the columns with descriptive variable names
colnames(data_sub)[1] <- "Time Body Acceleromator Mean X"
colnames(data_sub)[2] <- "Time Body Acceleromator Mean Y"
colnames(data_sub)[3] <- "Time Body Acceleromator Mean Z"
colnames(data_sub)[4] <- "Time Body Acceleromator StDev X"
colnames(data_sub)[5] <- "Time Body Acceleromator StDev Y"
colnames(data_sub)[6] <- "Time Body Acceleromator StDev Z"
colnames(data_sub)[7] <- "Time Gravity Acceleromator Mean X"
colnames(data_sub)[8] <- "Time Gravity Acceleromator Mean Y"
colnames(data_sub)[9] <- "Time Gravity Acceleromator Mean Z"
colnames(data_sub)[10] <- "Time Gravity Acceleromator StDev X"
colnames(data_sub)[11] <- "Time Gravity Acceleromator StDev Y"
colnames(data_sub)[12] <- "Time Gravity Acceleromator StDev Z"
colnames(data_sub)[13] <- "Time Body Acceleromator Jerk Mean X"
colnames(data_sub)[14] <- "Time Body Acceleromator Jerk Mean Y"
colnames(data_sub)[15] <- "Time Body Acceleromator Jerk Mean Z"
colnames(data_sub)[16] <- "Time Body Acceleromator Jerk StDev X"
colnames(data_sub)[17] <- "Time Body Acceleromator Jerk StDev Y"
colnames(data_sub)[18] <- "Time Body Acceleromator Jerk StDev Z"
colnames(data_sub)[19] <- "Time Body Gyro Mean X"
colnames(data_sub)[20] <- "Time Body Gyro Mean Y"
colnames(data_sub)[21] <- "Time Body Gyro Mean Z"
colnames(data_sub)[22] <- "Time Body Gyro StDev X"
colnames(data_sub)[23] <- "Time Body Gyro StDev Y"
colnames(data_sub)[24] <- "Time Body Gyro StDev Z"
colnames(data_sub)[25] <- "Time Body Gyro Jerk Mean X"
colnames(data_sub)[26] <- "Time Body Gyro Jerk Mean Y"
colnames(data_sub)[27] <- "Time Body Gyro Jerk Mean Z"
colnames(data_sub)[28] <- "Time Body Gyro Jerk StDev X"
colnames(data_sub)[29] <- "Time Body Gyro Jerk StDev Y"
colnames(data_sub)[30] <- "Time Body Gyro Jerk StDev Z"
colnames(data_sub)[31] <- "Time Body Acceleromator Magnitude Mean"
colnames(data_sub)[32] <- "Time Body Acceleromator Magnitude StDev"
colnames(data_sub)[33] <- "Time Gravity Acceleromator Magnitude Mean"
colnames(data_sub)[34] <- "Time Gravity Acceleromator Magnitude StDev"
colnames(data_sub)[35] <- "Time Body Acceleromator Jerk Magnitude Mean"
colnames(data_sub)[36] <- "Time Body Acceleromator Jerk Magnitude StDev"
colnames(data_sub)[37] <- "Time Body Gyro Magnitude Mean"
colnames(data_sub)[38] <- "Time Body Gyro Magnitude StDev"
colnames(data_sub)[39] <- "Time Body Gyro Jerk Magnitude Mean"
colnames(data_sub)[40] <- "Time Body Gyro Jerk Magnitude StDev"
colnames(data_sub)[41] <- "Fourier Body Acceleromator Mean X"
colnames(data_sub)[42] <- "Fourier Body Acceleromator Mean Y"
colnames(data_sub)[43] <- "Fourier Body Acceleromator Mean Z"
colnames(data_sub)[44] <- "Fourier Body Acceleromator StDev X"
colnames(data_sub)[45] <- "Fourier Body Acceleromator StDev Y"
colnames(data_sub)[46] <- "Fourier Body Acceleromator StDev Z"
colnames(data_sub)[47] <- "Fourier Body Acceleromator Jerk Mean X"
colnames(data_sub)[48] <- "Fourier Body Acceleromator Jerk Mean Y"
colnames(data_sub)[49] <- "Fourier Body Acceleromator Jerk Mean Z"
colnames(data_sub)[50] <- "Fourier Body Acceleromator Jerk StDev X"
colnames(data_sub)[51] <- "Fourier Body Acceleromator Jerk StDev Y"
colnames(data_sub)[52] <- "Fourier Body Acceleromator Jerk StDev Z"
colnames(data_sub)[53] <- "Fourier Body Gyro Mean X"
colnames(data_sub)[54] <- "Fourier Body Gyro Mean Y"
colnames(data_sub)[55] <- "Fourier Body Gyro Mean Z"
colnames(data_sub)[56] <- "Fourier Body Gyro StDev X"
colnames(data_sub)[57] <- "Fourier Body Gyro StDev Y"
colnames(data_sub)[58] <- "Fourier Body Gyro StDev Z"
colnames(data_sub)[59] <- "Fourier Body Acceleromator Magnitude Mean"
colnames(data_sub)[60] <- "Fourier Body Acceleromator Magnitude StDev"
colnames(data_sub)[61] <- "Fourier Body Body Acceleromator Jerk Mean"
colnames(data_sub)[62] <- "Fourier Body Body Acceleromator Jerk StDev"
colnames(data_sub)[63] <- "Fourier Body Body Gyro Magnitude Mean"
colnames(data_sub)[64] <- "Fourier Body Body Gyro Magnitude StDev"
colnames(data_sub)[65] <- "Fourier Body Body Gyro Jerk Magnitude Mean"
colnames(data_sub)[66] <- "Fourier Body Body Gyro Jerk Magnitude StDev"

## Create tidy data set
### Initialize tidy data frame with identifiers for which activity or subject # the average is being done over
tidy_data <- data.frame(Average =c("Subject 1", "Subject 2", "Subject 3", "Subject 4", "Subject 5", "Subject 6", 
                                   "Subject 7","Subject 8", "Subject 9", "Subject 10", "Subject 11", "Subject 12", 
                                   "Subject 13","Subject 14", "Subject 15", "Subject 16", "Subject 17", "Subject 18", 
                                   "Subject 19", "Subject 20", "Subject 21", "Subject 22", "Subject 23", "Subject 24", 
                                   "Subject 25","Subject 26", "Subject 27", "Subject 28", "Subject 29", "Subject 30", 
                                   "Laying", "Sitting", "Standing", "Walking", "Walking Downstairs", "Walking Upstairs"))

### Calculate the means for each variable for each condition and add that to the tidy data frame
for (i in 1:66) {
     x <- tapply(data_sub[[i]], data_sub[[68]], mean)
     y <- tapply(data_sub[[i]], data_sub[[67]], mean)
     varname <- colnames(data_sub[i])
     tidy_data[[varname]] <- c(x,y)
}

### Output the data frame as a txt file
write.table(tidy_data, file = "tidydata.txt", row.names = FALSE)