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

plot(dt1$DateTime,dt1$Global_active_power,
     ylab="Global Active Power(kilowatts)",
     xlab="",
     type="l")

# copy plot to png file
dev.copy(png, file = "plot2.png")

# close connection to png device
dev.off()