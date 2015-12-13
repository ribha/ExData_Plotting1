##plot 1
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
