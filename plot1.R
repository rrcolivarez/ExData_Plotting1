#Read, name and subset power_table
power_table <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_table) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_table <- subset(power_table,power_table$Date=="1/2/2007" | power_table$Date =="2/2/2007")

#hist plot function
png("plot1.png", width=480, height=480)

hist(as.numeric(subpower_table$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

dev.off()
