Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259)
Data_Date <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
Data_Date$Date <- as.Date(Data_Date$Date, "%d/%m/%y")
Datetime <- paste(as.Date(Data_Date$Date), Data_Date$Time)
Data_Date$Datetime <- as.POSIXct(Datetime)
with(Data_Date, plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()