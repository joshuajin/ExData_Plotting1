## This code is for Assignment_1 Plot1.
## Note: the input file household_power_consumption.txt it too big to upload to ## github. 
##
## set up enviroment, need install sqldf package first
getwd()
library(sqldf)
#rm(mySqlStmt)
#rm(myData)

## setup to use sqldf package to read input data file
myFile <- "./household_power_consumption.txt"  # input data file
mySqlStmt <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"  # use SQL to subset data needed

## the following commented out code block is for debugging
#myData <- read.csv(file="household_power_consumption.txt",head=TRUE,sep=";",stringsAsFactors=FALSE)
#myData <- read.csv(file="household_power_consumption.txt",head=TRUE,sep=";")
#str(myData)
#head(myData$Global_active_power)


myData <- read.csv2.sql(myFile,mySqlStmt)
#str(myData) # Note: Date column is type of chr
#head(myData$Date)
#head(myData$Global_active_power)

# convert Date from chr to Date
myData$Date <- as.Date(myData$Date, format="%m/%d/%Y")
#str(myData) # now Date has been converted to Date data type
#head(myData$Date)
#head(myData$Global_active_power)

## display histgram chat
red = "red"
hist(myData$Global_active_power, 
     col=red,   # make red color bar
     xlab="Global Active Power (killowatts)", # x labal
     main="Global Active Power") # main title

