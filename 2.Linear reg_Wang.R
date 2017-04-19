#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
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

#Load functions
source("./lib/load.file.R")

#Load data
dir(,"csv")

S<-read.csv("./Calibration/Mean_Ref.csv", header=T)
head(S)

C.path<-"./Calibration/Cal_pics/"
load.file(C.path, "MM.*.csv")

head(MM23)
str(MM23)

##Regression x=DN, y=mean reflectance targets

MM9$X<-substr(MM9$Band,10,10)
MM23$X<-substr(MM23$Band,10,10)
MM44$X<-substr(MM44$Band,10,10)
MM50$X<-substr(MM50$Band,10,10)
MM80$X<-substr(MM80$Band,10,10)

head(MM44)

M9<-merge(MM9, S[,c(1:2,3)], by="X")
head(M9)
M23<-merge(MM23, S[,c(1:2,4)], by="X")
head(M23)
M44<-merge(MM44, S[,c(1:2,5)], by="X")
head(M44)
M50<-merge(MM50, S[,c(1:2,6)], by="X")
head(M50)
M80<-merge(MM80, S[,c(1:2,7)], by="X")
head(M80)


#Plot Gray target reflectance vs DNs






##Regression x=DN, y=mean reflectance targets





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
