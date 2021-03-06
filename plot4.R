## Coursera - Exploratory Data Analysis - Plotting Assignment 1
##
## plot4.R - generates plot4.png

## Reading the data from the contents of the text file
dfpower = read.csv("household_power_consumption.txt", header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Formatting the date and time 
## subseting the data only on 2007-02-01 and 2007-02-02
dfpower$timestamp = strptime(paste(dfpower$Date, dfpower$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
dfpower = dfpower[dfpower$timestamp >= startDate & dfpower$timestamp <= endDate, ]

## Creating the plot
png(filename="plot4.png", width=480, height=480)

# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(dfpower$timestamp, dfpower$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(dfpower$timestamp, dfpower$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(dfpower$timestamp, dfpower$Sub_metering_2, col="red")
lines(dfpower$timestamp, dfpower$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(dfpower$timestamp, dfpower$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(dfpower$timestamp, dfpower$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
