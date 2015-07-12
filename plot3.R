data=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

dates=as.Date(as.character(data$Date),"%d/%m/%Y")
selected=data[dates>="2007-02-01" & dates<="2007-02-02",]

selected$DateTime=strptime(paste(selected$Date, selected$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
plot(selected$DateTime,selected$Sub_metering_1,type='l',col="Black",xlab="",ylab="Energy sub metering")
lines(selected$DateTime,selected$Sub_metering_2,col="Red")
points(selected$DateTime,selected$Sub_metering_3,type='l',col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("Black","Red","Blue"))
dev.copy(png,'plot3.png',width=480,height=480,unit="px")
dev.off()
