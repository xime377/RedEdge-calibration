#Set WD
setwd("H:/Ximena/MSc Thesis/Results/UAV imagery/")
#setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results/UAV imagery/")

###Load libraries
library(raster)
library(RStoolbox)
library(rgdal)


###Load imgs
#Band1
T.img.path1 <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/000"), pattern="_1.*.tif$", 
                                full.names=T)

T.img1<- lapply(T.img.path1,raster) #Load all bands
names(T.img1)<-T.img.path1

#Band2
T.img.path2 <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/000"), pattern="_2.*.tif$", 
                          full.names=T)

T.img2<- lapply(T.img.path2,raster) #Load all bands
names(T.img2)<-T.img.path2


#Band3
T.img.path3 <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/000"), pattern="_3.*.tif$", 
                          full.names=T)

T.img3<- lapply(T.img.path3,raster) #Load all bands
names(T.img3)<-T.img.path3

#Band4
T.img.path4 <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/000"), pattern="_4.*.tif$", 
                          full.names=T)

T.img4<- lapply(T.img.path4,raster) #Load all bands
names(T.img4)<-T.img.path4

#Band5
T.img.path5 <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/000"), pattern="_5.*.tif$", 
                          full.names=T)

T.img5<- lapply(T.img.path5,raster) #Load all bands
names(T.img5)<-T.img.path5


###
#Matching histogram for band 1
for (i in 1:length(T.img1))   
{
  T.img1[[i]] <- histMatch(T.img1[[i]],T.img1[[32]])   #histogram matching imgage 31
  writeRaster(T.img1[[i]],paste0("./Lonnstorp/2017_04_08/Micasense/Flight_2/H/",
                                substr(names(T.img1[i]),47,56),".tif"),datatype="INT2U",
              options="COMPRESS=NONE")
}


#Check if it worked
img1<-raster("./Lonnstorp/2017_04_08/Micasense/Flight_2/000/IMG_0031_1.tif")
img2<-raster("./Lonnstorp/2017_04_08/Micasense/Flight_2/000/IMG_0001_1.tif")
imgH<-raster("./Lonnstorp/2017_04_08/Micasense/Flight_2/H/IMG_0001_1.tif")

par(mfrow=c(2,2))
plot(imgH)
plot(img1)
plot(img2)

hist(imgH)
hist(img2)
hist(img1)

compareRaster(imgH,img2)

########################################################################################

#Matching histogram for band 2

for (i in 1:length(T.img2))   
{
  T.img2[[i]] <- histMatch(T.img2[[i]],T.img2[[32]])   #histogram matching imgage 31
  writeRaster(T.img2[[i]],paste0("./Lonnstorp/2017_04_08/Micasense/Flight_2/H/",
                                 substr(names(T.img2[i]),47,56),".tif"),datatype="INT2U",
              options="COMPRESS=NONE")
}


#################################################################################################

#Matching histogram for band 3

for (i in 1:length(T.img3))   
{
  T.img3[[i]] <- histMatch(T.img3[[i]],T.img3[[32]])   #histogram matching imgage 31
  writeRaster(T.img3[[i]],paste0("./Lonnstorp/2021_04_08/Micasense/Flight_2/H/",
                                substr(names(T.img3[i]),47,56),".tif"),datatype="INT2U",
  options="COMPRESS=NONE")
}

#################################################################################################

#Matching histogram for band 4

for (i in 1:length(T.img4))   
{
  T.img4[[i]] <- histMatch(T.img4[[i]],T.img4[[32]])   #histogram matching imgage 31
  writeRaster(T.img4[[i]],paste0("./Lonnstorp/2021_04_08/Micasense/Flight_2/H/",
                                 substr(names(T.img4[i]),47,56),".tif"),datatype="INT2U",
              options="COMPRESS=NONE")
}

#################################################################################################

#Matching histogram for band 5

for (i in 1:length(T.img5))   
{
  T.img5[[i]] <- histMatch(T.img5[[i]],T.img5[[32]])   #histogram matching imgage 31
  writeRaster(T.img5[[i]],paste0("./Lonnstorp/2021_04_08/Micasense/Flight_2/H/",
                                 substr(names(T.img5[i]),47,56),".tif"),datatype="INT2U",
              options="COMPRESS=NONE")
}
