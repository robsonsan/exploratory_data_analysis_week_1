options(digits = 9)
data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data_filtered_by_date <- na.omit(subset(data, Date==as.Date("2007-02-01", "%Y-%m-%d") |  Date==as.Date("2007-02-02", "%Y-%m-%d")))

png(filename = "plot2.png", width = 480, height = 480)
plot(data_filtered_by_date$DateTime,
  as.numeric(as.character(data_filtered_by_date$Global_active_power) ), 
  col="black", ylab="Global Active Power (kilowatts)", type="l",
  xlab=""
)
dev.off()