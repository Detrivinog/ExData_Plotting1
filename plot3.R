require(dplyr)
require(tidyverse)
rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T, 
                      na.strings = "?")
data <- rawdata %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(Time = strptime(paste(Date, Time), format = "%e/%m/%Y %H:%M:%S"))

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$Time,data$Sub_metering_1,  type = "l", xlab = "", col = "black",  
     ylab = "Energy sub metering")
lines(data$Time,data$Sub_metering_2, col = "red")
lines(data$Time,data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()
