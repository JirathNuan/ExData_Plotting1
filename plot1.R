# Plot1.R
# Histogram of Global Active Power

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than 
# reading in the entire dataset and subsetting to those dates.

# ----------------------
# Load data
dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(dt)  # sampling

# Format date and time
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
dt$Time <- strptime(paste(dt$Date, dt$Time),"%F %T")

# Subsetting data
date_feb <- c("2007-02-01", "2007-02-02")
dt_subset <- subset(dt, dt$Date %in% as.Date(date_feb))

# ----------------------


# Plot histogram and save as PNG file
png("plot1.png", width = 480, height = 480)

hist(as.numeric(dt_subset$Global_active_power), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()



