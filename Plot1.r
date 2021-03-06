################################################################################
### This script plots the graphs of the first project assignment accounting 
### for the Coursera Exploratory Data Analysis course. 
###
### The script was developped May 8, 2016 by Fran�ois AKOA
################################################################################

#Reading the uncompressed data
# Clear Workspace
rm(list=ls())

# Reset Chart Styles
dev.off()

# Declare Constants
data.file <- "household_power_consumption.txt"

# Download + Unzip File
if (!file.exists(data.file)){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", method="curl")
  unzip("data.zip")
  file.remove("data.zip")
}

hpc <- read.csv(data.file, header= T, na.strings ="?" ,sep=";")

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

