#Open the source file then read the data pertaining to the right date
path<-file.path("C:/Users/marie/Desktop/Data science/Exploratory Data/household_power_consumption.txt")
data<-read.table(path,header = TRUE, sep=";",skip = 66637, nrows=2879 )
#Rename the columns with the original columns names
names(data)<-names(read.table(path,header = TRUE, sep=";"))
#create a new column that concatenate the date and time value, and gives it a date format 
library(lubridate)
data$Date2<-dmy_hms(paste(data$Date,data$Time))
#create plot
plot(data$Date2,data$Global_active_power,xlab="",
     ylab="Global Active Power (kilowatts)",type="l")
#Save on png file
dev.copy(png,"plot2.png")
dev.off()