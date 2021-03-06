################################################################################
### This script plots the graphs of the first project assignment accounting 
### for the Coursera Exploratory Data Analysis course. 
###
### Please ensure that you have set the path to the uncompressed data file  
### "household_power_consumption.txt" at line 11 below
###
### The script was developped May 8, 2016 by Fran�ois AKOA
################################################################################

#Reading the uncompressed data
    hpc <- read.csv("household_power_consumption.txt", header= T, na.strings ="?" ,sep=";")

#Transformed as data frame for easy manipulation
    hpc  <- as.data.frame(hpc)

#Transforming the Date variable into Class Date
    hpc$Date  <- as.Date(hpc$Date,"%d/%m/%Y") 
    
#Extracting the sub data needed for our analysis
    startDate <- as.Date("01/02/2007","%d/%m/%Y")
    endDate   <- as.Date("02/02/2007","%d/%m/%Y")
    hpcExt    <- hpc[hpc$Date == startDate | hpc$Date == endDate,]
    
#Shortuts on variables needed in the code

    gapExt <- hpcExt$Global_active_power
    grpExt <- hpcExt$Global_reactive_power
    hpcExtTime <- hpcExt$Time
    hpcExtDate <- hpcExt$Date
    lengDur  <- nrow(hpcExt)
    vLengDur <- 1:lengDur
    
    hpcExtSm1 <- hpcExt$Sub_metering_1
    hpcExtSm2 <- hpcExt$Sub_metering_2
    hpcExtSm3 <- hpcExt$Sub_metering_3
    hpcExtVol <- hpcExt$Voltage
    
#Saving the histogram in plot1.png
   
    png("plot1.png",bg = "transparent")
    hist(gapExt,col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power") 
    dev.off()
    
#Saving the second plot in plot2.png
    png("plot2.png",bg = "transparent")
    
    plot(vLengDur,gapExt,type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
    axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))
    
    dev.off()
   
#Saving the third plot in plot3.png
    png("plot3.png",bg = "transparent")
    
    plot(vLengDur,hpcExtSm1,xlab="",xaxt="n",ylab="Energy sub metering", type="n")
    lines(vLengDur,hpcExtSm1,col="black",type="l")
    lines(vLengDur,hpcExtSm2,col="red",type="l")
    lines(vLengDur,hpcExtSm3,col="blue",type="l")
    legend("topright", col = c("black","red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))
    
    dev.off()    

#Saving the fourth plot in plot4.png
    png("plot4.png",bg = "transparent")
    par(mfcol = c(2, 2))
    #
    plot(vLengDur,gapExt,type="l",xaxt="n",xlab="",ylab="Global Active Power")
    axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))
    
    plot(vLengDur,hpcExtSm1,xlab="",xaxt="n",ylab="Energy sub metering", type="n")
    lines(vLengDur,hpcExtSm1,col="black",type="l")
    lines(vLengDur,hpcExtSm2,col="red",type="l")
    lines(vLengDur,hpcExtSm3,col="blue",type="l")
    legend("topright", col = c("black","red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))
    #
    plot(vLengDur,hpcExtVol,xaxt="n",xlab="datetime",ylab="Voltage", type="l") 
    axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))
    plot(vLengDur,grpExt,type="l",xaxt="n",xlab="datetime",ylab="Global Reactive Power")
    axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))
    
    dev.off() 
####################
