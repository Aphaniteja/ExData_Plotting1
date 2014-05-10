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
plot(hpc1$Full,hpc[,3],type="l",ylab="Global Active Power (kilowats)",xlab=" ")

