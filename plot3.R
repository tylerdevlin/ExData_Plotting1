# (code for setting working directory not included)

# read text file and subset relevant data
data = read.table("household_power_consumption.txt", sep = ";", header = T, nrows = 69522, na.strings = "?")
logical1 = (data$Date == "1/2/2007")
data1 = data[which(logical1),]
logical2 = (data$Date == "2/2/2007")
data2 = data[which(logical2),]
data = rbind(data1, data2)

# reformat Date column as POSIXct
data$Date = paste(data$Date, data$Time, sep = " ")
data$Date = as.POSIXct(data$Date, format = "%d/%m/%Y %H:%M:%S")

# create the png file
png(filename = "plot3.png", width = 480, height = 480)

# initialize an empty plot
with(data, plot(Sub_metering_1 ~ Date, type = "n", ylab = "Energy sub metering", xlab = ""))

# add colored lines for each sub metering
with(data, points(Sub_metering_1 ~ Date, type = "l"))
with(data, points(Sub_metering_2 ~ Date, type = "l", col = "red"))
with(data, points(Sub_metering_3 ~ Date, type = "l", col = "blue"))

# add a legend in the top right corner
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col=c("black", "red","blue"))

# dev.off
dev.off()
