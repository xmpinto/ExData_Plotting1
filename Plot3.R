#reload CSV file and store as ECPNEW (no need to parse and subset every single time)
ECPNEW <- read.csv("/Users/xpinto/Desktop/Data_Science/hpc_subset.csv", header = TRUE, dec = ".")

# Convert New Column to Date & Time Format
ECPNEW$NewDateTime <- as.POSIXct(ECPNEW$DateTime, format = " %d/%m/%Y %H:%M:%S")

# Separate Date by Weekday
ECPNEW$Weekday <- weekdays(ECPNEW$NewDateTime)

# Using PLot and type = "l"
png("/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/ExData_Plotting1/Plot3.png", width = 480, height = 480)
with(ECPNEW, plot(NewDateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(ECPNEW, lines(NewDateTime, Sub_metering_2, type = "l", col = "red"))
with(ECPNEW, lines(NewDateTime, Sub_metering_3, type = "l", col = "blue"))
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
legend("topright", leg.txt, col = c("black", "red", "blue"), lty = 1,  bty = "o", box.lty = 1, box.col = "black" )

dev.off()