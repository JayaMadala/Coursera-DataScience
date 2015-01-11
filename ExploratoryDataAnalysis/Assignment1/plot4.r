workdir="C:/DataSpecilizationCourseWork/ExploratoryDataAnalysis/"

setwd(workdir)
#reading the whole dataset
dt=read.table("household_power_consumption.txt",sep=";", header=T,
              skip = 0, na.strings = "?", stringsAsFactors = FALSE)
colnames(dt)
#subsetting the data based on date
dt1<-subset(dt,as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & 
                    as.Date(Date,"%d/%m/%Y") <= '2007-02-02')


#reading the subset of data
#dt3=subset(read.table("household_power_consumption.txt",sep=";", header=T,
#                     skip = 0, na.strings = "?", stringsAsFactors = FALSE),as.Date(Date,"%d/%m/%Y") >= '2007-01-01' & 
#                   as.Date(Date,"%d/%m/%Y") <= '2007-02-02')


head(dt1,10)
dt1$DateTime<-strptime(paste(dt1$Date,dt1$Time),format = "%d/%m/%Y %H:%M:%S")
#dt3$DateTime <- strptime(dt3$DateTime, format = "%d/%m/%Y %H:%M:%S")
#as.numeric(dt3$Global_active_power)
dt1[complete.cases(dt1[,3]),]
#as.numeric(levels(dt3[,3])[dt3[,3]])
#as.numeric(as.character(Global_active_power))
str(dt1)

par(mfrow = c(2, 2))
#png(file ="plot4.png")
with(dt1, {
        plot(DateTime,Global_active_power,
                ylab="Global Active Power",
                xlab="",
                type="l")
        plot(DateTime,Voltage,
                ylab="Voltage",
                xlab="datetime",
                type="l")
        plot(DateTime,Sub_metering_1,
                ylab="Energy sub meeting",
                xlab="",
                type="l")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"),lty=1 ,cex=0.8,box.lwd=1,
        legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))
        plot(DateTime,Global_reactive_power,
                ylab="Global_reactive_power",
                xlab="datetime",
                type="l")
})
# copy plot to png file
dev.copy(png, file = "plot4.png")

# close connection to png device
dev.off()