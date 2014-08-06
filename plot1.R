# (code for setting working directory not included)

# read text file and subset relevant data
data = read.table("household_power_consumption.txt", sep = ";", header = T, nrows = 69522, na.strings = "?")
logical1 = (data$Date == "1/2/2007")
data1 = data[which(logical1),]
logical2 = (data$Date == "2/2/2007")
data2 = data[which(logical2),]
data = rbind(data1, data2)

# create the png file
png(filename = "plot1.png", width = 480, height = 480)

# make the histogram
with(data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))

# dev.off
dev.off()
