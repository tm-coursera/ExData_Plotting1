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

# plot
hist(dfplot1$Global_active_power, main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, width = 480, height=480, file = "plot1.png")
dev.off()