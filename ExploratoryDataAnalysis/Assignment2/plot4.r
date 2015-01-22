workdir="C:/Coursera-DataScience/ExploratoryDataAnalysis/Assignment2"
setwd(workdir)

#Read both the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Retriving Coal Combustion Sources for SCC
coalcombustion <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
SCC.coalcombustion <- SCC[coalcombustion,]

# Getting the corresponding records from NEI
NEI.coal <- NEI[(NEI$SCC %in% SCC.coalcombustion$SCC), ]
NEI.coal.year<-aggregate(Emissions~year,NEI.coal,sum)

png("plot4.png")

plot(NEI.coal.year$year,NEI.coal.year$Emissions,xaxt="n",main="Total Emissions from Coal Combustion related sources in US",
     xlab="Year",ylab=expression("total PM"[2.5]*" emissions"),type="o",col="blue",pch=19)
axis(1, at = seq(1999, 2008, by = 3), las=2)

dev.off()