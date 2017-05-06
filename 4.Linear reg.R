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

#Calculate DN average per Target

L.val<-ls(pattern="MM")
T.val<-lapply(L.val,get)
names(T.val)<-L.val


for (i in 1:length(L.val))   #For all the df on the list
{
  T.val[[i]] <- summarySE(T.val[[i]], measurevar="DN", groupvars="X")
  assign(paste0("S.",names(T.val[i])),T.val[[i]])
}

  
#Join the two datasets using the column X 

T9<-merge(S.MM9, S[,c(1:2,3)], by="X")
names(T9)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T9)
T23<-merge(S.MM23, S[,c(1:2,4)], by="X")
names(T23)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T23)
T44<-merge(S.MM44, S[,c(1:2,5)], by="X")
names(T44)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T44)
T50<-merge(S.MM50, S[,c(1:2,6)], by="X")
names(T50)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T50)
T80<-merge(S.MM80, S[,c(1:2,7)], by="X")
names(T80)<-c("Band", "N", "DN", "sd", "se", "ci", "CWavelength", "Reflectance")
head(T80)


summary(T9)
summary(T23)
summary(T44)
summary(T50)
summary(T80)

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
LR.1$coefficients #  1.948739e-05 DN -3.675518e-01  
summary(LR.1)

plot(LR.1)
# Residual standard error: 0.2378 on 3 degrees of freedom
#Multiple R-squared:  0.4036,	Adjusted R-squared:  0.2048 
 
plot(Reflectance~DN, B)  
abline(LR.1) 

#Band 2
LR.2 <-lm(Reflectance~DN, G)
LR.2$coefficients #   1.874955e-05 DN -3.128298e-01
summary(LR.2)
# Residual standard error: 0.1769 on 3 degrees of freedom
# Multiple R-squared:  0.6663,	Adjusted R-squared:  0.555 

plot(Reflectance~DN, G)
abline(LR.2) 

#Band 3
LR.3 <-lm(Reflectance~DN, R)
LR.3$coefficients #   1.846254e-05  DN -2.894564e-01
summary(LR.3)
# Residual standard error: 0.1424 on 3 degrees of freedom
# Multiple R-squared:  0.7713,	Adjusted R-squared:  0.6951 
 
plot(Reflectance~DN, R)  
abline(LR.3) 

#Band 4
LR.4 <-lm(Reflectance~DN, NIR)
LR.4$coefficients # 1.571613e-05DN-1.227909e-01  
summary(LR.4)
# Residual standard error: 0.08032 on 3 degrees of freedom
# Multiple R-squared:  0.918,	Adjusted R-squared:  0.8906 

plot(Reflectance~DN, NIR)  
abline(LR.4)


#Band 5
LR.5 <-lm(Reflectance~DN, Re)
LR.5$coefficients  #1.572e-05DN-1.723e-01    
summary(LR.5)
# Residual standard error: 0.1813 on 3 degrees of freedom
# Multiple R-squared:  0.6216,	Adjusted R-squared:  0.4955 

plot(Reflectance~DN, Re)  
abline(LR.5)



#Exponential (http://stackoverflow.com/questions/31851936/exponential-curve-fitting-in-r)
##Natural logarithm of the reflectance
plot((log(Reflectance))~(log(DN)), RefT)  

ER.1<- lm((log(Reflectance)) ~ (log(DN)),B)
ER.1$coefficients  #2.630145DN-28.956509         

plot(Reflectance~DN, B)  
lines(log(B$DN), log(B$DN ^ ER.1$coefficients[2]), col = "red")

ER.1 <- nls(Reflectance ~ (DN^b), data = B, start = c(b = 0), trace = T)




ggplot(RefT, aes(x = DN, y = Reflectance, colour=Band)) + 
  geom_point()+
  geom_line()+
  scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))+
  xlab("Digital Number (DN)") + ylab("Reflectance") +
  background_grid(major = "none", minor = "none")
