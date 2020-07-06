options(digits = 9)
data <- read.csv("household_power_consumption.txt", sep = ';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data_filtered_by_date <- subset(data, Date==as.Date("2007-02-01", "%Y-%m-%d") |  Date==as.Date("2007-02-02", "%Y-%m-%d")) 

png(filename = "plot1.png", width = 480, height = 480)
hist(
  as.numeric(as.character(data_filtered_by_date[complete.cases(data_filtered_by_date),]$Global_active_power) ), 
  col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
     