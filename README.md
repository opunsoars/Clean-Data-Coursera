Clean-Data-Coursera
===================

This repository contains the scripts and related files for the project module of the Coursera course "Getting and Cleaning Data" from John Hopkins University
---
title: "README"
author: "opunsoars"
date: "Sunday, November 23, 2014"
output: html_document
---


# Getting and Cleaning Data   
This is a GitHub repository created for the course project in the Getting and Cleaning Data Coursera course through Johns Hopkins University.   
In this R analysis, raw data is taken from the UCI HAR Dataset directory and cleaned and transformed using the run_analysis.R file. This repository contains the resulting clean data script, a codebook, the R analysis script, and the dataset folder. However you can get your own downloaded dataset.  

## Project - How to go about with the data analysis in this repo   

Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:\Users\yourname\Documents\R\   

Place the run_analysis.R into C:\Users\yourname\Documents\R\UCI HAR Dataset\ directory   

Set the directory for analysis and source the program script as follows:   

setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\")     
source("run_analysis.R")   

Use the command below to read the result sample from this repo (if downloaded) or to check your own result after the analysis.


data <- read.table("tidydata.txt")


It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. Note that the provided R script has no assumptions on numbers of records, only on locations of files.  
```{r}
#The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

#One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Here are the data for the project: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# You should create one R script called run_analysis.R that does the following. 
    #Merges the training and the test sets to create one data set.
    #Extracts only the measurements on the mean and standard deviation for each measurement. 
    #Uses descriptive activity names to name the activities in the data set
    #Appropriately labels the data set with descriptive variable names. 
    #From the data set in step 4, creates a second, independent tidy data set with the average of each variable       for each activity and each subject.
```
