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
plotRGB(img2, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.2 <- drawExtent()

###img3
plotRGB(img3, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.3 <- drawExtent()

###img4
plotRGB(img4, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.4 <- drawExtent()

###img5
plotRGB(img5, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.5 <- drawExtent()

###img6
plotRGB(img6, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.6 <- drawExtent()

###img7
plotRGB(img7, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.7 <- drawExtent()

###img8
plotRGB(img8, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.8 <- drawExtent()

###img9
plotRGB(img9, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.9 <- drawExtent()

###img10
plotRGB(img10, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.10 <- drawExtent()

###img11
plotRGB(img11, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.11 <- drawExtent()

###img12
plotRGB(img12, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.12 <- drawExtent()

###img13
plotRGB(img13, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.13 <- drawExtent()

###img14
plotRGB(img14, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.14 <- drawExtent()

###img15
plotRGB(img15, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.15 <- drawExtent()

###img16
plotRGB(img16, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.16 <- drawExtent()

###img17
plotRGB(img17, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.17 <- drawExtent()

###img18
plotRGB(img18, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.18 <- drawExtent()

###img19
plotRGB(img19, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.19 <- drawExtent()

###img20
plotRGB(img20, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.20 <- drawExtent()

###img21
plotRGB(img21, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.21 <- drawExtent()

###img22
plotRGB(img22, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.22 <- drawExtent()

###img23
plotRGB(img23, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.23 <- drawExtent()

###img24
plotRGB(img24, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.24 <- drawExtent()

###img25
plotRGB(img25, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.25 <- drawExtent()

###img26
plotRGB(img26, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.26 <- drawExtent()

###img27
plotRGB(img27, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.27 <- drawExtent()

###img28
plotRGB(img28, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.28 <- drawExtent()

###img29
plotRGB(img29, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.29 <- drawExtent()

###img30
plotRGB(img30, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.30 <- drawExtent()

###img31
plotRGB(img31, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.31 <- drawExtent()

###img32
plotRGB(img32, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.32 <- drawExtent()

###img33
plotRGB(img33, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.33 <- drawExtent()

###img34
plotRGB(img34, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.34 <- drawExtent()

###img35
plotRGB(img35, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.35 <- drawExtent()

###img36
plotRGB(img36, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.36 <- drawExtent()

###img37
plotRGB(img37, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.37 <- drawExtent()

###img38
plotRGB(img38, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.38 <- drawExtent()

###img39
plotRGB(img39, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.39 <- drawExtent()

###img40
plotRGB(img40, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.40 <- drawExtent()

###img41
plotRGB(img41, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.41 <- drawExtent()

###img42
plotRGB(img42, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.42 <- drawExtent()

###img43
plotRGB(img43, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.43 <- drawExtent()

###img44
plotRGB(img44, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.44 <- drawExtent()

###img45
plotRGB(img45, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.45 <- drawExtent()

###img46
plotRGB(img46, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.46 <- drawExtent()

###img47
plotRGB(img47, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.47 <- drawExtent()

###img48
plotRGB(img48, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.48 <- drawExtent()

###img49
plotRGB(img49, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.49 <- drawExtent()

###img50
plotRGB(img50, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.50 <- drawExtent()

###img51
plotRGB(img51, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.51 <- drawExtent()

###img52
plotRGB(img52, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB

Ext.52 <- drawExtent()


##########################################################################################

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

write.csv(MM9,"MM9.csv")


#23
L.MM23<-ls(pattern="S.MM23")
L.MM23<-lapply(L.MM23,get)
MM23<-do.call("rbind", L.MM23)

write.csv(MM23,"MM23.csv")

#44
L.MM44<-ls(pattern="S.MM44")
L.MM44<-lapply(L.MM44,get)
MM44<-do.call("rbind", L.MM44)

write.csv(MM44,"MM44.csv")

#50
L.MM50<-ls(pattern="S.MM50")
L.MM50<-lapply(L.MM50,get)
MM50<-do.call("rbind", L.MM50)

write.csv(MM50,"MM50.csv")

#80
L.MM80<-ls(pattern="S.MM80")
L.MM80<-lapply(L.MM80,get)
MM80<-do.call("rbind", L.MM80)

write.csv(MM80,"MM80.csv") #Export as csv

#End
#########################################
