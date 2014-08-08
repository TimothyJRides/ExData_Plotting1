# Table downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# on 8/6/2014

# Read table from unzipped file

# setwd("Coursera/04 - ExpDataAnalysis/ProjAssign1")
powerdata <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";"
                        , stringsAsFactors = FALSE)

# Subset data to 2007-02-01 and 2007-02-02

powerdata$Date <- strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S")
powerdata <- subset(powerdata, Date >= "2007-02-01" 
                    & Date <"2007-02-03")

# Make data numeric

powerdata[,3:9] <- as.numeric(unlist(powerdata[,3:9]))

# Open png device, run histogram and close device.

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

plot(powerdata$Date, powerdata$Global_active_power, type = "l"
     ,ylab = "Global Active Power",xlab = "")

plot(powerdata$Date, powerdata$Voltage, type = "l"
     ,ylab = "Voltage",xlab = "datetime")

plot(powerdata$Date, powerdata$Sub_metering_1, type = "l"
     ,ylab = "Energy sub metering",xlab = "")
lines(powerdata$Date, powerdata$Sub_metering_2, col = "red")
lines(powerdata$Date, powerdata$Sub_metering_3, col = "blue")
legend("topright", c(colnames(powerdata[7:9])),lwd = c(2,2), bty = "n",
       col = c("black","red","blue"))

plot(powerdata$Date, powerdata$Global_reactive_power, type = "l"
     ,ylab = "Global_reactive_power",xlab = "datetime")

dev.off()