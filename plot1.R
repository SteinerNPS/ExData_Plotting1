#import and subset data
setwd("C:/Users/mhsteiner/Documents/R/ExData_Plotting1")
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date <- strptime(x$Date, "%d/%m/%Y")
x <- x[x$Date >= "2007-02-01 PST" & x$Date <= "2007-02-02 PST",]

#open png


#Set plot
hist(as.numeric(as.character(x$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", axes = FALSE)
axis(side = 2, at = seq(0,1201, by = 200))
axis(side = 1, at = seq(0,6, by = 2))

#Save png