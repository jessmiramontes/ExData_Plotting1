## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## plot2.R - generates plot2.png



## Reading the data from the contents of the zipped file
dfpower = read.csv("household_power_consumption.txt", header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Formatting date and time
## subseting the data only on 2007-02-01 and 2007-02-02
dfpower$timestamp = strptime(paste(dfpower$Date, dfpower$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
dfpower = dfpower[dfpower$timestamp >= startDate & dfpower$timestamp <= endDate, ]

## Creating the plot
png(filename="plot2.png", width=480, height=480)
plot(dfpower$timestamp, dfpower$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
