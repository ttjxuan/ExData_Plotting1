### project 1
hhp <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

library(date)
library(lubridate)

hhpuse <- hhp[which(dmy(hhp[,1])>="2007-2-1" & dmy(hhp[,1]) <= "2007-2-2"),]

### png 1
par(mfrow=c(1,1))

a<-hist(as.numeric(as.character(hhpuse$Global_active_power)),
        freq = TRUE,xlab = "Global Active Power (Kilowatts)", main = "Global Active Power",
        col = "red")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()