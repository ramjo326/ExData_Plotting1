

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


##Plot1
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))

png(filename = "plot1.png", width=480, height=480)                                             ##sets the plot file typr, name and dimensions

hist(subData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()






