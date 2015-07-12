data=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

dates=as.Date(as.character(data$Date),"%d/%m/%Y")
selected=data[dates>="2007-02-01" & dates<="2007-02-02",]

par(mfrow=c(2,2))
plot(selected$DateTime,as.numeric(selected$Global_active_power),type='l',xlab="",ylab="Global Active Power")
plot(selected$DateTime,selected$Voltage,type='l',xlab="datetime",ylab="Voltage")
plot(selected$DateTime,selected$Sub_metering_1,type='l',col="Black",xlab="",ylab="Energy sub metering")
lines(selected$DateTime,selected$Sub_metering_2,col="Red")
points(selected$DateTime,selected$Sub_metering_3,type='l',col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("Black","Red","Blue"),bty="n")
plot(selected$DateTime,as.numeric(selected$Global_reactive_power),type='l',xlab="datetime",ylab="Global Reactive Power",)
dev.copy(png,'plot4.png',width=480,height=480,unit="px")
dev.off()
