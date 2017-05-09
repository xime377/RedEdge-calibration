#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")


###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(raster)


#Load functions
devtools::load_all("VegIndx")

##Load orthomosaics

O1<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_ReflectanceT.tif")


##Calculate vegetation indices

#TCARI/OSAVI
tcariOsavi<-TCARI.OSAVI(O1)
names(tcariOsavi)<-"TCARI/OSAVI"
  
#GI
gi<-GI(O1)
names(gi)<-"GI"

#NDVI 
ndvi<-NDVI(O1)
names(ndvi)<-"NDVI"
  
#NDRe 
ndrei<-NDRe(O1)
names(ndrei)<-"NDRe"

#Evi
evi<-EVI(O1)
names(evi)<-"EVI"


#Group VI
VI.list<-ls(patter="i")
VI<-lapply(VI.list,get)
names(VI)<-VI.list


#Vizualise all together
par(mfrow=c(3,2))

for (i in 1:length(VI))
  {plot(VI[[i]])}  
  
plotRGB(O1, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB 
  
   
#Save them as raster
for (i in 1:length(VI))
  writeRaster(VI[[i]], paste0("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_", 
                       names(VI[i])), datatype="INT2U",   options="COMPRESS=NONE", overwrite=T)


