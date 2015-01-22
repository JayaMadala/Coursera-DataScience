workdir="C:/Coursera-DataScience/ExploratoryDataAnalysis/Assignment2"
setwd(workdir)

#Read both the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Retreive Baltimore data from the NEI the data set
NEI.Baltimore<-subset(NEI,fips == "24510")

#Get the aggregate Emissions per year and source type
NEI.Baltimore.EmissionTotal<-aggregate(Emissions ~ year+type, NEI.Baltimore, sum)

#Plotting
library(ggplot2)
png("plot3.png")

ggplot(NEI.Baltimore.EmissionTotal,aes(x=factor(year),y=Emissions,fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(. ~ type) +
        ggtitle("Total PM 2.5 Emissions across sources in Baltimore over years") +
        xlab("Year") +
        ylab("Emissions from PM2.5") +
        theme_bw() +
        theme(axis.text.x = element_text(angle = 45, hjust=1))
       
dev.off()