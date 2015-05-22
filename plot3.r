#Exploratory Data Analysis Project 2 PLot 3

##Clears up memory
rm(list=ls())
library(ggplot2)
##Pulls in Data
scc <- readRDS("./NEI_data/Source_Classification_Code.rds")
pm25 <-readRDS("./NEI_data/SummarySCC_PM25.rds")
##pulls only data for Baltimore
baltimore <- pm25[pm25$fips=="24510",]
#emtot <- aggregate(Emissions~year, pm25,sum)
#aggregate function sums on Emissions per year on baltimore data
emtotbalt <- aggregate(Emissions~year, baltimore,sum)
##starts write to file
png(filename="Plot3.png", width=480, height=480)
##Plots
ggplot(baltimore,aes(factor(year),Emissions, fill=type))+
       geom_bar(stat="identity")+
         theme_bw()+guides(fill=FALSE)+
         facet_grid(.~type,scales="free",space="free")+
         labs(x="year", y="PM25 Emissions (Tons)") +
         labs(title = "Total Baltimore PM25 Emissions")
       
##kills write to process
dev.off()