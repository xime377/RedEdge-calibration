#Set WD
#setwd("E:/Ximena/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")

###Load libraries
#install.packages("C:/Users/Ximena/Documents/R/FieldSpectroscopyDP_0.5.227.tar", repos = NULL,  type="source")
#install.packages("E:/FieldSpectroscopyDP_0.5.227.tar", repos = NULL,  type="source")

library("FieldSpectroscopyDP")
library(splines) #Dependency of F..DP
if(!require(SDMTools)) install.packages("SDMTools") #Dependency F...DP
library(SDMTools) #Dependency F...DP

#library(pacman)
#pacman::p_load(agricolae, Rmisc, ggplot2, cowplot) To install several packages at the same time
library(agricolae)
library(ggplot2)
library(reshape2)
library(Rmisc)
library(cowplot)


#Load functions
source("./lib/load.file.R")
source("./lib/plot.replicates.R")
source("./lib/Ref.melt.R")



#Import reflectance values
dir(,"csv")

RefTar.path <- "./Calibration/" 
load.file(RefTar.path, "Tgt.csv")


#load all as a list
Targets.l<-ls(pattern="Tgt")
Targets<-lapply(Targets.l,get)
names(Targets)<-Targets.l


#Inspect data
sapply(Targets, str)

head(Targets$Mica50Tgt)
head(Targets$Mica80Tgt)
head(Targets$M9Tgt)
head(Targets$M23Tgt)
head(Targets$M44Tgt)


#Import characteristics of the camera
MicaR<-read.csv("Micasense.csv", header=T)
str(MicaR)
head(MicaR)


###Put all the values in one column

for (i in 1:length(Targets))   #For all the df on the list
{
  Targets[[i]] <- Ref.melt(Targets[[i]])   #melt data
  assign(paste0(names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
  }


#Plot reflectance curve per target
p9<-plot.replicates(M9Tgt)
p23<-plot.replicates(M23Tgt)
p44<-plot.replicates(M44Tgt)
p50<-plot.replicates(Mica50Tgt)
p80<-plot.replicates(Mica80Tgt)

plot_grid(p9,p23,p44,p50,p80, align="h")


#Compute statistics from the Total ASD range
Targets.p<-ls(pattern="R.M")
Targets.r<-lapply(Targets.p,get)
names(Targets.r)<-Targets.p

for (i in 1:length(Targets))   #For all the df on the list
{
  Targets[[i]] <- summarySE(Targets[[i]], measurevar="Reflectance", groupvars=c("Replicate"))
  assign(paste0("Sum.R",names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
}
cat("Statistics per replicate (ASD range)\n")
summary(Sum.RM9Tgt)



#Extract Reflectance values from 465 - 860 nm (Micasense 2015)
for (i in 1:length(Targets))   #For all the df on the list
{
  Targets[[i]] <- Targets[[i]][(Targets[[i]]$Wavelength>=465) & (Targets[[i]]$Wavelength<=860), ]#subset
  assign(paste0("R.",names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
}

summary(Targets$M9Tgt)
summary(Targets$M23Tgt)
summary(Targets$M44Tgt)
summary(Targets$Mica50Tgt)
summary(Targets$Mica80Tgt)

#Compute statistics Micasense range
Targets.p<-ls(pattern="R.M")
Targets.r<-lapply(Targets.p,get)
names(Targets.r)<-Targets.p

#Range
Replicates.RM<-


###Tests to see near Lambertian properties

#Normality test -> Shapiro test
n.test<-aggregate(Reflectance~Replicate,data=Mica.Range, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test


##Plot multiple qqplots together
par(mfrow=c(2,3)) #plots 2 by 3 window
for (i in c(2:7)){
  qqnorm(MicaTgt[,i],main=names(MicaTgt)[i])
}


#Comparison test
#anova test
aov.test<-lm(Reflectance~Replicate, Mica.Range) 
anova(aov.test)
summary(aov.test)
outp<-HSD.test(aov.test, "Replicate")

#Kruskal-Wallis test 
kruskal.test(Reflectance~Replicate, Mica.Range)



##############################################
###Plot mean reflectance curve for the 4 targets

Ref.T<-cbind(M9Tgt[,c("Wavelength", "Mean")],M23Tgt["Mean"],M44Tgt["Mean"], MicaTgt["Mean"])
names(Ref.T)<-c("Wavelength", "9%", "23%", "44%","Micasense")
head(Ref.T)

Ref.T<-melt(Ref.T, id="Wavelength", variable.name= "Target", value.name = "Reflectance")

ggplot(Ref.T, aes(x=Wavelength, y=Reflectance, colour=Target)) + 
  geom_line(size=0.8)+
  scale_colour_grey(name="")+
  scale_x_continuous(breaks= seq(325,1080,by=30), 
                     labels = insert_minor(seq(325, 1080, by=150),4), 
                     limits = c(325,1080), expand =c(0,0)) +
  scale_y_continuous(expand =c(0,-0.05), limits= c(-0.05, 1.05))+            #Set max 1
  xlab("Wavelength (nm)")+ ylab("Reflectance")+
  theme_bw()+                                                     #No grey background
  theme(panel.grid.major = element_blank(),     #No grid
      legend.key = element_blank(),
      panel.grid.minor = element_blank())

##################################################################################
#Analysis per band
Wave<-Ref$Wavelength
fConvol(Wl = Wave, Wl_start = Wave[1], Wl_end = Wave[length(Wave)], Ref = Wave,fun = "mean") #Mean and SD of spetral range

#Gaussian convolution

G.C.Mica<-fGaussianConvolMultiWl(Wl = R.Mica[,1], Ref = R.Mica[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                              convol = "Gaussian", weights = NULL)
G.C.Mica

G.C.9<-fGaussianConvolMultiWl(Wl = Ref[,1], Ref = Ref[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                 convol = "Gaussian", weights = NULL)
G.C.9

T.range<-cbind()

write.csv(G.C.Mica,"Mean_Ref.csv")

#Export as csv
write.csv(T.range,"Mean_Ref")




#Plot Gray target reflectance RGB,Re,NIR
plot(RefConvol~CWl.v, Gconv, xlab="")

ggplot(Gconv, aes(x=#gray scale, y=RefConvol, colour=Band)) + 
geom_point()+
scale_y_continuous(expand =c(0,0))+     #Set max 1
xlab("Wavelength (nm)")+ ylab("Reflectance")+
theme_bw()+                               #No grey background
theme(panel.grid.major = element_blank())+ # No grid
theme(legend.key = element_blank())


datetime<-"2017-02-23 14:13:59 CEST" #date of the measurement
DOY<-DateToDOY(datetime)  #numeric vector containing the coverted date in Day Of the Year (DOY).
