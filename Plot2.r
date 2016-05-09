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


#Saving the second plot in plot2.png
png("plot2.png",bg = "transparent")

plot(vLengDur,gapExt,type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, lengDur/2, lengDur), labels=c("Thu.", "Fri.", "Sat."))

dev.off()

