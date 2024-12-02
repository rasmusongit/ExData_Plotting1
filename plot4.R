library(lubridate)


raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Only keep data from 2007-02-01 and 2007-02-02
data <- raw_data[(dmy(raw_data$Date) == ymd("2007-02-01")) | (dmy(raw_data$Date) == ymd("2007-02-02")),]

sub_meter1 <- as.numeric(data$Sub_metering_1)
sub_meter2 <- as.numeric(data$Sub_metering_2)
sub_meter3 <- as.numeric(data$Sub_metering_3)

date_with_time <- as.numeric(dmy(data$Date) + hms(data$Time))

time_data = as.numeric(dmy(data$Date) + hms(data$Time))

voltage <- as.numeric(data$Voltage)
global_reactive_power <- as.numeric(data$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(time_data, 
     as.numeric(data$Global_active_power),
     ylab="Global Active Power (kilowatts)",
     xlab="",
     lwd=2,
     type="l",
     xaxt="n")
tick_positions <- c(min(time_data), median(time_data), max(time_data))
tick_labels <- c("Thursday", "Friday", "Saturday")
axis(1, at = tick_positions, labels = tick_labels)

plot(time_data, 
     voltage,
     ylab="Voltage",
     xlab="datatime",
     lwd=2,
     type="l",
     xaxt="n")
tick_positions <- c(min(time_data), median(time_data), max(time_data))
tick_labels <- c("Thursday", "Friday", "Saturday")
axis(1, at = tick_positions, labels = tick_labels)

plot(time_data, 
     sub_meter1,
     ylab="Energy sub metering",
     xlab="",
     lwd=2,
     type="l",
     xaxt="n", col="black")
lines(time_data, 
     sub_meter2,
     lwd=2,
     type="l",
     col="red")
lines(time_data, 
     sub_meter3,
     lwd=2,
     type="l",
     col="blue")

legend("topright",
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 2)

tick_positions <- c(min(time_data), median(time_data), max(time_data))
tick_labels <- c("Thursday", "Friday", "Saturday")
axis(1, at = tick_positions, labels = tick_labels)

plot(time_data, 
     global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datatime",
     lwd=2,
     type="l",
     xaxt="n")
tick_positions <- c(min(time_data), median(time_data), max(time_data))
tick_labels <- c("Thursday", "Friday", "Saturday")
axis(1, at = tick_positions, labels = tick_labels)
dev.off()