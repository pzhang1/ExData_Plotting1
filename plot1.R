library(varhandle)

### Plot1.R

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power1 <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

png(filename="plot1.png",width = 480, height = 480, units="px")

hist(unfactor(power1$Global_active_power),xlab='Global Active Power (kilowatts)',main='Global Active Power',col=2)

dev.off()

