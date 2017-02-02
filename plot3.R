###first check if read energy into memory and cleaned

if(!exists("february")){
  
  #import data
  setwd("~/Desktop/coursera")
  energy <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
  
  #convert date and time from text to POSIXlt
  energy$DateTime <- with(energy, paste(Date, Time))
  energy$DateTime <- strptime(energy$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  #subset to February
  february <- energy[energy$DateTime>="2007-02-01" & energy$DateTime<"2007-02-03",]
}

#open png graphics
png("~/Desktop/coursera/Assignments/EDA/W1/ExData_Plotting1/plot3.png", width=480, height = 480)

#make line chart
plot(february$DateTime, february$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", lwd=1)
lines(february$DateTime, february$Sub_metering_2, lwd=1, col="Red")
lines(february$DateTime, february$Sub_metering_3, lwd=1, col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"), lwd=1)
#close png
dev.off()