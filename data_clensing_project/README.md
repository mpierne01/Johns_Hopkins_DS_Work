Getting and Cleaning Data: Project
=========================================
#Author: Marc Pierne
#Date: 7/25/2015

Introduction
------------
This is the course project for the John Hopkins course "Getting and Cleaning data", for my Data Science work.


The data
------------------

The features (561 of them) are unlabelled and can be found in the x_test.txt.
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set.

The script and the tidy dataset
-------------------------------------
There is a script called run_analysis.R it merges the test and training sets together.
You will need to do the following first:

1. the UCI HAR Dataset must be extracted.
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
2. the UCI HAR Dataset must be available in the directory
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

The script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

The Code Book
-------------------
The CodeBook.md file has information on the transformations and the results.

The assignment information is below.
-------------------------------------
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
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

#Additional Work Tag Marc Pierne
