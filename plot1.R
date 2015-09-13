# Loads the data in a stupid f*cking way but it was the best I could do, don't judge me! 
data <- read.table("hpc.txt", header = FALSE, sep = ";", skip = 66637, nrow = 2880, 
                   stringsAsFactors = FALSE)

# since I skipped the 1st row I have to retrieve it  so I can name the whole data
title <- read.table("hpc.txt", header = TRUE, sep = ";", nrow = 1) 
names(data) <- names(title)

# transforms to date format and combines Date and Time
data$combined <- paste(data$Date, data$Time, sep="")
data$combined <- strptime(data$combined, "%d/%m/%Y %H:%M:%S")

# creates the histogram
png("plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
