require(dplyr)
require(tidyverse)
rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T, 
                   na.strings = "?")
data <- rawdata %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(Time = strptime(paste(Date, Time), format = "%e/%m/%Y %H:%M:%S"))

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, main = "Global Avtive Power", col="red",
     xlab = "Global Active Power (kilowats)", ylim = c(0,1300))
dev.off()
