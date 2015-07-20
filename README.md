# Coursera_GettingAndCleaningData_Project

The following code can be used to read in the data and view the tidy dataset:
```
data <- read.table(file_path, header = TRUE)
View(data)
```

run_analysis.R is the only script in this project.  It functions by first reading in the files for features, activity labels, subjects (test and train), X data (test and train) and Y data (test and train).  These data sets are combined together into one large dataset utilizing rbind and cbind. The indices for the mean and standard deviation variables were obtained from the features file and used to subset out the desired columns.  All variables that had mean() or std() in them were included. Activity numbers were replaced with the activity names and the columns were labeled with descriptive names for the variables.

The variable names are expansions of the variable names given in features.txt.  These were determined by utilizing information from features_info.txt.  For example tBodyAccMean()-X was expanded to Time Body Acceleration Mean X. By spelling out the entire variable name, there should be less room for confusion.