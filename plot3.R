NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore  <- subset(NEI, fips=="24510")
baltimoretype <- aggregate(Emissions ~ year + type, baltimore, sum)

library(ggplot2)
png("plot3.png",width=640,height=480)
g <- g + geom_line(lwd = 1.5) + xlab("Year") + ylab("Total PM2.5 Emissions (Tons)") + ggtitle('Total PM2.5 Emissions in Baltimore City, Maryland by Year & Type')
print(g)

dev.off()
