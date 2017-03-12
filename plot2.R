path<-file.path("C:/Users/marie/Desktop/Data science/Exploratory Data/household_power_consumption.txt")
data<-read.table(path,header = TRUE, sep=";",skip = 66637, nrows=2879 )
names(data)<-names(read.table(path,header = TRUE, sep=";"))
library(lubridate)
data$Date2<-dmy_hms(paste(data$Date,data$Time))
plot(data$Date2,data$Global_active_power,xlab="",
     ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png,"plot2.png")
dev.off()