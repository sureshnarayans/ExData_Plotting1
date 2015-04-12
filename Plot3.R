requiredDataSet<-read.table("household_power_consumption.txt",sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=66637,nrows=2880,stringsAsFactors=TRUE)
additionalDataset<-read.table("household_power_consumption.txt",sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=69517,nrows=1,stringsAsFactors=TRUE)
fullDataSubset <- rbind(requiredDataSet,additionalDataset)

Sys.setlocale("LC_ALL","C")

fullDataSubset$Time <- as.POSIXct(strptime(paste(fullDataSubset$Date,fullDataSubset$Time),"%d/%m/%Y %H:%M:%S"))


png(file = "plot3.png", width=480,height=480,bg = "transparent")

plot(fullDataSubset$Time,fullDataSubset$Sub_metering_1,type = 'l',xaxt = "n",col=colors()[24],xlab = "", ylab = "Energy Sub metering")
lines(fullDataSubset$Time,fullDataSubset$Sub_metering_2, type='l', col=colors()[552])
lines(fullDataSubset$Time,fullDataSubset$Sub_metering_3, type='l', col=colors()[26])


a <- range(fullDataSubset$Time)
axis.POSIXct(1,at=seq(a[1],a[2],by="days"),format(a,"%a"))
legend("topright", lty=par("lty"),col = c(colors()[24], colors()[552],colors()[26]), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off() ## close the PNG device!