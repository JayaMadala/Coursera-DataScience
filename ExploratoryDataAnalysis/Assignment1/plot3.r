workdir="C:/DataSpecilizationCourseWork/ExploratoryDataAnalysis/"

setwd(workdir)

#reading the whole dataset
Alldata=read.table("household_power_consumption.txt",sep=";", header=T,
              skip = 0, na.strings = "?", stringsAsFactors = FALSE)
colnames(Alldata)

#subsetting the data based on date
data_sub<-subset(Alldata,as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & 
                    as.Date(Date,"%d/%m/%Y") <= '2007-02-02')

#deleting original data
rm(Alldata)

#date conversion
data_sub$DateTime<-strptime(paste(data_sub$Date,data_sub$Time),format = "%d/%m/%Y %H:%M:%S")

#plotting
par(mfrow = c(1, 1))

with(data_sub, {
        plot(DateTime,Sub_metering_1,
                ylab="Energy sub meeting",
                xlab="",
                type="l")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"),lty=1 ,cex=0.8,
        legend=c("Sub_metering_1                     ",
                "Sub_metering_2                      ",
                "Sub_metering_3                      "))
} )

# copy plot to png file
dev.copy(png, file = "plot3.png")

# close connection to png device
dev.off()