requiredDataSet<-read.table("household_power_consumption.txt",sep=";",numerals=c("allow.loss"),col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=66637,nrows=2880,stringsAsFactors=TRUE)
png(file = "plot1.png", width=480,height=480,bg = "transparent")
hist(requiredDataSet$Global_active_power,col=colors()[552],main = "Global Active Power",xlab = "Global Active Power(kilowatts)",ylab="Frequency")
dev.off() ## Don't forget to close the PNG device!
