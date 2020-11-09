#Opening file and subset
Consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Consumption1 <- subset(Consumption, Date %in% c("1/2/2007","2/2/2007"))

Consumption1$Date <- as.Date(Consumption1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(Consumption1$Date), Consumption1$Time)

Consumption1$Datetime <- as.POSIXct(datetime)

#Graph
with(Consumption1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()