

##load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##start plotting
NEI <- NEI[NEI$fips == "24510",]
pmTotals <- aggregate(Emissions ~ year,NEI, sum)
png(filename = "plot3.png")
library(ggplot2)
png3 <- ggplot(data = NEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(cols=vars(type),scales = "free",space="free") + 
  labs(x="Year", y="Total PM2.5 Emission (Tons)") + 
  labs(title="Total PM2.5 emissions in Baltimore City during 1999-2008 by Source Type")
print(png3)
dev.off()

