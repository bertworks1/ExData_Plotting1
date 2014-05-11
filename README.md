
## Notes about this repo:  

*[The assignment instructions have been moved to "original_README.md".]*

This repository contains code and png files developed for Course Project 1 for the Coursera Exploratory Data Analysis course.  
  
There are five R script files: one to read the data file and transform the data, and four to generate plots. Each of the plot generation files runs the the data reading/transforming file. See the comments in the files for additional details.  
  
  
### Input:  
  
The dataset used by the scripts is loaded from file "*household_power_consumption.txt*". This file is not included in this repo. It can be obtained by downloading and unzipping the following file:  
   [Household electric power consumption data](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)  
  
Alternatively, the data file can be obtained from the UCI Machine Learning Repository, along with details about the data and its source:  
   [Individual household electric power consumption Data Set](http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)  
  
  
### Output:  
  
The output plots were designed to match the reference plots in directory 'figure', except that the image sizes are 480 x 480 pixels as specified in the instructions. Two sets of plot files (.png) were generated. In one set the plots have transparent backgrounds, just as the reference plots do. The other set (indicated by '*_white*' in the file names) have white backgrounds, which some people may find easier to view. The background was altered using the *par(bg='white')* command; this command is not included in the scripts. The scripts will write the plot files to the working directory.  
  
  
### Assumptions:  
  
* The R package '*sqldf*' is installed.
* All script files are in the working directory.
* The data file is unzipped and located in the working directory.
* None of the par() options have been changed from the defaults.
  
