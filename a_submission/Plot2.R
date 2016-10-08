### project 1
# read data
hhp <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

library(date)
library(lubridate)
dmy(hhp[1,1])
dmy(hhp[552,1])

# subset
hhpuse <- hhp[which(dmy(hhp[,1])>="2007-2-1" & dmy(hhp[,1]) <= "2007-2-2"),]

## png 2
par(mfrow=c(1,1))
a<- ymd_hms(paste(as.Date((dmy(hhpuse$Date))),as.character(hhpuse$Time)))
plot(a, as.numeric(as.character(hhpuse$Global_active_power)),
     ylab = "Global Active Power (Kilowatts)",type="l",xlab = "")

dev.copy(png,"plot2.png",width=480,height=480)
dev.off()