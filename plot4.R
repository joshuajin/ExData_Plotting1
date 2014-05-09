## Assignment_1 Plot_4
## Use sqldf package to read input file and subset data needed to process. 
## Input file dependency: ./household_power_consumption.txt
## 
library(sqldf)
#rm(mySqlStmt)
#getwd()

# input file
myFile <- "household_power_consumption.txt"

# subsetting data needed using SQL statement
mySqlStmt <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"  #works also
myData <- read.csv2.sql(myFile,mySqlStmt)
#str(myData)
#head(myData$Date)
#head(myData$Global_active_power)

#combine date and time fields
myData$DateTime <- as.POSIXct(paste(myData$Date, myData$Time), 
                              format="%d/%m/%Y %H:%M:%S")
#head(myData$DateTime)
#head(myData$Global_active_power)

# multiple graphs 2 rows and 2 columns
par(mfrow=c(2,2))
#par(mar=c(5.1,4.1,4.1,2.1)) # default margin
par(mar=c(4,4,2,2))
# Plot 4
# display on row 1, col 1
plot(myData$DateTime, myData$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power")

# display on row 1, col 2
plot(myData$DateTime, myData$Voltage, 
     type="l",
     xlab="datetime",
     ylab="Voltage")

# display on row 2, col 1
plot (myData$DateTime, myData$Sub_metering_1, type="l", col="black",
      xlab="",
      ylab="Energy Sub Metering")       
lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")
lines(myData$DateTime, myData$Sub_metering_3, type="l", col="blue")
legend('topright', names(myData)[7:9] , 
       #box.lwd = par("lwd"), box.lty = par("lty"), box.col = par("fg"),
       box.lwd = 0,box.col = "white",
       lty=1, col=c('black', 'red', 'blue'),  cex=.75)

# display on row 2, col 2
plot(myData$DateTime, myData$Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
