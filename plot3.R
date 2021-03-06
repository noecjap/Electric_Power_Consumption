epc <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
epcr <- subset(epc,epc$Date=="1/2/2007" | epc$Date =="2/2/2007")

# #Changing variables format
epcr$Date <- as.Date(epcr$Date, format="%d/%m/%Y")
epcr$Time <- strptime(epcr$Time, format="%H:%M:%S")
epcr[1:1440,"Time"] <- format(epcr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
epcr[1441:2880,"Time"] <- format(epcr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#plot3

png("plot3.png", width=480,height=480,units="px")
with(epcr, plot(epcr$Time,epcr$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(epcr,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(epcr,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(epcr,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()