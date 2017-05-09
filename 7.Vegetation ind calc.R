#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")


###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(raster)


#Load functions
source("./lib/Veg.indices.R")

##Load orthomosaics

O1<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_ReflectanceT.tif")

plotRGB(O1, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB


##Calculate vegetation indices

#TCARI/OSAVI
T.O<-EVI(O1)
plot(T.O)
writeRaster(T.O, "./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_TCARI_OSAVI.tif",
                        datatype="INT2U",   options="COMPRESS=NONE", overwrite=T)

#GI
gi<-GI(O1)
plot (Gi)
writeRaster(Gi, "./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_GI.tif",
            datatype="INT2U",   options="COMPRESS=NONE", overwrite=T)

#NDVI green
ndvi<-NDVI(O1)
plot(ndvi)
writeRaster(ndvi, "./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_NDVI.tif",
            datatype="INT2U",   options="COMPRESS=NONE", overwrite=T)


#NDVRe ndvi2

#Evi

remove
VI<-

#Save them as raster

for (i in lenght())


