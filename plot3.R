## Plot 3

## Generate a plot of sub-metering data versus date/time.
##
## This script runs another script ("readHPC.R") to read in the 
## required data from a file and then generates the plot and saves 
## it to a file ("plot3.png") in the working directory. 
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

    with(powerData, {plot(DateTime, Sub_metering_1, type="l", 
                          xlab="", ylab="Energy sub metering")
                     lines(DateTime, Sub_metering_2, col="red") 
                     lines(DateTime, Sub_metering_3, col="blue")})
                     
    # In the next line, cex is set to 0.95 to prevent clipping of the 
    # text when copying to the png file. The default value of cex=1
    # works fine for the Windows screen device, but when using 
    # dev.copy(), the legend text gets rescaled improperly and some 
    # of the text is chopped off. When plotting directly to a png 
    # file instead of plotting to the screen and then copying, this 
    # doesn't seem to be a problem. 
    
    legend("topright", lty=1, col=c("black", "red", "blue"), cex=0.95, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
           
    dev.copy(png, "plot3.png")
    dev.off() 

