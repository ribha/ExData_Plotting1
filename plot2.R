##plot 2
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
plot(data$Global_active_power~data$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()