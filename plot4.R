

# Clean up workspace
rm(list=ls())

##download the dataset from the given URL

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./data_power_consumption.zip")) {                       ##check if file exists in working directory
  download.file(fileUrl,destfile = "data_power_consumption.zip")         ##download file if it does not exist
  unzip("data_power_consumption.zip")}                                   ##unzip the file



##Read and Subset data
dataFile <- "household_power_consumption.txt"  
fullData <- read.table(dataFile, header=TRUE, sep=";", dec=".")                                 ##Read Data
subData <- fullData[(fullData$Date=="1/2/2007") | (fullData$Date=="2/2/2007"),]                 ##extract relevant dates 

##Plot4
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
subData$Global_reactive_power <- as.numeric(as.character(subData$Global_reactive_power))
subData$Voltage <- as.numeric(as.character(subData$Voltage))
subData$Sub_metering_1 <- as.numeric(as.character(subData$Sub_metering_1))
subData$Sub_metering_2 <- as.numeric(as.character(subData$Sub_metering_2))
subData$Sub_metering_3 <- as.numeric(as.character(subData$Sub_metering_3))

png(filename = "plot4.png", width=480, height=480)                                             ##sets the file type, name and dimensions
par(mfrow=c(2,2))

plot(dateTime,subData$Global_active_power, type="l", xlab="", ylab="Global Active Power")      ##Plot 4.1

plot(dateTime,subData$Voltage, type="l", xlab="datetime", ylab="Voltage")                      ##Plot 4.2



plot(dateTime,subData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")           ##Plot 4.3
lines(dateTime,subData$Sub_metering_2,col="red")
lines(dateTime,subData$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1), bty="n")

plot(dateTime,subData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")   ##Plot 4.4


dev.off()







