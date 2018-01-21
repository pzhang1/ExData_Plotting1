library(varhandle)

### Plot4.R

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power1 <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

x <- paste(power1$Date, power1$Time)

png(filename="plot4.png",width = 480, height = 480, units="px")

par(mfrow = c(2, 2)) 

plot(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), unfactor(power1$Global_active_power), type = "l", xlab="",ylab="Global Active Power")

plot(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), unfactor(power1$Voltage), type = "l", xlab="datetime",ylab="Voltage")

plot(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), unfactor(power1$Sub_metering_1), type = "l", xlab="",ylab="Energy sub metering")

lines(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), unfactor(power1$Sub_metering_2), type = "l", col="red")

lines(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), power1$Sub_metering_3, type = "l", col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1))

plot(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), unfactor(power1$Global_reactive_power), type = "l", xlab="datetime",ylab="Global_reactive_power")

dev.off()

