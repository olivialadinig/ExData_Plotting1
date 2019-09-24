library(lubridate)
my_data <- read.delim("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", dec=".")
my_data$Date<-as.Date(my_data$Date,"%d/%m/%Y")
epc<-subset(my_data, Date=="2007-02-01"|Date=="2007-02-02")
epc$DateTime<-ymd_hms(paste(epc$Date, epc$Time))
png(file="plot2.png",
    width=480, height=480)

plot(epc$DateTime, as.numeric(epc$Global_active_power), 
      type = "l",
      ylab="Global Active Power (kilowatts)",
      xlab = ""
)

dev.off()
