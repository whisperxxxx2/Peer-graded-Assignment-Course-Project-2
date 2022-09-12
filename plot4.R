

##load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##start plotting and subset coal combustion-related sources 

comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (comb & coal)
coalCombustionSCC <- SCC[coalCombustion,]$SCC
NEI <- NEI[NEI$SCC %in% coalCombustionSCC,]

png(filename = "plot4.png",width = 500, height = 500)
library(ggplot2)

png4 <- ggplot(data = NEI,aes(factor(year),Emissions,group=1)) +
  geom_bar(stat="identity") +
  labs(x="Year", y="Total PM2.5 Emission (Tons)") + 
  labs(title="Total PM2.5 emissions from coal combustion-related sources during 1999-2008 ")

print(png4)
dev.off()
