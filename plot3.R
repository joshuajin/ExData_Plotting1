## Assignment_1 Plot_3
## Use sqldf package to read input file and subset data needed to process. 
## Input file dependency: ./household_power_consumption.txt
## 

library(sqldf)
#rm(mySqlStmt)
mySqlStmt <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"  #works also

#getwd()
myFile <- "household_power_consumption.txt"

myData <- read.csv2.sql(myFile,mySqlStmt)
#str(myData)
#head(myData$Date)
#head(myData$Global_active_power)

myData$DateTime <- as.POSIXct(paste(myData$Date, myData$Time), 
                              format="%d/%m/%Y %H:%M:%S")
#head(myData$DateTime)
#head(myData$Global_active_power)

# Plot 3
plot (myData$DateTime, myData$Sub_metering_1, type="l", col="black",
      xlab="",
      ylab="Energy Sub Metering")       
lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")
lines(myData$DateTime, myData$Sub_metering_3, type="l", col="blue")
legend('topright', names(myData)[7:9] ,   
       lty=1, col=c('black', 'red', 'blue'),  cex=.75)


# use matplot is a posible alternative
# matplot (myData$DateTime, 
#         cbind(myData$Sub_metering_1,
#               myData$Sub_metering_2,
#               myData$Sub_metering_3), 
#         col=c("black","red","blue"),
#         type="l",
#         xlab="",
#         ylab="Energy Sub Metering")      
         
