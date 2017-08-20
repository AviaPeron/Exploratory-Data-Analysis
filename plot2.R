## Read the files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Subset the dataset to Emission In Baltimore City only
NEISub <- subset(NEI, NEI$fips == "24510")

## Summrize the Emission per year in Baltimore City
Sum2 <- with(NEISub, tapply(Emissions, year, sum))

## Create a barplot
barplot(Sum2, xlab = "Year", ylab = "Total", main = "Total PM2.5 Emission")

## Export as PNG file
dev.copy(png, file = "plot2.png")
dev.off()