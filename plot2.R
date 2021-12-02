NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips=="24510")
balt_emissions <- tapply(baltimore$Emissions, baltimore$year, sum)
png("plot2.png")
barplot(balt_emissions, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions in Baltimore City, Maryland by Year", ylim=c(0, 3500))

dev.off()
