NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
motorSCC <- SCC[motor,]$SCC
motorNEI <- NEI[NEI$SCC %in% motorSCC,]
baltimoremotorNEI <- motorNEI[motorNEI$fips=="24510",]

library(ggplot2)
png("plot5.png")

g <- ggplot(baltimoremotorNEI,aes(factor(year),Emissions))
g <- g + geom_bar(stat="identity", width = 0.75) + xlab("Year") + ylab("Total PM.25 Emissions (Tons)") + ggtitle("Emissions from Motor Vehicle Sources in Baltimore City by Year")

print(g)
dev.off()
