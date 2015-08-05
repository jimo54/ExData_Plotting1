# This R script loads the power consumption data
# and creates the second plot
library(lubridate)
library(gsubfn)
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
fi<-file('household_power_consumption.txt')
df<-sqldf("select * from fi where Date=='1/2/2007' or Date=='2/2/2007'",file.format = list(header = TRUE, sep = ";"),stringsAsFactors=FALSE)
close(fi)
df$Date<-dmy_hms(paste(df$Date,df$Time))
df$Time<-NULL

# Create Plot 2
png(file='plot2.png')
plot(Global_active_power ~ Date, df, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()

