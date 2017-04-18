#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(Rmisc) To install several packages at the same time
library(reshape2)
library(raster)
library(maptools)
library(stringr)
library(Rmisc)
library(mapview)

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

#Stack all the images at once
for (i in 1:length(T.img))   
{
  T.img[[i]] <- stack(T.img[[i]])   #stack images
  assign(paste0("img", substr(names(T.img[i]),11,12)), T.img[[i]])  #output as df
}


#Extract values for each stack
##img1
beginCluster()#to speed up the process
plotRGB(img1, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

# PLot Red Edge band 
plot(img1@layers[[5]])  

#Select target extent
cat("Click two points to define the target\n")
Ext.1 <- drawExtent()


###img2
beginCluster()#to speed up the process
plotRGB(img2, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

# PLot Red Edge band 
plot(img2@layers[[5]])  

#Select target extent
cat("Click two points to define the target\n")
Ext.2 <- drawExtent()

###img3
beginCluster()#to speed up the process
plotRGB(img3, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

# PLot Red Edge band 
plot(img3@layers[[5]])  

#Select target extent
cat("Click two points to define the target\n")
Ext.3 <- drawExtent()


###img4
beginCluster()#to speed up the process
plotRGB(img4, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

# PLot Red Edge band 
plot(img4@layers[[5]])  

#Select target extent
cat("Click two points to define the target\n")
Ext.4 <- drawExtent()

###img5
beginCluster()#to speed up the process
plotRGB(img5, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

# PLot Red Edge band 
plot(img5@layers[[5]])  

#Select target extent
cat("Click two points to define the target\n")
Ext.5 <- drawExtent()

###img6
beginCluster()#to speed up the process
plotRGB(img6, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

# PLot Red Edge band 
plot(img6@layers[[5]])  

#Select target extent
cat("Click two points to define the target\n")
Ext.6 <- drawExtent()





##########################################################################################
#Extract values
cat("Extracting target pixels\n")
MM9.1 <- extract(img1, Ext.1, df=T)






#Calculate mean pixel values under each target polygon for each image band
Mica.L <- melt(Mica.v, variable.name="Band", value.name = "DN") #Puts all the values in one column
head(Mica.L)
