#As library is open it is unecesarry to repeat the process

#Opening file and subset
Consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Consumption1 <- subset(Consumption, Date %in% c("1/2/2007","2/2/2007"))

Consumption1$Date <- as.Date(Consumption1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(Consumption1$Date), Consumption1$Time)

Consumption1$Datetime <- as.POSIXct(datetime)


#Graph
with(Consumption1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
