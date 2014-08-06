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
png(filename = "plot4.png", width = 480, height = 480)

# set layout paramters
par(mfrow = c(2,2), mar = c(5,4,2,2))

# make upper left plot
plot(data$Global_active_power ~ data$Date, type = "l", ylab = "Global Active Power", xlab = "")

# make upper right plot
plot(data$Voltage ~ data$Date, type = "l", ylab = "Voltage", xlab = "datetime")

# make lower left plot
with(data, plot(Sub_metering_1 ~ Date, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data, points(Sub_metering_1 ~ Date, type = "l"))
with(data, points(Sub_metering_2 ~ Date, type = "l", col = "red"))
with(data, points(Sub_metering_3 ~ Date, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col=c("black", "red","blue"), bty = "n")

# make lower right plot
with(data, plot(Global_reactive_power ~ Date, xlab = "datetime", type = "l"))

# dev.off
dev.off()


