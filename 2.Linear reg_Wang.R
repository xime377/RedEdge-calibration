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

#Create a common column
MM9$X<-substr(MM9$Band,10,10)
MM23$X<-substr(MM23$Band,10,10)
MM44$X<-substr(MM44$Band,10,10)
MM50$X<-substr(MM50$Band,10,10)
MM80$X<-substr(MM80$Band,10,10)

head(MM44)

#Join the two datasets using the column X 
T9<-merge(MM9, S[,c(1:2,3)], by="X")
names(T9)<-c("Band", "iName", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T9)
T23<-merge(MM23, S[,c(1:2,4)], by="X")
names(T23)<-c("Band", "iName", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T23)
T44<-merge(MM44, S[,c(1:2,5)], by="X")
names(T44)<-c("Band", "iName", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T44)
T50<-merge(MM50, S[,c(1:2,6)], by="X")
names(T50)<-c("Band", "iName", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T50)
T80<-merge(MM80, S[,c(1:2,7)], by="X")
names(T80)<-c("Band", "iName", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T80)



summary(T9$X9)
summary(T23$X23)
summary(T44$X44)
summary(T50$X50)
summary(T80$X80)

##Combine all the df into one
RefT<-rbind(T9,T23,T44,T50,T80)


#Split per band
B<-RefT[RefT$Band==1,]
G<-RefT[RefT$Band==2,]
R<-RefT[RefT$Band==3,]
NIR<-RefT[RefT$Band==4,]
Re<-RefT[RefT$Band==5,]
  
  
#Plot Gray target reflectance vs DNs






##Regression x=DN, y=mean reflectance targets


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
