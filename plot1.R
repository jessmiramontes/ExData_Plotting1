## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## plot1.R - generates plot1.png


## Reading the data from the contents of the text file
dfpower = read.csv("household_power_consumption.txt", header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Formatting date and subseting data only on 2007-02-01 and 2007-02-02
dfpower$Date = as.Date(dfpower$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
dfpower = dfpower[dfpower$Date >= startDate & dfpower$Date <= endDate, ]

## Creating the plot
png(filename="plot1.png", width=480, height=480)
hist(dfpower$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()

