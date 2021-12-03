NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorveh <- grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCCmotorveh <- SCC[motorveh,]
NEImotorveh <- merge(NEI, SCCmotorveh, by="SCC")

compare <- subset(NEImotorveh, fips=="24510" | fips=="06037")
compare$city <- ifelse(compare$fips=="24510", "Baltimore", "Los Angeles")

Emissions <- aggregate(Emissions ~ year + city, compare, sum)

library(ggplot2)
png("plot6.png")

g <- ggplot(Emissions, aes(x=year, y=Emissions, color=city))
g <- g + geom_line(lwd=1.5) + geom_point() + xlab("Year") + ylab("Total PM.25 Emissions (Tons)") + ggtitle("Emissions from Motor Vehicle Sources in Baltimore vs. Los Angeles")
print(g)

dev.off()
