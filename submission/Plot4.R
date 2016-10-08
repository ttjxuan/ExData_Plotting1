### project 1
# read data
hhp <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

library(date)
library(lubridate)

# subset
hhpuse <- hhp[which(dmy(hhp[,1])>="2007-2-1" & dmy(hhp[,1]) <= "2007-2-2"),]

## png 4
par(mfrow=c(2,2))
## top left
a <- ymd_hms(paste(as.Date((dmy(hhpuse$Date))),as.character(hhpuse$Time)))
plot(a, as.numeric(as.character(hhpuse$Global_active_power)),
     ylab = "Global Active Power(Kilowatts)",type="l",xlab = "")

## top right
plot(a,as.character(hhpuse$Voltage),xlab="datetime",type = "l",ylab="Voltage")

# bottom left
with(hhpuse,plot(a,as.character(hhpuse$Sub_metering_1),type = "l",
                 ylab="Energy sub metering",xlab = ""))
with(hhpuse,lines(a,as.character(hhpuse$Sub_metering_2),col = "red",type = "l"))
with(hhpuse,lines(a,as.character(hhpuse$Sub_metering_3),col = "blue",type = "l"))
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,lwd = 1,bty="n",cex=0.8,y.intersp = 0.5)

## bottom right
plot(a,as.character(hhpuse$Global_reactive_power),xlab = "datetime",ylab="Global_reactive_power",type="l")

dev.copy(png,"plot4.png",width=480,height=480)
dev.off()
