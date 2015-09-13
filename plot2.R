# Loads the data in a stupid f*cking way but it was the best I could do, don't judge me! 
data <- read.table("hpc.txt", header = FALSE, sep = ";", skip = 66637, nrow = 2880, 
                   stringsAsFactors = FALSE)

# since I skipped the 1st row I have to retrieve it  so I can name the whole data
title <- read.table("hpc.txt", header = TRUE, sep = ";", nrow = 1) 
names(data) <- names(title)

# transforms to date format and combines Date and Time
data$combined <- paste(data$Date, data$Time, sep="")
data$combined <- strptime(data$combined, "%d/%m/%Y %H:%M:%S")

# creates the line graph (x ticks are in Portuguese, didn't know how to change it
# qui == thu, sex == fri, sáb = sat)
png("plot2.png")

plot(data$combined, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()
