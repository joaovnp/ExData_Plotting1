# Loads the data in a stupid f*cking way but it was the best I could do, don't judge me! 
data <- read.table("hpc.txt", header = FALSE, sep = ";", skip = 66637, nrow = 2880, 
                   stringsAsFactors = FALSE)

# since I skipped the 1st row I have to retrieve it  so I can name the whole data
title <- read.table("hpc.txt", header = TRUE, sep = ";", nrow = 1) 
names(data) <- names(title)

# transforms to date format and combines Date and Time
data$combined <- paste(data$Date, data$Time, sep="")
data$combined <- strptime(data$combined, "%d/%m/%Y %H:%M:%S")

# 2 by 2 column filling layout
par(mfcol = c(2,2))

# Plot 1 (similar to plot2.R)

png("plot4.png")

plot(data$combined, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", cex.axis = 1.2, cex.lab = 1.2)

# Plot 2 (similar to plot3.R)
plot(data$combined, data$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", cex.axis = 1.2, cex.lab = 1.2)
lines(data$combined, data$Sub_metering_2, type = "l", col = "red")
lines(data$combined, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1"
                                    ,"Sub_metering_2", "Sub_metering_3"))  

# Plot 3
plot(data$combined, data$Voltage, type = "l", cex.axis = 1.2, cex.lab = 1.2, 
     ylab = "Voltage")

# Plot 4
plot(data$combined, data$Global_reactive_power, type = "l", cex.axis = 1.2, cex.lab = 1.2,
     ylab = "Global reactive power")

dev.off()
