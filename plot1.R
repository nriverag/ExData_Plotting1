# Import, working with dates and subset data
# Import
rm(list = ls())
Data <- read.table(file = "household_power_consumption.txt", sep = ";", header = T)
# Subset 
Subset_Data <- subset(Data, Data$Date=="1/2/2007" | Data$Date=="2/2/2007") 
names(Subset_Data)
attach(Subset_Data)
# Working with dates
Subset_Data$Date <- as.Date(Subset_Data$Date, format="%d/%m/%Y")
Subset_Data$Time <- strptime(Subset_Data$Time, format="%H:%M:%S")
Subset_Data[1:1440,"Time"] <- format(Subset_Data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Subset_Data[1441:2880,"Time"] <- format(Subset_Data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(Global_active_power), data = Subset_Data, 
     col = "red", main="Global Active Power",  
     xlab="Global Active Power (kilowatts)")
dev.off()
