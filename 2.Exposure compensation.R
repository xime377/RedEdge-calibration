#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(raster)

#Load functions
source("./lib/Exposure.Compensation.R")

#Load Exif
exif<-read.csv("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/000/2017_04_08_2_Lonnstorp_EXIF.csv", header=T)
head(exif)

#Load images
T.img<- lapply(list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/000"), (pattern=".tif$"), 
                                full.names=T), raster) #Load all bands


#Individual test
#z=EC(T.img[[1]],exif$FNumber[1],exif$ExposureTime[1],exif$ISOSpeed[1])


#Exposure compensation

for (i in 1:length(T.img))   
{
    T.img[[i]]<-EC(T.img[[i]],exif$FNumber[i],exif$ExposureTime[i],exif$ISOSpeed[i])
    writeRaster(T.img[[i]],paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/EC/",
                              substr(names(T.img[i]),47,56),".tif"),
            options="COMPRESS=NONE", overwrite=T)  
}
