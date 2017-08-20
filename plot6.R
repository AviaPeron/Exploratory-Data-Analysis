library("ggplot2")

if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}
## Subset the dataset to Emission In Baltimore City + LA  and the type = ON-ROAD
MotDatLABal <- subset(NEI, NEI$fips %in% c("06037", "24510") & NEI$type == "ON-ROAD")

## Summrize the Emission per year and type
AggSum6 <- aggregate(Emissions ~ year + fips, MotDatLABal, sum)

##replace to country names instead nubers
AggSum6$fips <- gsub("06037", "Los Angeles County",AggSum6$fips)
AggSum6$fips <- gsub("24510", "Baltimore City",AggSum6$fips )

## Create a plot
g <- ggplot(AggSum6, aes(year, Emissions, color = fips))
g + geom_line() +
  labs( x= "Year", y = expression("Total PM" [2.5]*""), title = "Total Emission From Motor Vehicle Per Year In Baltimore and LA")
dev.copy(png, file = "plot6.png")
dev.off()