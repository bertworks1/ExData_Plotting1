## Plot 4

## Generate a plot containing a grid of sub-plots:
## - global active power versus date/time
## - voltage versus date/time
## - energy sub-metering data versus date/time
## - global reactive power versus date/time
##
## This script runs another script ("readHPC.R") to read in the 
## required data from a file and then generates the plot and saves 
## it to a file ("plot4.png") in the working directory. 
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

    meteringLegend = c("Sub_metering_1", 
                       "Sub_metering_2", 
                       "Sub_metering_3")
    
    oldPar = par(mfrow=c(2,2))
    
    with(powerData, {# --- upper left subplot ---
                     plot(DateTime, Global_active_power, 
                          type="l", xlab="", 
                          ylab="Global Active Power")
                     
                     # --- upper right subplot ---
                     plot(DateTime, Voltage, 
                          type="l", xlab="datetime", 
                          ylab="Voltage")
                     
                     # --- lower left subplot ---
                     plot(DateTime, Sub_metering_1, type="l", 
                          xlab="", ylab="Energy sub metering")
                     lines(DateTime, Sub_metering_2, col="red") 
                     lines(DateTime, Sub_metering_3, col="blue")
                     legend("topright", lty=1, bty="n", legend=meteringLegend, 
                            col=c("black", "red", "blue"), cex=0.95)
                     # (see note in file 'plot3.R' regarding the value  
                     #  of cex in the previous line)
                     
                     # --- lower right subplot ---
                     plot(DateTime, Global_reactive_power, 
                          type="l", xlab="datetime")
                     })
                     
    dev.copy(png, "plot4.png")
    dev.off() 
    
    par(oldPar)                     
                     
