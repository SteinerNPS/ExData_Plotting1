#import and subset data
plot_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
plot_data$Date <- strptime(plot_data$Date, "%d/%m/%Y")
plot_data <- plot_data[plot_data$Date >= "2007-02-01 PST" & plot_data$Date <= "2007-02-02 PST",]
plot_data$Time <- with(plot_data, paste(as.character(plot_data$Date), as.character(plot_data$Time)))
plot_data$Time <- strptime(plot_data$Time, "%Y-%m-%d %H:%M:%S")

#open png
png("plot3.png", width = 480, height = 480)

#Set plot
plot(plot_data$Time, as.numeric(as.character(plot_data$Sub_metering_1)), col = "black", ylab = "Global Active Power (kilowatts)", xlab = "", axes = FALSE, type = 'l')
lines(plot_data$Time, as.numeric(as.character(plot_data$Sub_metering_2)), col = "red")
lines(plot_data$Time, as.numeric(as.character(plot_data$Sub_metering_3)), col = "blue")
axis(side = 2, at = seq(0,30, by = 10))
axis.POSIXct(side = 1, at = seq(as.POSIXlt("2007-02-01"), as.POSIXlt("2007-02-03"), by = "1 day"), format = "%a")

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.75)

box()
#Save png
dev.off()
