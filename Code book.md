# Code Book

## Temporary variables (overwritten when needed)
* location: File location of the corresponding file to be read
* temp1: Temporary data table that stores training set
* temp2: Temporary data table that stores test set
* x_train_test: Row bound training and test sets of variable 'x' defined in given file
* y_train_test: Row bound training and test sets of variable 'y' defined in given file
* subject_train_test: Row bound training and test sets of variable 'subjects' defined in given file
* features: Table of features listed in given file
* activity_labels: Table of activities listed in given file


## Variables used in loops
* i: Instantaneous subject id
* j: Instantaneous activity id
* row: Instantaneous row id used to store result (refer Other variables section)
* temp: Subset of cleaned data used to extract corresponding subject and activity combination

## Other variables
* good_feature_indices: Vector of indices of good features of 
* cleaned_data: Column bound subject_train_test, y_train_test and x_train_test
* unique_subjects: Unique values of subject id
* no_of_subjects: Length of unique subjects
* no_of_activity_labels: Length of unique activities
* no_of_columns: Number of columns of cleaned data
* result: Rows of all subjects and activities combinations, later modified into column means