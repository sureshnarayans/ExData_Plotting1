## May 8th Submission
## Before running the below program, Please download the required data set from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Extract the household_power_consumption.txt file, containing the data for this program and store in same directory as this program
colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
requiredDataSet<-read.table("household_power_consumption.txt",sep=";",col.names=colNames,skip=66637,nrows=2880,stringsAsFactors=TRUE)
additionalDataset<-read.table("household_power_consumption.txt",sep=";",col.names=colNames,skip=69517,nrows=1,stringsAsFactors=TRUE)
fullDataSubset <- rbind(requiredDataSet,additionalDataset)

Sys.setlocale("LC_ALL","C")

fullDataSubset$Time <- as.POSIXct(strptime(paste(fullDataSubset$Date,fullDataSubset$Time),"%d/%m/%Y %H:%M:%S"))
a <- range(fullDataSubset$Time)


png(file = "plot4.png", width=480,height=480,bg = "transparent")
par(mfrow = c(2, 2))
with(fullDataSubset, {
        plot(fullDataSubset$Time,fullDataSubset$Global_active_power,type = 'l',xaxt = "n",col=colors()[24],xlab = "", ylab = "Global Active Power")
        axis.POSIXct(1,at=seq(a[1],a[2],by="days"),format(a,"%a"))
        
        plot(fullDataSubset$Time,fullDataSubset$Voltage,type = 'l',xaxt = "n",col=colors()[24],xlab = "datetime", ylab = "Voltage")
        axis.POSIXct(1,at=seq(a[1],a[2],by="days"),format(a,"%a"))
        
        plot(fullDataSubset$Time,fullDataSubset$Sub_metering_1,type = 'l',xaxt = "n",col=colors()[24],xlab = "", ylab = "Energy Sub metering")
        lines(fullDataSubset$Time,fullDataSubset$Sub_metering_2, type='l', col=colors()[552])
        lines(fullDataSubset$Time,fullDataSubset$Sub_metering_3, type='l', col=colors()[26])
        legend("topright",lty=par("lty"),border="black",pt.bg = "white",bty = 1,box.lty= 0,box.col=1,inset=0.02,cex=0.8,pt.cex=1:3,col = c(colors()[24], colors()[552],colors()[26]), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        axis.POSIXct(1,at=seq(a[1],a[2],by="days"),format(a,"%a"))
        
        plot(fullDataSubset$Time,fullDataSubset$Global_reactive_power,type = 'l',xaxt = "n",col=colors()[24],xlab = "datetime", ylab = "Global_reactive_power")
        axis.POSIXct(1,at=seq(a[1],a[2],by="days"),format(a,"%a"))
        
})

dev.off() ## close the PNG device!