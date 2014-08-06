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
png(filename = "plot2.png", width = 480, height = 480)

# make the plot
plot(data$Global_active_power ~ data$Date, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# dev.off
dev.off()
