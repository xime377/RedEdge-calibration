#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(reshape2)
library(raster)
library(maptools)
library(stringr)
library(Rmisc)


#Load imgs
dir(,"tif")
T.img.path <- lapply(list.files(path=("./Calibration/Micasense test 23-02-17/000"), (pattern="0004.*.tif$"), 
                                full.names=T), raster) #Load all bands
T.img <- stack(T.img.path)
beginCluster()#to speed up the process
plotRGB(T.img, r=3, g=2, b=1, 65535, colNA='white')  #PlotRGB
endCluster()

cubeView(T.img) #Click on show in new window

# PLot G band 
plot(T.img@layers[[2]])  #Plot G band

#Select target extent
cat("Click two points to define the target\n")
Mica.E <- drawExtent()

#Calculate mean pixel values under each target polygon for each image band
cat("Extracting target pixels\n")
Mica.v <- extract(T.img, Mica.E, df=T)
Mica.L <- melt(Mica.v, variable.name="Band", value.name = "DN") #Puts all the values in one column
head(Mica.L)

Mica.M<- summarySE(Mica.L, measurevar="DN", groupvars="Band")
Mica.M

write.csv(Mica.m,"Mica_values.csv")

#End
##################