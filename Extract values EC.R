#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(Rmisc) To install several packages at the same time
library(reshape2)
library(raster)
library(maptools)
library(stringr)
library(Rmisc)


#Load functions
source("./lib/load.file.R")


#Load exif info
exif.path <- "./Calibration/Cal_pics/EC/" 
load.file(exif.path, ".csv")


#load all the exif as a list
remove(list=c("load.file", "exif.path"))

exif.l<-ls()
exif<-lapply(exif.l,get)
names(exif)<-exif.l

#Load imgs
dir(,"tif")

T.img.path1 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0008.*.tif$"), 
                                 full.names=T), raster) #9%

T.img.path2 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0004.*.tif$"), 
                                 full.names=T), raster) #9

T.img.path3 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0145.*.tif$"), 
                                 full.names=T), raster) #9%

T.img.path4 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0147.*.tif$"), 
                                 full.names=T), raster) #9%

T.img.path5 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0148.*.tif$"), 
                                 full.names=T), raster) #9%

T.img.path6 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0009.*.tif$"), 
                                 full.names=T), raster) #23%

T.img.path7 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0005.*.tif$"), 
                                 full.names=T), raster) #23

T.img.path8 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0146.*.tif$"), 
                                 full.names=T), raster) #23%

T.img.path9 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0145.*.tif$"), 
                                 full.names=T), raster) #23%

T.img.path10 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0146.*.tif$"), 
                                  full.names=T), raster) #23%

T.img.path11 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0007.*.tif$"), 
                                  full.names=T), raster) #44%

T.img.path12 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0003.*.tif$"), 
                                  full.names=T), raster) #44

T.img.path13 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0147.*.tif$"), 
                                  full.names=T), raster) #44%

T.img.path14 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0143.*.tif$"), 
                                  full.names=T), raster) #44%

T.img.path15<- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0144.*.tif$"), 
                                 full.names=T), raster) #44%

T.img.path16 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path17 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0116.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path18 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0122.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path19 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/1/before/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path20 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/1/after/"), (pattern="0000.*.tif$"),
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path21 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0002.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path22 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0003.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path23 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0007.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path24 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0008.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path25 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path26 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path27 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0002.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path28 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0141.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path29 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0142.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path30 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0141.*.tif$"), 
                                  full.names=T), raster) #RP02-...282 ->50%

T.img.path31 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0123.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path32 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path33 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path34 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0004.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path35 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0005.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path36 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_11_03/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path37 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_11_03/2/"), (pattern="0002.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path38 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_12_02/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path39 <- lapply(list.files(path=("./Calibration/Cal_pics/2016_12_02/"), (pattern="0002.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path40 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/1/after/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path41 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/1/before/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path42 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path43 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path44 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0005.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path45 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0006.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path46 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0001.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path47 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0006.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path48 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path49 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path50 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0143.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path51 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0144.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%

T.img.path52 <- lapply(list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0142.*.tif$"), 
                                  full.names=T), raster) #RP02-...200 ->80%



#Group all the images in one list
L.img<-ls(pattern="path")
T.img<-lapply(L.img,get)
names(T.img)<-L.img


#Exposure compensation
source("./lib/Exposure.compensation.R")

for (i in 1:length(T.img)){
  for (j in 1:length(T.img[[i]]))
    {
  T.img[[i]][[j]]<-EC(T.img[[i]][[j]],exif[[i]]$FNumber[[j]],exif[[i]]$ExposureTime[[j]],exif[[i]]$ISOSpeed[[j]]) #EC function
  #writeRaster(T.img[[i]],paste0("./Calibration/Cal_pics/EC/",
  #                              substr(names(T.img[i]),59,68),".tif"), datatype="INT2U",
  #            options="COMPRESS=NONE", overwrite=T)
}
}

#Stack all the images at once
for (i in 1:length(T.img))
{
  T.img[[i]] <- stack(T.img[[i]])   #stack images
  assign(paste0("img", substr(names(T.img[i]),11,12)), T.img[[i]])  #output as df
}

#Load extents
load("D:/Google Drive/MSc Thesis/Results/Calibration/Cal_pics/Extent.RData")


#Extract values
cat("Extracting target pixels\n")
MM9.1<- extract(img1, Ext.1, df=T)
MM9.2<- extract(img2, Ext.2, df=T)
MM9.3<- extract(img3, Ext.3, df=T)
MM9.4<- extract(img4, Ext.4, df=T)
MM9.5<- extract(img5, Ext.5, df=T)
MM23.1<- extract(img6, Ext.6, df=T)
MM23.2<- extract(img7, Ext.7, df=T)
MM23.3<- extract(img8, Ext.8, df=T)
MM23.4<- extract(img9, Ext.9, df=T)
MM23.5<- extract(img10, Ext.10, df=T)
MM44.1<- extract(img11, Ext.11, df=T)
MM44.2<- extract(img12, Ext.12, df=T)
MM44.3<- extract(img13, Ext.13, df=T)
MM44.4<- extract(img14, Ext.14, df=T)
MM44.5<- extract(img15, Ext.15, df=T)
MM50.1<- extract(img16, Ext.16, df=T)
MM50.2<- extract(img17, Ext.17, df=T)
MM50.3<- extract(img18, Ext.18, df=T)
MM50.4<- extract(img19, Ext.19, df=T)
MM50.5<- extract(img20, Ext.20, df=T)
MM50.6<- extract(img21, Ext.21, df=T)
MM50.7<- extract(img22, Ext.22, df=T)
MM50.8<- extract(img23, Ext.23, df=T)
MM50.9<- extract(img24, Ext.24, df=T)
MM50.10<- extract(img25, Ext.25, df=T)
MM50.11<- extract(img26, Ext.26, df=T)
MM50.12<- extract(img27, Ext.27, df=T)
MM50.13<- extract(img28, Ext.28, df=T)
MM50.14<- extract(img29, Ext.29, df=T)
MM50.15<- extract(img30, Ext.30, df=T)
MM80.1<- extract(img31, Ext.31, df=T)
MM80.2<- extract(img32, Ext.32, df=T)
MM80.3<- extract(img33, Ext.33, df=T)
MM80.4<- extract(img34, Ext.34, df=T)
MM80.5<- extract(img35, Ext.35, df=T)
MM80.6<- extract(img36, Ext.36, df=T)
MM80.7<- extract(img37, Ext.37, df=T)
MM80.8<- extract(img38, Ext.38, df=T)
MM80.9<- extract(img39, Ext.39, df=T)
MM80.10<- extract(img40, Ext.40, df=T)
MM80.11<- extract(img41, Ext.41, df=T)
MM80.12<- extract(img42, Ext.42, df=T)
MM80.13<- extract(img43, Ext.43, df=T)
MM80.14<- extract(img44, Ext.44, df=T)
MM80.15<- extract(img45, Ext.45, df=T)
MM80.16<- extract(img46, Ext.46, df=T)
MM80.17<- extract(img47, Ext.47, df=T)
MM80.18<- extract(img48, Ext.48, df=T)
MM80.19<- extract(img49, Ext.49, df=T)
MM80.20<- extract(img50, Ext.50, df=T)
MM80.21<- extract(img51, Ext.51, df=T)
MM80.22<- extract(img52, Ext.52, df=T)


################################################################################

##Calculate mean pixel values under each target polygon for each image band
L.val<-ls(pattern="MM")
T.val<-lapply(L.val,get)
names(T.val)<-L.val

for (i in 1:length(L.val))   #For all the df on the list
{
  T.val[[i]] <- melt(T.val[[i]], variable.name="Band", value.name = "DN") #Puts all the values in one column
  assign(paste0("L.",names(T.val[i])),T.val[[i]])
}


L.val<-ls(pattern="L.MM")
T.val<-lapply(L.val,get)
names(T.val)<-L.val


for (i in 1:length(L.val))   #For all the df on the list
{
  T.val[[i]] <- summarySE(T.val[[i]], measurevar="DN", groupvars="Band")
  assign(paste0("S.",substr(names(T.val[i]),3,9)),T.val[[i]])
}


##############################################################################

#Combine the df according to the target
#9
L.MM9<-ls(pattern="S.MM9")
L.MM9<-lapply(L.MM9,get)
MM9<-do.call("rbind", L.MM9)

write.csv(MM9,"ECMM9.csv")

#23
L.MM23<-ls(pattern="S.MM23")
L.MM23<-lapply(L.MM23,get)
MM23<-do.call("rbind", L.MM23)

write.csv(MM23,"ECMM23.csv")

#44
L.MM44<-ls(pattern="S.MM44")
L.MM44<-lapply(L.MM44,get)
MM44<-do.call("rbind", L.MM44)

write.csv(MM44,"ECMM44.csv")

#50
L.MM50<-ls(pattern="S.MM50")
L.MM50<-lapply(L.MM50,get)
MM50<-do.call("rbind", L.MM50)

write.csv(MM50,"ECMM50.csv")

#80
L.MM80<-ls(pattern="S.MM80")
L.MM80<-lapply(L.MM80,get)
MM80<-do.call("rbind", L.MM80)

write.csv(MM80,"ECMM80.csv") #Export as csv


#End
#########################################