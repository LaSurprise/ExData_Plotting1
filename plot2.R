plot2 <- function()
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
  householdWork2 <- data.frame(day=day, time=time, Global_active_power=householdWork$Global_active_power)
  with(householdWork2, {time <- strptime(paste(2007, day, time %/% 100, time %% 100),  "%Y %j %H %M")
                        plot(time, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)",  xlab="") 
  })  
}  

