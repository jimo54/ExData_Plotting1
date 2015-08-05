# This R script loads the power consumption data
# and creates the first plot
library(lubridate)
library(gsubfn)
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
fi<-file('household_power_consumption.txt')
df<-sqldf("select * from fi where Date=='1/2/2007' or Date=='2/2/2007'",file.format = list(header = TRUE, sep = ";"),stringsAsFactors=FALSE)
close(fi)
df$Date<-dmy_hms(paste(df$Date,df$Time))
df$Time<-NULL

# Create Plot 1
png(file='plot1.png')
hist(df$Global_active_power, col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()

