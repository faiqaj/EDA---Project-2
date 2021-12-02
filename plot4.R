NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalcombustion <- (combustion & coal)
combustionSCC <- SCC[coalcombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

library(ggplot2)

png("plot4.png")

g <- ggplot(combustionNEI, aes(factor(year), Emissions), ylim(0,8))
g <- g + geom_bar(stat="identity", width = 0.5) + xlab("Year") + ylab("Total PM2.5 Emissions (Tons)") + ggtitle('Total Emissions from Coal Sources by Year')
print(g)

dev.off()
