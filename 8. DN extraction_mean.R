###Set WD
setwd("H:/Ximena/MSc Thesis/Results")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
library(raster)
#library("sf")



##Import GCPs
GCP8<-read.csv("./Validation/GCP_08_SWEREF.csv", header=T)
GCP24<-read.csv("./Validation/GCP_24_SWEREF.csv", header=T)
head(GCP8)

# ##Convert to Sp <- st_as_sf(pnt, coords = c("x", "y"), crs = 4326)
# GCP8<- st_as_sf(GCP8, coords = c("Lon.East.", "Lat.North."), crs = 4326)
# head(GCP8)
# 
# GCP24<- st_as_sf(GCP24, coords = c("Lon.East.", "Lat.North."), crs = 4326)
# head(GCP24)

#Convert to spatial points
coordinates(GCP8) <- cbind(GCP8$Lon.East. , GCP8$Lat.North.)
coordinates(GCP24) <- cbind(GCP24$Lon.East. , GCP24$Lat.North.)

##Load veg indices
#08-04
#tcari/osavi
T.O.path1 <- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/"), pattern="tcariOsavi.*.tif$", 
                          full.names=T)
T.O1<- lapply(T.O.path1,raster)
names(T.O1)<-T.O.path1

#gi
gi.path1 <- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/"), pattern="gi.*.tif$", 
                        full.names=T)
gi1<- lapply(gi.path1,raster)
names(gi1)<-gi.path1

#ndvi
ndvi.path1 <- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/"), pattern="ndvi.*.tif$", 
                       full.names=T)
ndvi1<- lapply(ndvi.path1,raster)
names(ndvi1)<-ndvi.path1

#ndre
ndre.path1 <- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/"), pattern="ndre.*.tif$", 
                       full.names=T)
ndre1<- lapply(ndre.path1,raster)
names(ndre1)<-ndre.path1

#evi
evi.path1 <- list.files(path=("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/"), pattern="evi.*.tif$", 
                       full.names=T)
evi1<- lapply(evi.path1,raster)
names(evi1)<-evi.path1


#24-03
#tcari/osavi
T.O.path2 <- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/VI/Flight_2/"), pattern="tcariOsavi.*.tif$", 
                        full.names=T)
T.O2<- lapply(T.O.path2,raster)
names(T.O2)<-T.O.path2

#gi
gi.path2 <- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/VI/Flight_2/"), pattern="gi.*.tif$", 
                        full.names=T)
gi2<- lapply(gi.path2,raster)
names(gi2)<-gi.path2

#ndvi
ndvi.path2 <- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/VI/Flight_2/"), pattern="ndvi.*.tif$", 
                       full.names=T)
ndvi2<- lapply(ndvi.path2,raster)
names(ndvi2)<-ndvi.path2

#ndre
ndre.path2 <- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/VI/Flight_2/"), pattern="ndre.*.tif$", 
                       full.names=T)
ndre2<- lapply(ndre.path2,raster)
names(ndre2)<-ndre.path2

#evi
evi.path2 <- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/VI/Flight_2/"), pattern="evi.*.tif$", 
                       full.names=T)
evi2<- lapply(evi.path2,raster)
names(evi2)<-evi.path2



##Plot gcps and vi map
plot(T.O1[[1]])
plot(GCP8, add=T)

plot(ndvi2[[1]])
plot(GCP24, add=T)



##Extract values of 0.6 m buffer from the gcps (max FOV of the ASD)
#08-04
tcario8 <- lapply(T.O1, extract, GCP8, buffer=0.6, fun=mean)
GI.8 <- lapply(gi1, extract, GCP8, buffer=0.6, fun=mean)
NDVI.8 <- lapply(ndvi1, extract, GCP8, buffer=0.6, fun=mean)
NDRE.8 <- lapply(ndre1, extract, GCP8, buffer=0.6, fun=mean)
EVI.8<- lapply(evi1, extract, GCP8, buffer=0.6, fun=mean)

#24-03
tcario24 <- lapply(T.O2, extract, GCP24, buffer=0.6, fun=mean)
GI.24 <- lapply(gi2, extract, GCP24, buffer=0.6, fun=mean)
NDVI.24 <- lapply(ndvi2, extract, GCP24, buffer=0.6, fun=mean)
NDRE.24 <- lapply(ndre2, extract, GCP24, buffer=0.6, fun=mean)
EVI.24 <- lapply(evi2, extract, GCP24, buffer=0.6, fun=mean)

#Remove data execpt the extracted values
rm(list=ls(pattern="T.O"))
rm(list=ls(pattern="gi"))
rm(list=ls(pattern="ndvi"))
rm(list=ls(pattern="ndre"))
rm(list=ls(pattern="evi"))
rm(list=ls(pattern="GCP"))

#Save result
for(i in 1:11) {
  write.csv(
    mget(ls()[[i]]),
    file = paste0("./Validation/DN_mean/", ls()[[i]], ".csv"))
}


#End
######################################################################
