#reload CSV file and store as ECPNEW (no need to parse and subset every single time)
ECPNEW <- read.csv("/Users/xpinto/Desktop/Data_Science/hpc_subset.csv", header = TRUE, dec = ".")

# Convert New Column to Date & Time Format
ECPNEW$NewDateTime <- as.POSIXct(ECPNEW$DateTime, format = " %d/%m/%Y %H:%M:%S")

# Separate Date by Weekday
ECPNEW$Weekday <- weekdays(ECPNEW$NewDateTime)

# Using PLot and type = "l"
png("/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/ExData_Plotting1/Plot2.png", width = 480, height = 480)
with(ECPNEW, plot(NewDateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()