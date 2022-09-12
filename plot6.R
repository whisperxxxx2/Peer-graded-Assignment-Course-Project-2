
##load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##start plotting and subset motor vehicle sources in different Cities
BalNEI <- NEI[NEI$fips == "24510",]
BalNEI <- BalNEI[BalNEI$type == "ON-ROAD",]
BalNEI$city <- "Baltimore City"
LosNEI <- NEI[NEI$fips == "06037",]
LosNEI <- LosNEI[LosNEI$type == "ON-ROAD",]
LosNEI$city <- "Los Angeles County"
bothNEI <- rbind(LosNEI,BalNEI)

totalPm <- aggregate(Emissions ~ year,NEI,sum)
png(filename = "plot5.png",width = 600, height = 500)
library(ggplot2)

png6 <- ggplot(data = bothNEI,aes(factor(year),Emissions,fill=city)) +
  geom_bar(stat="identity") +
  facet_grid(.~city)+
  labs(x="Year", y="Total PM2.5 Emission (Tons)") + 
  labs(title="Total PM2.5 emissions from motor vehicle sources during 1999-2008 in Baltimore City")
print(png6)
dev.off()

