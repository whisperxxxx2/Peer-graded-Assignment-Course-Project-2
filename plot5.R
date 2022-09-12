

##load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##start plotting and subset motor vehicle sources in Baltimore City
NEI <- NEI[NEI$fips == "24510",]
NEI <- NEI[NEI$type == "ON-ROAD",]

totalPm <- aggregate(Emissions ~ year,NEI,sum)
png(filename = "plot5.png",width = 600, height = 500)
library(ggplot2)
png5 <- ggplot(data = NEI,aes(factor(year),Emissions,group=1)) +
  geom_bar(stat="identity") +
  labs(x="Year", y="Total PM2.5 Emission (Tons)") + 
  labs(title="Total PM2.5 emissions from motor vehicle sources during 1999-2008 in Baltimore City")
print(png5)
dev.off()
