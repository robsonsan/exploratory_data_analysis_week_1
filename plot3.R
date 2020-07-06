options(digits = 9)
data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data_filtered_by_date <- na.omit(subset(data, Date==as.Date("2007-02-01", "%Y-%m-%d") |  Date==as.Date("2007-02-02", "%Y-%m-%d")))

png(filename = "plot3.png", width = 480, height = 480)
plot(data_filtered_by_date$DateTime,
     as.numeric(as.character(data_filtered_by_date$Sub_metering_1) ), 
     col="black", ylab="Energy sub metering", type="l",
     xlab=""
)

lines(data_filtered_by_date$DateTime,
     as.numeric(as.character(data_filtered_by_date$Sub_metering_2) ), 
     col="red")


lines(data_filtered_by_date$DateTime,
     as.numeric(as.character(data_filtered_by_date$Sub_metering_3) ), 
     col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd=1)
dev.off()