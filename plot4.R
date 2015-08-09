library(dplyr)

# Read dataset
electric <- read.table("./data/household_power_consumption.txt", sep=";",header=T)
SetTime <-strptime(paste(electric$Date, electric$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
electric <- cbind(electric,SetTime)

# Subset data
elec2 <- electric[electric$Date %in% c("1/2/2007","2/2/2007"),]
head(elec2)
tail(elec2)

elec2$Global_active_power<-as.numeric(paste(elec2$Global_active_power))
elec2$Sub_metering_1<-as.numeric(paste(elec2$Sub_metering_1))
elec2$Sub_metering_2<-as.numeric(paste(elec2$Sub_metering_2))
elec2$Sub_metering_3<-as.numeric(paste(elec2$Sub_metering_3))
elec2$Voltage<-as.numeric(paste(elec2$Voltage))

png("plot4.png")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(elec2$SetTime, elec2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(elec2$SetTime, elec2$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(elec2$SetTime, elec2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(elec2$SetTime, elec2$Sub_metering_2, type="l", col="red")
lines(elec2$SetTime, elec2$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(elec2$SetTime, elec2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
