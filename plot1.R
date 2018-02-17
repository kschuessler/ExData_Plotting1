## read data into R, subset data  for 1/2/2007 and 2/2/2007, and convert:

housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
housedata_sub <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

housedata_sub$Date <- as.Date(housedata_sub$Date,"%d/%m/%Y")
housedata_sub<-cbind(housedata_sub, "DateTime" = as.POSIXct(paste(housedata_sub$Date, housedata_sub$Time)))


## make plot:

png("plot1.png", width=480, height=480)

hist(housedata_sub$Global_active_power, 
     col = "RED", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()