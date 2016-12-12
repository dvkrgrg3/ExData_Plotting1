powerc <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
plotdata<- rbind(powerc[powerc$Date=="1/2/2007",],powerc[powerc$Date=="2/2/2007",])
plotdata$Date <- as.Date(plotdata$Date,"%d/%m/%Y")
plotdata <- cbind(plotdata,"DateTime"= as.POSIXct(paste(plotdata$Date,plotdata$Time)))
png(file = "plot3.png")
with(plotdata, {plot(Sub_metering_1 ~ DateTime, type="l", 
                         xlab= "", ylab="Energy Sub Metering")})
lines(plotdata$Sub_metering_2 ~ plotdata$DateTime, col = 'Red')
lines(plotdata$Sub_metering_3 ~ plotdata$DateTime, col = 'Blue')
legend("topright",lty=1,col = c("black","red","blue"), legend = c("Sub_metering_1",
                                                                  "Sub_metering_2",
                                                                  "Sub_metering_3"))
dev.off()