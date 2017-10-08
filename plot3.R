# setwd("./project1") 

library(dplyr)
library(lubridate)
library(stringr)
Sys.setlocale(category = "LC_ALL", locale = "english")

dfplot <- read.table("household_power_consumption_subset.txt", #nrows = 10, 
                     dec=".", sep = ";" , header = TRUE, na.strings = "?") %>%
        mutate(DateTime = dmy_hms(paste(Date, Time, sep = " ")),
               Weekday = wday(DateTime, label=TRUE))

#set plots per device
par(mfcol=c(1,1))

#plot
png(filename ="plot3.png", width = 480, height=480)
plot(x=dfplot$DateTime, y= dfplot$Sub_metering_1, type="n", xlab = "", 
     ylab = "Energy sub metering")
lines(x=dfplot$DateTime, y = dfplot$Sub_metering_1)
lines(x=dfplot$DateTime, y = dfplot$Sub_metering_2, col="red")
lines(x=dfplot$DateTime, y = dfplot$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, width = 480, height=480, file = "plot3.png")
dev.off()