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

# Plot
png("plot2.png")
plot(elec2$SetTime, elec2$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
