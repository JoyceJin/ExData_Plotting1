library(dplyr)

# Read dataset
electric <- read.table("./data/household_power_consumption.txt", sep=";",header=T)
SetTime <-strptime(paste(electric$Date, electric$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
electric <- cbind(electric,SetTime)

# Subset data
elec2 <- electric[electric$Date %in% c("1/2/2007","2/2/2007"),]
head(elec2)
tail(elec2)
elec2$Sub_metering_1<-as.numeric(paste(elec2$Sub_metering_1))
elec2$Sub_metering_2<-as.numeric(paste(elec2$Sub_metering_2))
elec2$Sub_metering_3<-as.numeric(paste(elec2$Sub_metering_3))

png("plot3.png")
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(elec2$SetTime, elec2$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(elec2$SetTime, elec2$Sub_metering_2, col=columnlines[2])
lines(elec2$SetTime, elec2$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()

