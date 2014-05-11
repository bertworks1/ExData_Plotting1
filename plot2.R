## Plot 2

## Generate a plot of global active power versus date/time.
##
## This script runs another script ("readHPC.R") to read in the 
## required data from a file and then generates the plot and saves 
## it to a file ("plot2.png") in the working directory. 
##
## Note 1: It is assumed that this script will be run in an
##         environment where plotting parameters have not been 
##         changed from the defaults. If parameters have been
##         changed prior to running this script, the resulting
##         plot may not have the desired appearance.
## Note 2: The plot parameters used in this script (labels, 
##         colors, etc.) are specified to match a reference plot.
## Note 3: File "readHPC.R" and the data file it reads are 
##         assumed to be in the working directory.
## Note 4: This code is designed to plot to the screen and then 
##         copy the plot to the png file. It is assumed that the
##         screen is the active graphics device. It was tested
##         under Windows 7. 

    source("readHPC.R")

    plot(powerData$DateTime, powerData$Global_active_power, 
         type="l", xlab="", ylab="Global Active Power (kilowatts)")
         
    dev.copy(png, "plot2.png")
    dev.off()
    
