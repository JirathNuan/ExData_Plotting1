# Plot2.R
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
png("plot2.png", width = 480, height = 480)

plot(dt_subset$Time, dt_subset$Global_active_power, 
     ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="line")

dev.off()
