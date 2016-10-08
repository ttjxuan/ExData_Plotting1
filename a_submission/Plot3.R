### project 1
# read data
hhp <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

library(date)
library(lubridate)

# subset
hhpuse <- hhp[which(dmy(hhp[,1])>="2007-2-1" & dmy(hhp[,1]) <= "2007-2-2"),]
# day and time type 
a<- ymd_hms(paste(as.Date((dmy(hhpuse$Date))),as.character(hhpuse$Time)))
## png 3
par(mfrow=c(1,1))
with(hhpuse,plot(a,as.character(hhpuse$Sub_metering_1),type = "l",
                 ylab="Energy sub metering",xlab = ""))
with(hhpuse,lines(a,as.character(hhpuse$Sub_metering_2),col = "red",type = "l"))
with(hhpuse,lines(a,as.character(hhpuse$Sub_metering_3),col = "blue",type = "l"))
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,lwd = 1,cex = 0.8,y.intersp = 0.6)
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()