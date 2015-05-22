#Exploratory Data Analysis Project 2 PLot 5

##Clears up memory
rm(list=ls())
library(ggplot2)
library(dplyr)
##Pulls in Data
scc <- readRDS("./NEI_data/Source_Classification_Code.rds")
pm25 <-readRDS("./NEI_data/SummarySCC_PM25.rds")
##looks for motor vehicles
vroom <- grepl("vehicle",scc$SCC.Level.Two, ignore.case=TRUE)
##combines pm25 and scc
vroomer <- merge(pm25, scc, by="SCC")
vroompm25 <- vroomer[grepl("vehicle",vroomer$Short.Name,ignore.case=T),]
##Baltimore data
baltimore <- vroompm25[vroompm25$fips==24510,]
#vroomscc <- scc[vroom,]$SCC
#vroompm25 <- pm25[pm25$SCC %in% vroomscc,]
png(filename="Plot5.png", width=480, height=480)
##Plots some stuff
ggplot(baltimore,aes(factor(year),Emissions/10^3))+
  geom_bar(stat="identity", theme="grey")+
  theme_bw()+guides(fill=FALSE)+
  labs(x="year", y="Vehicle PM25 Emmissions (KiloTons)") +
  labs(title = "Total Baltimore vehicle Emissions")
##turns off write to file
dev.off()