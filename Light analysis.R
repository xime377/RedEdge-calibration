#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")

#library(pacman)
#pacman::p_load(agricolae, Rmisc, ggplot2, cowplot) To install several packages at the same time
library(agricolae)
library(ggplot2)
library(reshape2)
library(Rmisc)
library(cowplot)
library(ggthemes)
library(dplyr)


#Load functions
source("./lib/load.file.R")
source("./lib/plot.replicates.R")
source("./lib/Ref.melt.R")



#Import reflectance values
dir(,"csv")

RefTar.path <- "./Calibration/" 
load.file(RefTar.path, "Tgt.csv")


#load all as a list
Targets.l<-ls(pattern="Tgt")
Targets<-lapply(Targets.l,get)
names(Targets)<-Targets.l


#Inspect data
sapply(Targets, str)

head(Targets$Mica50Tgt)
head(Targets$Mica80Tgt)
head(Targets$M9Tgt)
head(Targets$M23Tgt)
head(Targets$M44Tgt)


###Put all the values in one column

for (i in 1:length(Targets))   #For all the df on the list
{
  Targets[[i]] <- Ref.melt(Targets[[i]])   #melt data
  assign(paste0(names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
}


#Add one column with dates

head(M9Tgt)
M9Tgt$Date<-"25/03"
M9Tgt$Date[M9Tgt$Replicate=="X71"]<-"24/03"
M9Tgt$Date[M9Tgt$Replicate=="X72"]<-"24/03"
M9Tgt$Date[M9Tgt$Replicate=="X73"]<-"24/03"
M9Tgt$Date[M9Tgt$Replicate=="X74"]<-"24/03"
M9Tgt$Date[M9Tgt$Replicate=="X75"]<-"24/03"
M9Tgt$Date[M9Tgt$Replicate=="X188"]<-"28/03"
M9Tgt$Date[M9Tgt$Replicate=="X189"]<-"28/03"
M9Tgt$Date[M9Tgt$Replicate=="X190"]<-"28/03"
M9Tgt$Date[M9Tgt$Replicate=="X210"]<-"08/04"
M9Tgt$Date[M9Tgt$Replicate=="X211"]<-"08/04"
M9Tgt$Date[M9Tgt$Replicate=="X212"]<-"08/04"
M9Tgt$Date<-as.factor(M9Tgt$Date)


head(M23Tgt)
M23Tgt$Date<-"08/03"
M23Tgt$Date[M23Tgt$Replicate=="X77"]<-"24/03"
M23Tgt$Date[M23Tgt$Replicate=="X79"]<-"24/03"
M23Tgt$Date[M23Tgt$Replicate=="X81"]<-"24/03"
M23Tgt$Date[M23Tgt$Replicate=="X165"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X167"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X168"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X169"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X170"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X171"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X172"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X173"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X174"]<-"25/03"
M23Tgt$Date[M23Tgt$Replicate=="X184"]<-"28/03"
M23Tgt$Date[M23Tgt$Replicate=="X185"]<-"28/03"
M23Tgt$Date[M23Tgt$Replicate=="X186"]<-"28/03"
M23Tgt$Date[M23Tgt$Replicate=="X204"]<-"08/04"
M23Tgt$Date[M23Tgt$Replicate=="X206"]<-"08/04"
M23Tgt$Date[M23Tgt$Replicate=="X207"]<-"08/04"


head(M44Tgt)
M44Tgt$Date<-"08/03"
M44Tgt$Date[M44Tgt$Replicate=="X65"]<-"24/03"
M44Tgt$Date[M44Tgt$Replicate=="X66"]<-"24/03"
M44Tgt$Date[M44Tgt$Replicate=="X69"]<-"24/03"
M44Tgt$Date[M44Tgt$Replicate=="X146"]<-"25/03"
M44Tgt$Date[M44Tgt$Replicate=="X148"]<-"25/03"
M44Tgt$Date[M44Tgt$Replicate=="X150"]<-"25/03"
M44Tgt$Date[M44Tgt$Replicate=="X152"]<-"25/03"
M44Tgt$Date[M44Tgt$Replicate=="X153"]<-"25/03"
M44Tgt$Date[M44Tgt$Replicate=="X200"]<-"08/04"
M44Tgt$Date[M44Tgt$Replicate=="X201"]<-"08/04"
M44Tgt$Date[M44Tgt$Replicate=="X203"]<-"08/04"


head(Mica50Tgt)
Mica50Tgt$Date<-"23/02"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X27"]<-"07/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X28"]<-"07/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X179"]<-"25/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X180"]<-"25/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X181"]<-"25/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X182"]<-"25/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X183"]<-"25/03"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X216"]<-"08/04"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X217"]<-"08/04"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X218"]<-"08/04"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X219"]<-"08/04"
Mica50Tgt$Date[Mica50Tgt$Replicate=="X220"]<-"08/04"

head(Mica80Tgt)
Mica80Tgt$Date<-"08/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X15"]<-"07/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X16"]<-"07/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X175"]<-"25/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X176"]<-"25/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X177"]<-"25/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X178"]<-"25/03"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X213"]<-"08/04"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X214"]<-"08/04"
Mica80Tgt$Date[Mica80Tgt$Replicate=="X215"]<-"08/04"

#Plot by date
#Plot reflectance curve per target
p9<-plot.bydates(M9Tgt)
p23<-plot.bydates(M23Tgt)
p44<-plot.bydates(M44Tgt)
p50<-plot.bydates(Mica50Tgt)
p80<-plot.bydates(Mica80Tgt)

plot_grid(p9,p23,p44,p50,p80)


#Add column with sky char
head(M9Tgt)
M9Tgt$Light<-"Overcast"
M9Tgt$Light[M9Tgt$Date=="24/03"]<-"Clear sky"
M9Tgt$Light[M9Tgt$Date=="25/03"]<-"Cloudy"

head(M23Tgt)
M23Tgt$Light<-"Overcast"
M23Tgt$Light[M23Tgt$Date=="24/03"]<-"Clear sky"
M23Tgt$Light[M23Tgt$Date=="25/03"]<-"Cloudy"

head(M44Tgt)
M44Tgt$Light<-"Overcast"
M44Tgt$Light[M44Tgt$Date=="24/03"]<-"Clear sky"
M44Tgt$Light[M44Tgt$Date=="25/03"]<-"Cloudy"

head(Mica50Tgt)
Mica50Tgt$Light<-"Overcast"
Mica50Tgt$Light[Mica50Tgt$Date=="23/02"]<-"Cloudy"
Mica50Tgt$Light[Mica50Tgt$Date=="25/03"]<-"Cloudy"

head(Mica80Tgt)
Mica80Tgt$Light<-"Overcast"
Mica80Tgt$Light[Mica80Tgt$Date=="25/03"]<-"Cloudy"


#Plot by lightc
#Plot reflectance curve per target
l9<-plot.byLC(M9Tgt)
l23<-plot.byLC(M23Tgt)
l44<-plot.byLC(M44Tgt)
l50<-plot.byLC(Mica50Tgt)
l80<-plot.byLC(Mica80Tgt)

plot_grid(l9,l23,l44,l50,l80)

#Plot by replicate
# r9<-plot.byrep(M9Tgt)
# r23<-plot.byrep(M23Tgt)
# r44<-plot.byrep(M44Tgt)
# r50<-plot.byrep(Mica50Tgt)
# r80<-plot.byrep(Mica80Tgt)
# 
# plot_grid(r9,r23,r44,r50,r80)


  
