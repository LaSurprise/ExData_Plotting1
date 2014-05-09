plot1 <- function()
{
setwd("C:/Data Scientist/4-Exploratory Data Analysis/Project 01/")
household <- read.csv("household.txt", header = TRUE, sep = ";", quote = "\"'", dec = ".", na.strings = "?", colClasses = c("character" , "character" , "numeric", "numeric","numeric","numeric","numeric","numeric","numeric" ))
householdWork <- data.frame(rbind(household[household$Date == "1/2/2007" ,], household[household$Date == "2/2/2007", ]))
rm(household)
hist(householdWork$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

}
