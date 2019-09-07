filename<- "household_power_consumption.zip"

#Checking for data set

if (!file.exists(filename)){
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, filename, method="curl")
}

#Checking for data folder and unzipping files
if (!file.exists("household_power_consumption.txt")){
  unzip(filename)
}
alldata<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec=".",stringsAsFactors = FALSE, na.strings = "?")

#subset to dates

subpower<- subset(alldata, alldata$Date== "1/2/2007"|alldata$Date== "2/2/2007")

#date and time interpreted correctly
as.Date(subpower$Date)
strptime(subpower$Time)

#Clear NA rows
subpower<- na.omit(subpower)

#set to png
png("plot1.png", width = 480, height = 480)

#plot created
hist(subpower$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency" )

#turn off dev
dev.off()


