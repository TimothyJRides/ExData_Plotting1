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

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(powerdata$Date, powerdata$Global_active_power, type = "l"
     ,ylab = "Global Active Power (kilowatts)",xlab = "")

dev.off()