#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
library(raster)



##Load files
#DLS
Exif<-read.csv("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/000/2017_04_08_2_Lonnstorp_EXIF.csv", header=T)
head(Exif)
names(Exif)


Exif<- Exif[,c("FileName", "DateTimeOriginal", "Irradiance")]

summary(Exif)

#PAR
PAR<-read.csv("./Calibration/Micasense test 08-04-17/Minicube/PAR_2017_08_04.csv", header=T)
head(PAR)

summary(PAR)

#Irradiance ASAD



#Load images
T.img.path<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/EC"), (pattern=".tif$"), 
                        full.names=T) #List images

T.img<- lapply(T.img.path,raster) #Load all bands
names(T.img)<-T.img.path


#Irradiance normalization

for (i in 1:length(T.img))   
{
  T.img[[i]]<-(T.img[[i]]* (1-Exif$Irradiance[i]))
  writeRaster(T.img[[i]],paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM_EC/",
                                substr(names(T.img[i]),58,67),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)  
}



#PAR normalization

for (i in 1:length(T.img))   
{
  T.img[[i]]<-(T.img[[i]]* (1-Exif$Irradiance[i]))
  writeRaster(T.img[[i]],paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM/",
                                substr(names(T.img[i]),59,68),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)  
}



