#Open the source file then read the data pertaining to the right date
path<-file.path("C:/Users/marie/Desktop/Data science/Exploratory Data/household_power_consumption.txt")
data<-read.table(path,header = TRUE, sep=";",skip = 66637, nrows=2879 )
#Rename the columns with the original columns names
names(data)<-names(read.table(path,header = TRUE, sep=";"))
#create a new column that concatenate the date and time value, and gives it a date format 
library(lubridate)
data$Date2<-dmy_hms(paste(data$Date,data$Time))
#Create the plot (line) with the first sub metering then add two lines for the second and third
#create a legend in the top right corner and resize it with cex
plot(data$Date2,data$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="l", col="black")
lines(data$Date2,data$Sub_metering_2, col="red")
lines(data$Date2,data$Sub_metering_3, col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1",
       "Sub_metering_2","Sub_metering_3"),cex=0.75)
#create the png file in the working directory (default is 480x480 pxl)
dev.copy(png,"plot3.png")
dev.off()