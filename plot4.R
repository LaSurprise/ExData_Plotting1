plot4 <- function()
{ 
  setwd("C:/Users/Lydienne/ExData_Plotting1")
  library("stringr")
  household <- read.csv("household.txt", header = TRUE, sep = ";", quote = "\"'", dec = ".", na.strings = "?", colClasses = c("character" , "character" , "numeric", "numeric","numeric","numeric","numeric","numeric","numeric" ))
  householdWork <- data.frame(rbind(household[household$Date == "1/2/2007" ,], household[household$Date == "2/2/2007", ]))
  rm(household)
  hh <- as.numeric(str_sub(householdWork$Time, 1, 2))
  mn <- as.numeric(str_sub(householdWork$Time, 4, 5))
  time <- mn + 100*hh
  day <- 31+ifelse( (str_sub(householdWork$Date, 2, 1)==""), as.numeric(str_sub(householdWork$Date, 1, 1)),as.numeric(str_sub(householdWork$Date, 1, 2)))
  householdWork4 <- data.frame(day=day, time=time, Global_active_power=householdWork$Global_active_power, Global_reactive_power=householdWork$Global_reactive_power, Voltage=householdWork$Voltage, Sub_metering_1=householdWork$Sub_metering_1, Sub_metering_2=householdWork$Sub_metering_2, Sub_metering_3=householdWork$Sub_metering_3)
  with(householdWork4, {time <- strptime(paste(2007, day, time %/% 100, time %% 100),  "%Y %j %H %M")
                        op <- par(mfrow = c(2, 2), # 2 x 2 pictures on one plot
                                  pty = "s", mar=c(5,5,2,2)) 
                        plot(time, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)",  xlab="")
                        plot(time, Voltage, type = "l", ylab="Voltage",  xlab="datetime") 
                        plot(time, Sub_metering_1, type = "l", ylab="Energy sub metering",  xlab="") 
                        lines(time, Sub_metering_2, type = "l", col="red")
                        lines(time, Sub_metering_3, type = "l", col="blue")
                        legend("topright", lty = c(1, 1, 1), col = c(1, 2, 4), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5, seg.len = 1)
                        plot(time, Global_reactive_power, type = "l", ylab="Global_reactive_power",  xlab="datetime") 
                        par(op)
  })
}  


