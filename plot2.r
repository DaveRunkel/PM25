#Exploratory Data Analysis Project 2 PLot 2

##Clears up memory
rm(list=ls())
##Pulls in Data
scc <- readRDS("./NEI_data/Source_Classification_Code.rds")
pm25 <-readRDS("./NEI_data/SummarySCC_PM25.rds")
##pulls only data for Baltimore
baltimore <- pm25[pm25$fips=="24510",]
#emtot <- aggregate(Emissions~year, pm25,sum)
#aggregate function sums on Emissions per year on baltimore data
emtotbalt <- aggregate(Emissions~year, baltimore,sum)
##starts write to file
png(filename="Plot2.png", width=480, height=480)
##Plots
barplot(emtotbalt$Emissions/10^3, names.arg= emtotbalt$year,col="red",xlab= "year", 
        ylab="PM25 Emissions (KiloTons)",main= "Total PM25 Emissions; Baltimore")
##kills write to process
dev.off()