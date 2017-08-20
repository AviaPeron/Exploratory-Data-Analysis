## Read the files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Subset the dataset to Emission In Baltimore City and the type = ON-ROAD
MotDat <- subset(NEI, NEI$fips == "24510", NEI$type == "ON-ROAD")

## Summrize the Emission per year in Baltimore City
Sum5 <- with(MotDat, tapply(Emissions, year, sum))

## Create a barplot
barplot(Sum5, xlab = "Year", ylab = "Total Emissions From Motor Vehicle", main = "Total Emission From Motor Vehicle Per Year In Baltimore")
dev.copy(png, file = "plot5.png")
dev.off()