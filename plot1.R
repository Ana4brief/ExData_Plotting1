data=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

dates=as.Date(as.character(data$Date),"%d/%m/%Y")
selected=data[dates>="2007-02-01" & dates<="2007-02-02",]

hist(as.numeric(selected$Global_active_power),col=2,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.copy(png,'plot1.png',width=480,height=480,unit="px")
dev.off()
