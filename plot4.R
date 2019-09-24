library(lubridate)
my_data <- read.delim("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", dec=".")
my_data$Date<-as.Date(my_data$Date,"%d/%m/%Y")
epc<-subset(my_data, Date=="2007-02-01"|Date=="2007-02-02")
epc$DateTime<-ymd_hms(paste(epc$Date, epc$Time))
png(file="plot4.png",
    width=480, height=480)


par(mfcol=c(2,2))

#Plot 1
plot(epc$DateTime, as.numeric(epc$Global_active_power), 
     type = "l",
     ylab="Global Active Power (kilowatts)",
     xlab = ""
)

#Plot 2
plot(epc$DateTime, as.numeric(epc$Sub_metering_1), 
     type = "l",
     ylab="Energy sub metering",
     xlab = ""
)
lines(epc$DateTime, as.numeric(epc$Sub_metering_2), 
      type = "l",
      col="red"
)
lines(epc$DateTime, as.numeric(epc$Sub_metering_3), 
      type = "l",
      col="blue"
)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

#Plot 3
plot(epc$DateTime, epc$Voltage, 
     type = "l",
     ylab="Voltage",
     xlab = "datetime"
)

#Plot 4
plot(epc$DateTime, epc$Global_reactive_power, 
     type = "l",
     ylab="Global_reactive_power",
     xlab = "datetime"
)

dev.off()
