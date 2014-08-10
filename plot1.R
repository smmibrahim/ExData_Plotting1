png(filename="plot1.png",height=480,width=480)
hpc <- read.csv2("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc$DateFormat <- as.Date(strptime(hpc$Date,"%d/%m/%Y"))
projdates <- hpc$DateFormat %in% c(as.Date("2007/02/01",format="%Y/%m/%d"),as.Date("2007/02/02",format="%Y/%m/%d"))
hpc2007020102 <- hpc[projdates,]
hpc2007020102$GlobalActivePower <- as.numeric(hpc2007020102$Global_active_power)
hpc2007020102$TimeFormat <- strptime(hpc2007020102$Time,"%H:%M:%S")
hist(hpc2007020102$GlobalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()