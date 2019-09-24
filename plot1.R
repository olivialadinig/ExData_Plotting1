my_data <- read.delim("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", dec=".")
my_data$Date<-as.Date(my_data$Date,"%d/%m/%Y")
epc<-subset(my_data, Date=="2007-02-01"|Date=="2007-02-02")
png(file="plot1.png",
    width=480, height=480)

hist(as.numeric(epc$Global_active_power), 
     main="Global Active Power",
     col="red", 
     xlab="Global Active Power (kilowatts)",
     breaks=13,
)

dev.off()
