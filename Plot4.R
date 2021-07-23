# Plot4.R
# ----------------------
# Load data
dt <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
head(dt)  # sampling

# Format date and time
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
dt$Time <- strptime(paste(dt$Date, dt$Time),"%F %T")

# Subsetting data
date_feb <- c("2007-02-01", "2007-02-02")
dt_subset <- subset(dt, dt$Date %in% as.Date(date_feb))

# ----------------------

# Plot
png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

# plot 4.1 (top-left)
plot(dt_subset$Time, dt_subset$Global_active_power, 
     ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")

# plot 4.2 (bottom-left)
plot(dt_subset$Time, dt_subset$Sub_metering_1, 
     xlab = "", pch = ".", type = "l", col = "black", ylab = "Energy sub metering")
points(dt_subset$Time, dt_subset$Sub_metering_2, 
       xlab="", pch =".", type = "l", col = "red")
points(dt_subset$Time, dt_subset$Sub_metering_3, 
       xlab="", pch =".", type = "l", col = "blue")
legend("topright", lwd = 1, col=c("black", "red", "blue"), 
       legend=names(dt_subset[,7:9]), bty = "n")

# plot 4.3 (top-right)
plot(dt_subset$Time, dt_subset$Voltage, xlab = "datetime", ylab = "Voltage",
     pch = ".", type = "l", col = "black")

# plot 4.4 (bottom-right)
plot(dt_subset$Time, dt_subset$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power",
     pch = ".", type = "l", col = "black")

dev.off()

