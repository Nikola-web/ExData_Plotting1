Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259)
Data_Date <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
Data_Date$Date <- as.Date(Data_Date$Date, "%d/%m/%y")
hist(Data_Date$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
