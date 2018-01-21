library(varhandle)

### Plot2.R

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power1 <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

x <- paste(power1$Date, power1$Time)

png(filename="plot2.png",width = 480, height = 480, units="px")

plot(as.POSIXct(x,format="%Y-%m-%d %H:%M:%S"), unfactor(power1$Global_active_power), type = "l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()


