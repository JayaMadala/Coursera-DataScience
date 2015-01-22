workdir="C:/Coursera-DataScience/ExploratoryDataAnalysis/Assignment2"
setwd(workdir)

#Read both the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Retrive Baltimore motor vehicle data and get the sum of Emission in each year
NEI.Baltimore<-subset(NEI,fips == "24510" & type=="ON-ROAD")
NEI.Baltimore.Emission<-aggregate(Emissions~year,NEI.Baltimore,sum)
NEI.Baltimore.Emission$State<-"Baltimore,MD"

#Retrive Los Angles motor vehicle data and get the sum of Emission in each year
NEI.LosAngles<-subset(NEI,fips == "06037" & type=="ON-ROAD")
NEI.LosAngles.Emission<-aggregate(Emissions~year,NEI.LosAngles,sum)
NEI.LosAngles.Emission$State<-"Los Angles,CA"

#Merge both states data after adding the State column
BothStates<-rbind(NEI.Baltimore.Emission,NEI.LosAngles.Emission)

library(ggplot2)

png("plot6.png")

ggplot(BothStates,aes(x=factor(year),y=Emissions,group=State,shape=State,color=State)) 
        + geom_line(size=1) 
        + geom_point(size=4)
        + xlab("Year") 
        + ylab(expression("total PM"[2.5]*" emissions")) 
        + ggtitle(" Motor Vehicle Emission in Baltimore and Los Angles")
        + theme_bw()

dev.off()
