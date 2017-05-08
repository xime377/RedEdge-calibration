#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(Rmisc)
library(raster)

#Load functions
source("./lib/Cal.functions.R")

#Load constant calibration coefficients (offset per)
Coef<-read.csv("./Calibration/c_calibrationp.csv", header=T)
head(Coef)

#Load reflectance average of calibration target
R.A<-read.csv("./Calibration/MM10.csv", header=T)
head(R.A)



###Load Orthomosaic

Orthomosaic<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_withIM.tif")

plotRGB(Orthomosaic, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB



##Extract DN values of Calibration target
#Load target imgs
Ref.DN<- lapply(list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM"), (pattern="IMG_0065_*.*.tif$"),
                           full.names=T),raster) #List image with target MM10

Ref.DN<-stack(Ref.DN) #Stack images

plotRGB(Ref.DN, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB


#Select target extent
# cat("Click two points to define the target\n")
# Ext <- drawExtent()

#Load extent 
load("./Calibration/extent.65.RData") #It was saved to avoid doing the drawExtent all the time

#Extract the values and calculate the average
cat("Extracting target DNs\n")
DN.A<- extract(Ref.DN, Ext, df=T)
summary(DN.A)
DN.A<-data.frame(lapply(DN.A,mean))
DN.A<-t(DN.A)

  
Coef<-cbind(Coef,DN.A,R.A$Reflectance)
head(Coef)
names(Coef)<-c("Band","c","DN","R")



##Calculate the gain per band

Coef$m<-SC(Coef$R,Coef$DN,Coef$c)

###################################################################


##Calculate reflectance values for the Orthomosaic

# R<-LC(Coef$m, Orthomosaic, Coef$c)
# 
# #Save raster
# writeRaster(R, "./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_ReflectanceT.tif",
# datatype="INT2U",   options="COMPRESS=NONE", overwrite=T)



######################################################################


###Linear calibration per image
T.img.path1<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM/"), (pattern="_1.tif$"), 
                         full.names=T) #List images
T.img1<- lapply(T.img.path1,raster) #Load all bands
names(T.img1)<-T.img.path1

T.img.path2<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM/"), (pattern="_2.tif$"), 
                         full.names=T) #List images
T.img2<- lapply(T.img.path2,raster) #Load all bands
names(T.img2)<-T.img.path2

T.img.path3<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM/"), (pattern="_3.tif$"), 
                         full.names=T) #List images
T.img3<- lapply(T.img.path3,raster) #Load all bands
names(T.img3)<-T.img.path3

T.img.path4<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM/"), (pattern="_4.tif$"), 
                         full.names=T) #List images
T.img4<- lapply(T.img.path4,raster) #Load all bands
names(T.img4)<-T.img.path4

T.img.path5<- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/IM"), (pattern="_5.tif$"), 
                         full.names=T) #List images
T.img5<- lapply(T.img.path5,raster) #Load all bands
names(T.img5)<-T.img.path5


#Group all the images in one list
L.img<-ls(pattern="T.img")
T.img<-lapply(L.img,get)
names(T.img)<-L.img


#Calculate reflectance per band

#Band1
for (i in 1:length(T.img1)){
  T.img1[[i]]<- LC(Coef$m[1], T.img1[[i]], Coef$c[1])
  writeRaster(T.img1[[i]], paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/Reflectance/",
    substr(names(T.img1[i]),58,67),".tif"), datatype="INT2U",
    options="COMPRESS=NONE", overwrite=T)
  }

#Band2
for (i in 1:length(T.img2)){
  T.img2[[i]]<- LC(Coef$m[2], T.img2[[i]], Coef$c[2])
  writeRaster(T.img2[[i]], paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/Reflectance/",
                                  substr(names(T.img2[i]),58,67),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)
}

#Band3
for (i in 1:length(T.img3)){
  T.img3[[i]]<- LC(Coef$m[3], T.img3[[i]], Coef$c[3])
  writeRaster(T.img3[[i]], paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/Reflectance/",
                                  substr(names(T.img3[i]),58,67),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)
}

#Band4
for (i in 1:length(T.img4)){
  T.img4[[i]]<- LC(Coef$m[4], T.img4[[i]], Coef$c[4])
  writeRaster(T.img4[[i]], paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/Reflectance/",
                                  substr(names(T.img4[i]),58,67),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)
}

#Band5
for (i in 1:length(T.img5)){
  T.img5[[i]]<- LC(Coef$m[5], T.img5[[i]], Coef$c[5])
  writeRaster(T.img5[[i]], paste0("./UAV imagery/Lonnstorp/2017_04_08/Micasense/Flight_2/Reflectance/",
                                  substr(names(T.img5[i]),58,67),".tif"), datatype="INT2U",
              options="COMPRESS=NONE", overwrite=T)
}



#End
########
