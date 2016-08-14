# Load required library
library(data.table)
library(base)

#setwd("C:\\coursera\\course4\\wk1\\project\\submit")

# download zip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipName <- file.path(getwd(), "input_data.zip")
download.file(url, zipName)
unzip(zipName, overwrite = TRUE) 

# read input file
idt <- fread("household_power_consumption.txt", sep = ";")

png (file = "plot1.png", width = 480, height = 480, units = "px" ) 

# note must ignore NA when sum
# sum(as.numeric(t1$Global_active_power), na.rm = TRUE)

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

# Plot 1
hist(as.numeric(td$Global_active_power), col = "red" , xlab = "Global Active Power (kilowatts)", main = ("Global Active Power") )

## Copy my plot to a PNG file
#dev.copy(png, file = "plot1.png")

## Don't forget to close the PNG device!
dev.off()
dev.set(which = 2)



