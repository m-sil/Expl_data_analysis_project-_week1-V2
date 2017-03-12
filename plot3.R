path<-file.path("C:/Users/marie/Desktop/Data science/Exploratory Data/household_power_consumption.txt")
data<-read.table(path,header = TRUE, sep=";",skip = 66637, nrows=2879 )
names(data)<-names(read.table(path,header = TRUE, sep=";"))
library(lubridate)
data$Date2<-dmy_hms(paste(data$Date,data$Time))
plot(data$Date2,data$Sub_metering_1,xlab="",
     ylab="Energy sub metering",type="l", col="black")
lines(data$Date2,data$Sub_metering_2, col="red")
lines(data$Date2,data$Sub_metering_3, col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1",
       "Sub_metering_2","Sub_metering_3"),cex=0.75)
dev.copy(png,"plot3.png")
dev.off()