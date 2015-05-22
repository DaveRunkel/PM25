#Exploratory Data Analysis Project 2 PLot 4

##Clears up memory
rm(list=ls())
library(ggplot2)
library(dplyr)
##Pulls in Data
scc <- readRDS("./NEI_data/Source_Classification_Code.rds")
pm25 <-readRDS("./NEI_data/SummarySCC_PM25.rds")
##pulls only data for coal and combustion
comb <- grepl("comb",scc$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", scc$SCC.Level.Four, ignore.case=TRUE)
##Combines coal and combustion data
both <- merge(pm25, scc, by="SCC")
coalbustionpm25 <- both[grepl("coal",both$Short.Name,ignore.case=T),]
##starts write to file
png(filename="Plot4.png", width=480, height=480)
##Plots some stuff
ggplot(coalbustionpm25,aes(factor(year),Emissions, fill =type, alpha= 1/100))+
  geom_bar(stat="identity", theme="purple")+
  theme_bw()+
  labs(x="year", y="PM25 Emissions (Tons)") +
  labs(title = "Total Baltimore PM25 Emissions")
##turns off write to file
dev.off()
