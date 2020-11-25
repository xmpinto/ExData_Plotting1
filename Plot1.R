## Read .txt file using ";" as separator, if you specify dec = "." it will treat the variables as numeric
## otherwise they will be imported as characters


ECP <- read.table(file = "/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.strings = "?")

# Paste Columns Date and Time as a new Character Column in the data frame

ECP$DateTime <- paste(ECP$Date, ECP$Time, sep = " ")

# Convert New Column to Date & Time Format
ECP$NewDateTime <- as.POSIXct(ECP$DateTime, format = " %d/%m/%Y %H:%M:%S")

#Subset Data Frame to Specified Period
ECP_Subset2 <- subset(ECP, ECP$NewDateTime >= "2007-02-01 00:00:00" & ECP$NewDateTime <= "2007-02-02 23:59:00")

#Save as New File for Analysis
write.csv(ECP_Subset2, "/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/hpc_subset.csv")

## PLot 1

#reload CSV file and store as ECPNEW
ECPNEW <- read.csv("/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/hpc_subset.csv", header = TRUE, dec = ".")

# Create Plot1
png("/Users/xpinto/Desktop/Data_Science/Course 4 - Exploratory Data Analysis/ExData_Plotting1/Plot1.png", width = 480, height = 480)
hist(ECPNEW$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

