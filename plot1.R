library(lubridate)

raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Only keep data from 2007-02-01 and 2007-02-02
data <- raw_data[(dmy(raw_data$Date) == ymd("2007-02-01")) | (dmy(raw_data$Date) == ymd("2007-02-02")),]

numeric_data_global_activity_power <- as.double(data$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(numeric_data_global_activity_power, 
     col="red",
     xlab="Global Activity Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     xlim=c(0,6),
     xaxt="n",
     breaks=seq(0, 
         max(numeric_data_global_activity_power, na.rm=TRUE)+0.5, 
         by = 0.5)
     )
axis(1, at = c(0,2,4,6))
dev.off()

