#Set WD
setwd("H:/Ximena/MSc Thesis/Results")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
library(raster)
library(ggplot2)


##Load files
#DLS
Exif<-read.csv("./UAV imagery/Lonnstorp/2017_03_24/Micasense/Flight_2/000/2017_03_24_2_Lonnstorp_EXIF.csv", header=T)
head(Exif)
names(Exif)


Exif<- Exif[,c("FileName", "DateTimeOriginal", "Irradiance")]

summary(Exif)
#Max=1.5255

#Rescaling because values are higher than 1
Exif$IrradianceN<-Exif$Irradiance/(max(Exif$Irradiance))


#Load images
T.img.path<- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/Micasense/Flight_2/000"), (pattern=".tif$"), 
                        full.names=T) #List images

T.img<- lapply(T.img.path,raster) #Load all bands
names(T.img)<-T.img.path


#Irradiance normalization

for (i in 1:length(T.img))   
{
  T.img[[i]]<-(T.img[[i]]* (1-Exif$IrradianceN[i])) #Normalized irradiance
    writeRaster(T.img[[i]],paste0("./UAV imagery/Lonnstorp/2017_03_24/Micasense/Flight_2/IC/",
                                substr(names(T.img[i]),59,68),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)  
}



#PAR normalization

for (i in 1:length(T.img))   
{
  T.img[[i]]<-(T.img[[i]]* (1-Exif$PAR[i]))
  writeRaster(T.img[[i]],paste0("./UAV imagery/Lonnstorp/2017_03_07/Micasense/Flight_1/PAR/",
                                substr(names(T.img[i]),59,68),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)  
}



