#setwd("E:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
library(raster)
library(ggplot2)


##Load files
#DLS
Exif<-read.csv("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/000/2017_04_08_2_Lonnstorp_EXIF.csv", header=T)
head(Exif)



#Load images
T.img.path<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/EC"), (pattern=".tif$"), 
                        full.names=T) #List images

T.img<- lapply(T.img.path,raster) #Load all bands
names(T.img)<-T.img.path


#Irradiance normalization

for (i in 1:length(T.img))   
{
  T.img[[i]]<-(T.img[[i]]* (sin(Exif$SunA[i]*pi/180))
  writeRaster(T.img[[i]],paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM_EC/",
                                substr(names(T.img[i]),58,67),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)  
}















##################################################################################################################
datetime<-"2017-02-23 14:13:59 CEST" #date of the measurement
DOY<-DateToDOY(datetime)  #numeric vector containing the coverted date in Day Of the Year (DOY).
