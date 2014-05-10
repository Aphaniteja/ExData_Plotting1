hpc <- read.table("household_power_consumption.txt",
skip = 66637, nrow = 2880, sep = ";",
col.names = colnames(read.table(
"household_power_consumption.txt",
nrow = 1, header = TRUE, sep=";")))
hist(hpc1$Global_active_power,col="red",xlab="Global Active Power (kilowats)")


