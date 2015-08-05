# This R script loads the power consumption data
# and creates the third plot
library(lubridate)
library(gsubfn)
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
fi<-file('household_power_consumption.txt')
df<-sqldf("select * from fi where Date=='1/2/2007' or Date=='2/2/2007'",file.format = list(header = TRUE, sep = ";"),stringsAsFactors=FALSE)
close(fi)
df$Date<-dmy_hms(paste(df$Date,df$Time))
df$Time<-NULL

# Create Plot 3
png(file='plot3.png')
plot(Sub_metering_1 ~ Date, df, type='l', xlab='', ylab='Energy sub metering')
with(df, points(Sub_metering_2 ~ Date, type='l', col='red'))
with(df, points(Sub_metering_3 ~ Date, type='l', col='blue'))
with(df, legend('topright',c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1,1), lwd=c(1,1,1), col=c('black','red','blue')))
dev.off()

