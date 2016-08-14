# Load required library
library(data.table)
library(base)

#setwd("C:\\coursera\\course4\\wk1\\project")

idt <- fread("household_power_consumption.txt", sep = ";")

# note must ignore NA when sum
# sum(as.numeric(t1$Global_active_power), na.rm = TRUE)

# big object 150 MB
object.size(idt)

# get only the data forrequired dates
dt1 <- idt[(idt$Date == "1/2/2007" ),]
dt2 <- idt[(idt$Date == "2/2/2007" ),]

# merge
td <- rbind(dt1,dt2)

# much smallta set
#object.size(td)
# 394168 bytes

# get x and y axis values
x <- strptime(paste(td$Date, td$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- as.numeric(td$Global_active_power)

# get values for range on y axis
minRange <- min(as.numeric(td$Sub_metering_1),as.numeric(td$Sub_metering_2),as.numeric(td$Sub_metering_3))
maxRange <- max(as.numeric(td$Sub_metering_1),as.numeric(td$Sub_metering_2),as.numeric(td$Sub_metering_3))

# Plot 2
# initilize the plot type = n
plot(x, y, type="n", xlab="", ylab="Energy sub metering" , ylim = c(minRange,maxRange))

# add lines for each meter
lines(x,as.numeric(td$Sub_metering_1), col="grey")
lines(x,as.numeric(td$Sub_metering_2), col="orange")
lines(x,as.numeric(td$Sub_metering_3), col="blue")
 
# add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey","orange","blue") , lty = 1)

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")

## Don't forget to close the PNG device!
dev.off()
