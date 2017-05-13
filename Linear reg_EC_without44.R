#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(ggplot2)
library(reshape2)
library(raster)
library(maptools)
library(stringr)
library(Rmisc)
library(cowplot)


#Load functions
source("./lib/load.file.R")
source("./lib/plot.replicates.R")

#Load data
dir(,"csv")

S<-read.csv("./Calibration/Mean_Ref.csv", header=T)
head(S)

C.path<-"./Calibration/Cal_pics/"
load.file(C.path, "ECMM.*.csv")

head(ECMM23)
str(ECMM23)

##Regression x=DN, y=mean reflectance targets

#Create a common column
ECMM9$X<-substr(ECMM9$Band,10,10)
ECMM23$X<-substr(ECMM23$Band,10,10)
ECMM50$X<-substr(ECMM50$Band,10,10)
ECMM80$X<-substr(ECMM80$Band,10,10)

head(ECMM23)

#Calculate DN average per Target

L.val<-ls(pattern="ECMM")
T.val<-lapply(L.val,get)
names(T.val)<-L.val


for (i in 1:length(L.val))   #For all the df on the list
{
  T.val[[i]] <- summarySE(T.val[[i]], measurevar="DN", groupvars="X")
  assign(paste0("S.",names(T.val[i])),T.val[[i]])
}

  
#Join the two datasets using the column X 

T9<-merge(S.ECMM9, S[,c(1:2,3)], by="X")
names(T9)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T9)
T23<-merge(S.ECMM23, S[,c(1:2,4)], by="X")
names(T23)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T23)
T50<-merge(S.ECMM50, S[,c(1:2,6)], by="X")
names(T50)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T50)
T80<-merge(S.ECMM80, S[,c(1:2,7)], by="X")
names(T80)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T80)

T9$Lab<-"MM10"
T23$Lab<-"MM23"
T50$Lab<-"MS55"
T80$Lab<-"MS66"
  
summary(T9)
summary(T23)
summary(T50)
summary(T80)

##Combine all the df into one
RefT<-rbind(T9,T23,T50,T80)

summary(RefT)

write.csv(RefT,"RefTargetsEC_w44.csv")

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
LR.1$coefficients #  2.638e-06 DN -5.044e-02  
summary(LR.1)


plot(LR.1) #http://data.library.virginia.edu/diagnostic-plots/
# Residual standard error: 0.0628 on 2 degrees of freedom
#Multiple R-squared:  0.971
 
#Band 2
LR.2 <-lm(Reflectance~DN, G)
LR.2$coefficients #    2.295e-06 DN -7.579e-02
summary(LR.2)

plot(LR.2)
# Residual standard error: 0.04958 on 2 degrees of freedom
#Multiple R-squared:  0.9815 

#Band 3
LR.3 <-lm(Reflectance~DN, R)
LR.3$coefficients #   5.253e-06  DN -1.111e-01
summary(LR.3)

plot(LR.3)
# Residual standard error: 0.04958 on 2 degrees of freedom
#Multiple R-squared:  0.9815

#Band 4
LR.4 <-lm(Reflectance~DN, NIR)
LR.4$coefficients # 5.954e-06 DN -1.559e-01
summary(LR.4)

plot(LR.4)
# Residual standard error: 0.03345 on 2 degrees of freedom
#Multiple R-squared:  0.9902,	Adjusted R-squared:  0.9854 

#Band 5
LR.5 <-lm(Reflectance~DN, Re)
LR.5$coefficients  #5.441e-06 DN -2.259e-02    
summary(LR.5)


plot(LR.5)
#Residual standard error: 0.05064 on 2 degrees of freedom
#Multiple R-squared:  0.9799



##########################Plot all together
par(mfrow=c(2,3))
plot(Reflectance~DN, B, font.lab=2,cex.lab=1.6, cex.axis=1.5, ylim=c(0, 1), xlim=c(15000, 360000))  
abline(LR.1,col="red",lwd=2) 
text(Reflectance~DN, B, Lab, cex=1.6, pos=3)


plot(Reflectance~DN, G, font.lab=2,cex.lab=1.6, cex.axis=1.5, ylim=c(0, 1), xlim=c(15000,  360000))  
abline(LR.2,col="red",lwd=2) 
text(Reflectance~DN, G, Lab, cex=1.6, pos=3)
 

plot(Reflectance~DN, R, font.lab=2,cex.lab=1.6, cex.axis=1.5, ylim=c(0, 1), xlim=c(15000,  360000))  
abline(LR.3,col="red",lwd=2) 
text(Reflectance~DN, R, Lab, cex=1.6, pos=3)


plot(Reflectance~DN, NIR, font.lab=2,cex.lab=1.6, cex.axis=1.5, ylim=c(0, 1), xlim=c(15000, 360000))  
abline(LR.4,col="red",lwd=2) 
text(Reflectance~DN, NIR, Lab,cex=1.6, pos=3)


plot(Reflectance~DN, Re, font.lab=2,cex.lab=1.6, cex.axis=1.5, ylim=c(0, 1), xlim=c(15000, 360000))  
abline(LR.5,col="red",lwd=2) 
text(Reflectance~DN, Re, Lab,  cex=1.6, pos=3)



#Plot all bands together
ggplot(RefT, aes(x = DN, y = Reflectance, colour=Band)) + 
  geom_point()+
  geom_smooth(method = "lm", se=F)+
  scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))+
  xlab("Digital Number (DN)") + ylab("Reflectance") +
  background_grid(major = "none", minor = "none")



##############################################################################################################

