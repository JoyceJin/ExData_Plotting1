library(dplyr)

# Read dataset
electric <- read.table("./data/household_power_consumption.txt", sep=";",header=T)
SetTime <-strptime(paste(electric$Date, electric$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
electric <- cbind(electric,SetTime)

# Subset data
elec2 <- electric[electric$Date %in% c("1/2/2007","2/2/2007"),]
head(elec2)
tail(elec2)
sapply(elec2,class)
elec2$Global_active_power<-as.numeric(paste(elec2$Global_active_power))
summary(elec2$Global_active_power)

# Plot the data
png("plot1.png")
hist(elec2$Global_active_power, col='red', 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     xlim=c(0, 6))
dev.off()

