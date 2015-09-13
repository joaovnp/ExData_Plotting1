# Loads the data in a stupid f*cking way but it was the best I could do, don't judge me! 
data <- read.table("hpc.txt", header = FALSE, sep = ";", skip = 66637, nrow = 2880, 
                   stringsAsFactors = FALSE)

# since I skipped the 1st row I have to retrieve it  so I can name the whole data
title <- read.table("hpc.txt", header = TRUE, sep = ";", nrow = 1) 
names(data) <- names(title)

# transforms to date format and combines Date and Time
data$combined <- paste(data$Date, data$Time, sep="")
data$combined <- strptime(data$combined, "%d/%m/%Y %H:%M:%S")

# creates the line graphs with legends (x ticks are in Portuguese, didn't know how to 
# change it qui == thu, sex == fri, sáb = sat)

png("plot3.png")

plot(data$combined, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$combined, data$Sub_metering_2, type = "l", col = "red")
lines(data$combined, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1"
       ,"Sub_metering_2", "Sub_metering_3"))

dev.off()
