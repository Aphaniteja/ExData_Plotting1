hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",
                  col.names = colnames(read.table(
                          "household_power_consumption.txt",
                          nrow = 1, header = TRUE, sep=";")))
hpc1=hpc
library(lubridate)
q<-hpc1$Date
q<-dmy(q)
hpc1$Date<-q
p<-wday(hpc1$Date)
p[p==5]<-"Thursday"
p[p==6]<-"Friday"
hpc1$weekday<-p
hpc1$Full<-as.POSIXct(paste(hpc1$Date, hpc1$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(hpc1$Full,hpc[,3],type="l",ylab="Global Active Power (kilowats)",xlab=" ")
plot(hpc1$Full,hpc[,5],type="l",ylab="Voltage",xlab=" datetime")
plot(hpc1$Full,hpc[,7],type="l",ylab="Energy sub meeting",xlab=" ")
points(hpc1$Full,hpc[,8],type="l",col="red")
points(hpc1$Full,hpc[,9],type="l",col="blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
plot(hpc1$Full,hpc[,4],type="l",ylab="Global_rective_power",xlab="datetime")
dev.off()