#Read, name and subset power_table
power_table <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_table) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_table <- subset(power_table,power_table$Date=="1/2/2007" | power_table$Date =="2/2/2007")

datetime <- strptime(paste(subpower_table$Date, subpower_table$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  #Concatenate date and time with sep " " then strptime for YYYY-MM-DD HH:MM:SS
Global_active_power <- as.numeric(subpower_table$Global_active_power)

Sub_metering_1 <- as.numeric(subpower_table$Sub_metering_1)
Sub_metering_2 <- as.numeric(subpower_table$Sub_metering_2)
Sub_metering_3 <- as.numeric(subpower_table$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="", col="black")
lines(datetime,Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3 , type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
dev.off()
