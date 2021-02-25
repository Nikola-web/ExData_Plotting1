Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259)
Data_Date <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
Data_Date$Date <- as.Date(Data_Date$Date, "%d/%m/%y")
Datetime <- paste(as.Date(Data_Date$Date), Data_Date$Time)
Data_Date$Datetime <- as.POSIXct(Datetime)
par(mfrow=c(2,2), mar=c(3,3,2,1), oma=c(0,0,2,0))
with(Data_Date, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="")
})
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
