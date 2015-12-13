##plot3
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

plot(data$Sub_metering_1~data$datetime, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$datetime,col='Red')
lines(data$Sub_metering_3~data$datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2, cex=0.8)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
