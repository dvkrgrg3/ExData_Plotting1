powerc <- read.table("./household_power_consumption.txt",
                     header = TRUE, sep = ";", na.strings = "?")
plotdata<- rbind(powerc[powerc$Date=="1/2/2007",],powerc[powerc$Date=="2/2/2007",])
plotdata$Date <- as.Date(plotdata$Date,"%d/%m/%Y")
plotdata <- cbind(plotdata,"DateTime"= as.POSIXct(paste(plotdata$Date,plotdata$Time)))
png(file = "plot1.png")
hist(as.numeric(plotdata$Global_active_power),col = "Red",main = "Global Active Power",
     xlab = "Global Active power (kilowatts)",ylab = "frequency")
dev.off()