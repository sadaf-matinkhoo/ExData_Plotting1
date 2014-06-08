install.packages("sqldf")
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007'", sep=";")
data2 <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '2/2/2007'", sep=";")
subdata<-rbind(data,data2)

hist(subdata$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file="plot1.png")
dev.off()