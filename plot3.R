## read data into R, subset data  for 1/2/2007 and 2/2/2007, and convert:

housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
housedata_sub <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

housedata_sub$Date <- as.Date(housedata_sub$Date,"%d/%m/%Y")
housedata_sub<-cbind(housedata_sub, "DateTime" = as.POSIXct(paste(housedata_sub$Date, housedata_sub$Time)))


## make plot:

png("plot3.png", width=480, height=480)

with(housedata_sub, {
        plot(Sub_metering_1 ~ DateTime,
             type = "l",
             ylab = "Energy sub metering", 
             xlab = "")
        lines(Sub_metering_2 ~ DateTime, col = "Red")
        lines(Sub_metering_3 ~ DateTime, col = "Blue")
})
legend("topright", 
       col = c("black", "red", "blue"), 
       lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()