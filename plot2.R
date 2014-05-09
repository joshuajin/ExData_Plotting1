## Assignment_1 Plot_2
## Use sqldf package to read input file and subset data needed to process. 
## Input file dependency: ./household_power_consumption.txt
## 

library(sqldf)
#rm(mySqlStmt)
#mySqlStmt <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
mySqlStmt <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"  #works also


myFile <- "./household_power_consumption.txt"

myData <- read.csv2.sql(myFile,mySqlStmt)
#str(myData)
#head(myData$Date)
#head(myData$Global_active_power)

myData$DateTime <- as.POSIXct(paste(myData$Date, myData$Time), 
                              format="%d/%m/%Y %H:%M:%S")
#head(myData$DateTime)
#head(myData$Global_active_power)

# plot 2
plot(myData$DateTime, myData$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (killowatts)")