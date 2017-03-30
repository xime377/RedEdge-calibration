#Set WD
#setwd("C:/Users/UAVstudent/Google Drive/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(ggplot2)
library(reshape2)
library(raster)
library(maptools)
library(stringr)
library(Rmisc)
library(mapview)

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


##Regression x=DN, y=mean reflectance targets
#Load data
dir(,"csv")
Mica.R<-read.csv("Mean_Ref.csv", header=T)
head(Mica.R)

#Combine data
Merge.M<-cbind(Mica.R,Mica.M)
Merge.M

#Split per band
B<-Merge.M[which(Merge.M$CWl.v==475),]
G<-
R<-
NIR<-
Re<-
  
  
#Linear regression
#Band 1
regr.l1 <-lm(RefConvol~DN, B)
regr.l1
summary(regr.l1)

dev.off()
plot(RefConvol~DN, Merge.M)
abline(regr.l) 
predict(regr.l)


#Log
regr.log <- glm(RefConvol~DN, Merge.M, family="binomial")


#Exponential
regr.e <- nls(RefConvol ~ exp(a + b * x), data = B, start = list(a = 0, b = 0))


##Natural logarithm of the reflectance
