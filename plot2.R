# Load required library
library(data.table)
library(base)

#setwd("C:\\coursera\\course4\\wk1\\project")

idt <- fread("household_power_consumption.txt", sep = ";")

# note must ignore NA when sum
sum(as.numeric(t1$Global_active_power), na.rm = TRUE)
# big object 150 MB
object.size(idt)

# get only the data forrequired dates
dt1 <- idt[(idt$Date == "1/2/2007" ),]
dt2 <- idt[(idt$Date == "2/2/2007" ),]

# merge
td <- rbind(dt1,dt2)

# much smaller data set
#object.size(td)
# 394168 bytes

# get x and y axis values
x <- strptime(paste(td$Date, td$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- as.numeric(td$Global_active_power)

# Plot 2
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")

## Don't forget to close the PNG device!
dev.off()
