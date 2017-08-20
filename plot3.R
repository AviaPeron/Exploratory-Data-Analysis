library("ggplot2")
  
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Subset the dataset to Emission In Baltimore City only
NEISub <- subset(NEI, NEI$fips == "24510")

## Summrize the Emission per year and type in Baltimore City
AggSum3 <- aggregate(Emissions ~ year + type, NEISub, sum)
## Create a plot
g <- ggplot(AggSum3, aes(year, Emissions, color = type))
g + geom_line() +
  labs(x = "Year", y = expression("Total PM"[2.5]* "Emissions"), title = expression("PM"[2.5]*"In Baltimore Per Year"))

dev.copy(png, file = "plot3.png")
dev.off()