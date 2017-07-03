#import and subset data
setwd("/Users/michaelsteiner/Documents/Coursera/ExData_Plotting1")
plot_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
plot_data$Date <- strptime(plot_data$Date, "%d/%m/%Y")
plot_data <- plot_data[plot_data$Date >= "2007-02-01 PST" & plot_data$Date <= "2007-02-02 PST",]

#open png
png("plot1.png", width = 480, height = 480)

#Set plot
hist(as.numeric(as.character(plot_data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", axes = FALSE)
axis(side = 2, at = seq(0,1200, by = 200))
axis(side = 1, at = seq(0,6, by = 2))

#Save png
dev.off()
