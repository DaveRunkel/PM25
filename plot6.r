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
baltimore$city <- "Baltimore City"
##LA data
la  <- vroompm25[vroompm25$fips=="06037",]
la$city <- "Los Angeles County"
##both r-bound
boffum <- rbind(baltimore,la)
##opens write to file
png(filename="Plot6.png", width=480, height=480)
##Plots some stuff
ggplot(boffum,aes(x=factor(year),y=Emissions/10^3, fill =city))+
  geom_bar(aes(fill=year),stat="identity")+
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE)+
  labs(x="year", y="Vehicle PM25 Emissions (kiloTons)") +
  labs(title = "Vehicle Emissions: Baltimore vs. LA")
##turns off write to file
dev.off()