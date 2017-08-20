## Read the files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}
## merge the data and subset by coal
AllData <- merge(SCC, NEI, by = "SCC")
SCCoal <- grepl("coal", AllData$Short.Name, ignore.case = TRUE)
DatCoal <- AllData[SCCoal,]

## Summrize the Emission per year
Sum4 <- with(DatCoal, tapply(Emissions, year, sum))

## Create a barplot
barplot(Sum4, xlab = "Year", ylab = "Total Emissions From Coal", main = "Total Emission From Coal Per Year")
dev.copy(png, file = "plot4.png")
dev.off()