# Getting and Cleaning Data - Project

## run_analysis.R
This section of the document describes how the run_analysis.R script works. UCI HAR Dataset folder is assumed to be the working directory. Temporary variables are used to store temporarily retrieved data from individual files. They are later overwritten to save memory. Indices of good features are retrieved and stored and are later used to subset the data tables.
On a high level, this script does the following:
1. Merges training and test sets to create one data set

2. Extracts measurements on mean and standard deviation for each measurement
3. Uses activity names given in the zip file to name the activities
4. Creates a tidy data set with the average of each variable for each activity and each subject

## Running the code
Perform the following steps in the console in the same order:
* setwd("<local directory>/UCI HAR Dataset")
* source("run_analysis.R")

## Steps involved in coding


1. For both the test and train datasets, use a temporary dataset:

* Get the list of activities from corresponding file in 'UCI HAR Dataset' directory
* Assign the activity labels to the table
* Get the list of subjects
* Assign the subject IDs to the table

2. Join the test and train interim datasets

3. Rejoin the table with key subject-acitivity pairs
4. Apply mean function to each vector of values in each subject-activity pair. This results in a clean dataset

5. Write the clean dataset to disk
