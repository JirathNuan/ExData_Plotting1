# Plot1.R
# Histogram of Global Active Power

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than 
# reading in the entire dataset and subsetting to those dates.

# Load data
dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(dt)  # sampling

# Chage date format from %d/%m/%Y to %Y-%m-%d
dt$Date <- strptime(as.character(dt$Date), "%d/%m/%Y")

# Subsetting data
dt_subset <- subset(dt, Date >= "2007-02-01" & Date <= "2007-02-02")

# --------------------------------------------------------------------------


# Plot histogram and save as PNG file
png("plot1.png")

hist(as.numeric(dt_subset$Global_active_power), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()



