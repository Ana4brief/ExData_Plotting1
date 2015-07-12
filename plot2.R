data=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

dates=as.Date(as.character(data$Date),"%d/%m/%Y")
selected=data[dates>="2007-02-01" & dates<="2007-02-02",]

selected$DateTime=strptime(paste(selected$Date, selected$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
plot(selected$DateTime,as.numeric(selected$Global_active_power),type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png',width=480,height=480,unit="px")
dev.off()

