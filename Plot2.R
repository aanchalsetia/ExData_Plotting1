file <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = ExData_Plotting1, method = "curl")

unzipped <- unzip("ExData_Plotting1")

data <- read.table("./household_power_consumption.txt", header = T, skip =1, sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3") )

mydata <- subset(data, data$Date == "1/2/2007"| data$Date == "2/2/2007")

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), 
                            "%d/%m/%Y %H:%M:%S") 


mydata$Global_active_power <-as.numeric(mydata$Global_active_power)



png(file = "plot2.png")

plot(mydata$DateTime, mydata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
