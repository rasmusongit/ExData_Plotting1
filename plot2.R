library(lubridate)


raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Only keep data from 2007-02-01 and 2007-02-02
data <- raw_data[(dmy(raw_data$Date) == ymd("2007-02-01")) | (dmy(raw_data$Date) == ymd("2007-02-02")),]

date_with_time <- as.numeric(dmy(data$Date) + hms(data$Time))

time_data = as.numeric(dmy(data$Date) + hms(data$Time))

png("plot2.png", width = 480, height = 480)
plot(time_data, 
     as.numeric(data$Global_active_power),
     ylab="Global Active Power (kilowatts)",
     xlab="",
     lwd=1.5,
     type="l",
     xaxt="n")
tick_positions <- c(min(time_data), median(time_data), max(time_data))
tick_labels <- c("Thursday", "Friday", "Saturday")
axis(1, at = tick_positions, labels = tick_labels)
dev.off()