## Read the files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Summrize the Emission per year
with(NEI, tapply(Emissions, year, sum))

## Create a barplot
barplot(Sum1, xlab = "Year", ylab = "Total", main = "Total PM2.5 Emission")

## Export as PNG file
dev.copy(png, file = "plot1.png")
dev.off()