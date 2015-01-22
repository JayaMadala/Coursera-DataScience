workdir="C:/Coursera-DataScience/ExploratoryDataAnalysis/Assignment2"
setwd(workdir)

#Read both the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Retreive Baltimore data from the NEI the data set
NEI.Baltimore<-subset(NEI,fips == "24510")

#Get the aggregate Emissions per year
NEI.Baltimore.EmissionTotal<-aggregate(Emissions ~ year, NEI.Baltimore, sum)

#Plotting
png("plot2.png")

barplot(NEI.Baltimore.EmissionTotal$Emissions,
        main="Total PM2.5 Emission in Baltimore(Maryland) over years", 
        xlab="year",  
        ylab="Total PM2.5 Emissions", 
        names.arg=c("1999","2002","2005","2008"),
        las=2,
        width=0.5,
        border="blue",
        col="blue")

dev.off()