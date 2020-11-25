#reload CSV file and store as ECPNEW (no need to parse and subset every single time)
ECPNEW <- read.csv("/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/hpc_subset.csv", header = TRUE, dec = ".")

# Convert New Column to Date & Time Format
ECPNEW$NewDateTime <- as.POSIXct(ECPNEW$DateTime, format = " %d/%m/%Y %H:%M:%S")

# Separate Date by Weekday
ECPNEW$Weekday <- weekdays(ECPNEW$NewDateTime)

#Save as png device
png("/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/ExData_Plotting1/Plot4.png", width = 480, height = 480)

# Individual Plots by column
par(mfcol =c(2,2))

#PLot1
with(ECPNEW, plot(NewDateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#Plot2
with(ECPNEW, plot(NewDateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(ECPNEW, lines(NewDateTime, Sub_metering_2, type = "l", col = "red"))
with(ECPNEW, lines(NewDateTime, Sub_metering_3, type = "l", col = "blue"))
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
legend("topright", leg.txt, cex = 0.9,  col = c("black", "red", "blue"), lty = 1,  bty = "n")

#Plot3
with(ECPNEW, plot(NewDateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#Plot4
with(ECPNEW, plot(NewDateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()
# remember reseting the device to dev.set(which = 2) otherwise no plots will be shown in R Studio