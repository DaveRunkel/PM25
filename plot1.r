#Exploratory Data Analysis Project 2 PLot 1

##Clears up memory
rm(list=ls())
##Pulls in Data
scc <- readRDS("./NEI_data/Source_Classification_Code.rds")
pm25 <-readRDS("./NEI_data/SummarySCC_PM25.rds") 
##aggregate function sums on Emissions per year over all pm2.5 data
emtot <- aggregate(Emissions~year, pm25,sum)
## Sets up write file
png(filename="Plot1.png", width=480, height=480)
#Plots
barplot(emtot$Emissions/10^6, names.arg= emtot$year,col="blue",xlab= "year", ylab="PM25 Emissions (MegaTons)",
     main= "Total PM25 Emissions From all US Sources")
#turns off write to file
dev.off()
