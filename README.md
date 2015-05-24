# Getting_and_Cleaning_Data
Repository for the Getting and Cleaning Data class on Coursera

Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


Good luck!



#run_analysis.R
This R script will download the required data for the project from the URL above.
It will then store the data in a folder in your current working directory.
It loads the features.txt file to be used as the features and also loads the X_train.txt, y_train.txt and subject_train.txt files.

The X_test file contains data using the feature data set.
The y_test file contains the activity labels.
The subject_test file contains the ids for the data.

The data then merges the train and test data sets and rearranges the data by id.

Finally, the script saves the mean and std for the features into the mean_and_std.txt file stored in the results folder. It also saves the tidy dataset into the results folder.

