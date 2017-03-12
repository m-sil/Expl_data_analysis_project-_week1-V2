#Open the source file then read the data pertaining to the right date
path<-file.path("C:/Users/marie/Desktop/Data science/Exploratory Data/household_power_consumption.txt")
data<-read.table(path,header = TRUE, sep=";",skip = 66637, nrows=2879 )
#Rename the columns with the original columns names
names(data)<-names(read.table(path,header = TRUE, sep=";"))
#create a new column that concatenate the date and time value, and gives it a date format 
library(lubridate)
data$Date2<-dmy_hms(paste(data$Date,data$Time))
#create the histogram colored in red
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)",
      col="red")
#create the png file in the working directory (default is 480x480 pxl)
dev.copy(png,"plot1.png")
dev.off()