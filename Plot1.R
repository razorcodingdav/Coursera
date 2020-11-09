#To Read file
library(haven)
#To make the subests
library(lubridate)

#Opening file and subset
Consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Consumption1 <- subset(Consumption, Date %in% c("1/2/2007","2/2/2007"))

Consumption1$Date <- as.Date(Consumption1$Date, format="%d/%m/%Y")

#Graph
hist(Consumption1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480)
dev.off()
