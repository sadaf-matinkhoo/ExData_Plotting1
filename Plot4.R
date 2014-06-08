install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007'", sep=";")
data2 <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '2/2/2007'", sep=";")
subdata<-rbind(data,data2)

png("plot4.png")

par(mfrow=c(2,2))

x=seq(as.POSIXct("2007-02-01 00:00:00"),by="mins",length.out=24*2*60)
plot(x, y=subdata$Global_active_power, type="s",ylab="Global Active Power (kilowatts)")

x=seq(as.POSIXct("2007-02-01 00:00:00"),by="mins",length.out=24*2*60)
plot(x, y=subdata$Voltage, type="s",ylab="Voltage", xlab="datetime")

x=seq(as.POSIXct("2007-02-01 00:00:00"),by="mins",length.out=24*2*60)
plot(x, y=subdata$Sub_metering_1, type="s",ylab="Energy sub metering",xlab="")
lines(x, y=subdata$Sub_metering_2, type="s", col="red")
lines(x, y=subdata$Sub_metering_3, type="s", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, bty="n")

x=seq(as.POSIXct("2007-02-01 00:00:00"),by="mins",length.out=24*2*60)
plot(x, y=subdata$Global_reactive_power, type="s",ylab="Global_reactive_power", xlab="datetime")


dev.off()

