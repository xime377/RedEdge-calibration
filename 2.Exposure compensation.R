#Set WD
setwd("H:/Ximena/MSc Thesis/Results")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(raster)


#Load Exif
exif<-read.csv("./UAV imagery/Lonnstorp/2016_11_03/Micasense/Flight_1/000/2016_11_03_Lonnstorp_EXIF.csv", header=T)
head(exif)

#Load images
T.img<- lapply(list.files(path=("./UAV imagery/Lonnstorp/2016_11_03/Micasense/Flight_1/000"), (pattern=".tif$"), 
                                full.names=T), raster) #Load all bands



#Exposure compensation


for (i in 1:length(T.img))   
{
  T.img1[[i]] <- (T.img1[[i]]*(((exif$FNumber[i])^2))/(exif$ExposureTime[i]*exif$ISOSpeed[i]))  
  writeRaster(T.img1[[i]],paste0("./Lonnstorp/2017_03_24/Micasense/Flight_2/H/",
                                 substr(names(T.img1[i]),47,56),".tif"),datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)
}


DN'=DN×k^2/