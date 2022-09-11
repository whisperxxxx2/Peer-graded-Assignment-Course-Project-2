##load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##start plotting
pmTotals <- aggregate(Emissions ~ year,NEI, sum)
png(filename = "plot1.png")
barplot(
  pmTotals$Emissions,
  names.arg=pmTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions(Tons)",
  main="Total PM2.5 Emission in the United States from 1999 to 2008"
)

dev.off()
