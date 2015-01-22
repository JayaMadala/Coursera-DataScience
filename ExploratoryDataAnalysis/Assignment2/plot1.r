workdir="C:/Coursera-DataScience/ExploratoryDataAnalysis/Assignment2"
setwd(workdir)

#Read both the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Get the aggregate Emissions per year
EmissionTotal<-aggregate(Emissions ~ year, NEI, sum)

#plotting
png("plot1.png")

plot(EmissionTotal$year,EmissionTotal$Emissions,xaxt="n",
     main="Total Emissions from PM2.5 in US over years",
     xlab="Year",
     ylab="Total Emissions from PM2.5",
     type="o",
     col="blue",
     pch=19)

   axis(1, at = seq(1999, 2008, by = 3), las=2)

dev.off()