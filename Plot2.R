install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007'", sep=";")
data2 <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '2/2/2007'", sep=";")
subdata<-rbind(data,data2)

x=seq(as.POSIXct("2007-02-01 00:00:00"),by="mins",length.out=24*2*60)
plot(x, y=subdata$Global_active_power, type="s",ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()