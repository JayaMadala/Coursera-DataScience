workdir="C:/Coursera-DataScience/ExploratoryDataAnalysis/Assignment2"
setwd(workdir)

#Read both the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Retrive the data for Baltimore and motor vehicles
NEI.Baltimore<-subset(NEI,fips == "24510" & type=="ON-ROAD")

#Aggregate Emission for each year
NEI.Baltimore.Emission<-aggregate(Emissions~year,NEI.Baltimore,sum)

#Plotting
library(ggplot2)
png("plot5.png")

ggplot(NEI.Baltimore.Emission,aes(x=factor(year),y=Emissions)) +
        geom_bar(stat="identity", fill="blue",width=0.5) + 
        xlab("Year") +
        ylab(expression("total PM"[2.5]*" emissions"))  +
        ggtitle("Emissions from Motor Vehicles in Baltimore") +
        theme_bw()
        
dev.off()

