## This script reads power consumption data from the input file 
## "household_power_consumption.txt", which is assumed to be located
## in the working directory. If the file does not exist, it can be 
## obtained by downloading and unzipping the zip file at this location: 
##   https://d396qusza40orc.cloudfront.net/
##      exdata%2Fdata%2Fhousehold_power_consumption.zip
##
## This is a copy of data housed in the UCI Machine Learning Repository. 
## Details about the data can be found in the repository:
##   http://archive.ics.uci.edu/ml/datasets/
##      Individual+household+electric+power+consumption
## 
## Note: This script utilizes the package 'sqldf', which must be
##       installed prior to running the script.

    library(sqldf)
    
    inputFile = "household_power_consumption.txt"
    
    # Use sqldf to read only the required data (i.e., data for the 
    # specified dates only).  
    
    # Specify the dates. The format must be D/M/Y to match the 
    # format in the input file.
    
    readDates = c("1/2/2007", "2/2/2007")
    
    # Build the SQL statement. This will handle any number of dates
    # in readDates, as long as there is at least one.
    
    readSQL = 
        paste("select * from file where Date=='", readDates[1], "'",
              paste(lapply(readDates[-1], 
                           function(x) ifelse(is.na(x), "", 
                                              paste(" or Date=='", x, 
                                                    "'", sep=""))),
                    collapse=""),
              sep="")


    # Specify all the fields as TEXT. This is done because the sqldf
    # read will not convert columns with both numeric data and 
    # non-numeric data (such as NA or '?') to type 'numeric'. So instead
    # of checking which columns have been converted and which haven't,
    # just read them all as "character" ("TEXT" in SQL) and then convert 
    # them all in a subsequent step.
    
    readTypes = list(Date="TEXT", Time="TEXT", Global_active_power="TEXT", 
                     Global_reactive_power="TEXT", Voltage="TEXT", 
                     Global_intensity="TEXT", Sub_metering_1="TEXT", 
                     Sub_metering_2="TEXT", Sub_metering_3="TEXT")

    # Read the data into a data frame:

    powerData = 
        read.csv.sql(inputFile, sql=readSQL, field.types=readTypes, sep=";")
    
    # Add a combined date/time field (of type POSIXlt) and convert the 
    # columns containing numeric data to type "numeric".
    
    powerData$DateTime = 
        strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
    
    powerData[,3:9] = suppressWarnings(lapply(powerData[,3:9], as.numeric))
    
    