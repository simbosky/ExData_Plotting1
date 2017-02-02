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
png("~/Desktop/coursera/Assignments/EDA/W1/ExData_Plotting1/plot1.png", width=480, height = 480)

#make histogram
hist(february$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#close png
dev.off()