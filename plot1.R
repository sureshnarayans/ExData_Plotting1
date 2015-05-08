## May 8th Submission
## Before running the below program, Please download the required data set from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Extract the household_power_consumption.txt file, containing the data for this program and store in same directory as this program
colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
requiredDataSet<-read.table("household_power_consumption.txt",sep=";",numerals=c("allow.loss"),col.names=colNames,skip=66637,nrows=2880,stringsAsFactors=TRUE)
png(file = "plot1.png", width=480,height=480,bg = "transparent")
hist(requiredDataSet$Global_active_power,col=colors()[552],main = "Global Active Power",xlab = "Global Active Power(kilowatts)",ylab="Frequency")
dev.off() ## Don't forget to close the PNG device!