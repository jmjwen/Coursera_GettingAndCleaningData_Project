# Coursera_GettingAndCleaningData_Project

The following code can be used to read in the data and view the tidy dataset (tidydata.txt):
```
data <- read.table(file_path, header = TRUE)
View(data)
```

run_analysis.R is the only script in this project.  It functions by first reading in the files for features, activity labels, subjects (test and train), X data (test and train) and Y data (test and train).  These data sets are combined together into one large dataset utilizing rbind and cbind. The indices for the mean and standard deviation variables were obtained from the features file and used to subset out the desired columns.  All variables that had mean() or std() in them were included. Activity numbers were replaced with the activity names and the columns were labeled with descriptive names for the variables.

The variable names are expansions of the variable names given in features.txt.  These were determined by utilizing information from features_info.txt.  For example tBodyAccMean()-X was expanded to Time Body Acceleromator Mean X. By spelling out the entire variable name, there should be less room for confusion.

The tidy data set (tidydata.txt) was created by first initializing a data frame with a column called "Average" with all the types of averages that are being done (one row each for average over each subject and average over each activity).  The rest of the columns of the dataset are then generated using a for loop.  This for loop iterates over the columns of data_sub and calculates the mean of that column for each subset (each subject and each activity).  The resulting two arrays (one each for subjects and activity) are then concatenated together and added as a new column in the tidy data set with the same column name it originated from.