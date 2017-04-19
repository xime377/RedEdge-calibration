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
library(cowplot)

#Load functions
source("./lib/load.file.R")
source("./lib/plot.replicates.R")

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

summary(RefT)

write.csv(RefT,"RefTargets.csv")

#Plot Gray target reflectance vs DNs
plot(Reflectance~DN, RefT)


  
#Split per band
B<-RefT[RefT$Band==1,]
G<-RefT[RefT$Band==2,]
R<-RefT[RefT$Band==3,]
NIR<-RefT[RefT$Band==4,]
Re<-RefT[RefT$Band==5,]
  

##Regression x=DN, y=mean reflectance targets https://www.otexts.org/fpp/4/4


#Linear regression
#Band 1
LR.1 <-lm(Reflectance~DN, B)
LR.1
summary(LR.1)

dev.off()
plot(Reflectance~DN, B)  
abline(LR.1) 

#Band 2
LR.2 <-lm(Reflectance~DN, B)
LR.2
summary(LR.2)

#Band 3
LR.3 <-lm(Reflectance~DN, B)
LR.3
summary(LR.3)

#Band 4
LR.4 <-lm(Reflectance~DN, B)
LR.4
summary(LR.4)

#Band 5
LR.5 <-lm(Reflectance~DN, B)
LR.5
summary(LR.5)



dev.off()
plot(Reflectance~DN, B)  
abline(LR.1) 

plot(Reflectance~DN, G)
abline(LR.2) 

plot(Reflectance~DN, R)  
abline(LR.3) 

plot(Reflectance~DN, NIR)  
abline(LR.4)

plot(Reflectance~DN, Re)  
abline(LR.5)



predict(LR.1)


#Exponential
Er.1 <- nls(RefConvol ~ exp(a + b * x), data = B, start = list(a = 0, b = 0))


##Natural logarithm of the reflectance






ggplot(RefT, aes(x = DN, y = Reflectance, colour=Band)) + 
  geom_point()+
  scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))+
  xlab("Digital Number (DN)") + ylab("Reflectance") +
  background_grid(major = "none", minor = "none")
