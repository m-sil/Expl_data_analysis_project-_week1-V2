#Open the source file then read the data pertaining to the right date
path<-file.path("C:/Users/marie/Desktop/Data science/Exploratory Data/household_power_consumption.txt")
data<-read.table(path,header = TRUE, sep=";",skip = 66637, nrows=2879 )
#Rename the columns with the original columns names
names(data)<-names(read.table(path,header = TRUE, sep=";"))
#create a new column that concatenate the date and time value, and gives it a date format 
library(lubridate)
data$Date2<-dmy_hms(paste(data$Date,data$Time))
#prepare for showing the four plots in a square
par(mfrow=c(2,2))
#1st plot
plot(data$Date2,data$Global_active_power,xlab="",
     ylab="Global Active Power (kilowatts)",type="l")
#2nd plot
plot(data$Date2,data$Voltage,xlab="datetime",
     ylab="Voltage",type="l")
#3rd plot
plot(data$Date2,data$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="l", col="black")
lines(data$Date2,data$Sub_metering_2, col="red")
lines(data$Date2,data$Sub_metering_3, col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,y.intersp=0.25)
#4thplot
plot(data$Date2,data$Global_reactive_power,xlab="datetime",
    ylab="Global reactive power",type="l")
#save on png file
dev.copy(png,"plot4.png")
dev.off()