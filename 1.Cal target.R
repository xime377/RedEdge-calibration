###Calculates statistics of the reflectance targets. It needs the spectral measurements of them##

#Set WD
setwd("H:/Ximena/MSc Thesis/Results")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
if(!require(devtools)) install.packages("devtools") #Dependencies of F..DP
if(!require(FieldSpectroscopyCC)) install_github("tommasojulitta/FieldSpectroscopyCC") 
library(FieldSpectroscopyCC)
if(!require(FieldSpectroscopyDP)) install_github("tommasojulitta/FieldSpectroscopyDP") 
library(FieldSpectroscopyDP)
library(splines)
if(!require(SDMTools)) install.packages("SDMTools")
library(SDMTools)

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
  assign(paste0("M.",names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
}


#Plot reflectance curve per target
p9<-plot.replicates(M.M9Tgt)
p23<-plot.replicates(M.M23Tgt)
p44<-plot.replicates(M.M44Tgt)
p50<-plot.replicates(M.Mica50Tgt)
p80<-plot.replicates(M.Mica80Tgt)

plot_grid(p9,p23,p44,p50,p80, align="h", #all plots together
          labels = c("10%","23%", "44%","55%", "66%"), label_size = 14, hjust = -8.5,
          vjust = 2.5)

#Compute statistics from the Total ASD range
Targets.m<-ls(pattern="M.M")
Targets.T<-lapply(Targets.m,get)
names(Targets.T)<-Targets.m

#Per Wavelength
for (i in 1:length(Targets))   #For all the df on the list
{
  Targets.T[[i]] <- summarySE(Targets.T[[i]], measurevar="Reflectance", groupvars=c("Wavelength"))
  assign(paste0("W.",names(Targets.T[i])),Targets.T[[i]])
}


#Per replicate
Targets.T<-lapply(Targets.m,get)
names(Targets.T)<-Targets.m

for (i in 1:length(Targets.T))   #For all the df on the list
{
  Targets.T[[i]] <- summarySE(Targets.T[[i]], measurevar="Reflectance", groupvars=c("Replicate"))
  assign(paste0("S.",names(Targets.T[i])),as.data.frame(Targets.T[[i]]))
}


cat("Statistics per replicate (ASD range)\n")
summary(Targets.T$M.M9Tgt)
summary(Targets.T$M.M23Tgt)
summary(Targets.T$M.M44Tgt)
summary(Targets.T$M.Mica50Tgt)
summary(Targets.T$M.Mica80Tgt)



###
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


#Plot reflectance curve per target (Micasense range)
r9<-plot.repR(R.M9Tgt)
r23<-plot.repR(R.M23Tgt)
r44<-plot.repR(R.M44Tgt)
r50<-plot.repR(R.Mica50Tgt)
r80<-plot.repR(R.Mica80Tgt)

plot_grid(r9,r23,r44,r50,r80, align="h",
          labels = c("10%","23%", "44%","50%", "80%"), label_size = 14, hjust = -8.5,
          vjust = 2.5)


plot_grid(r9,r23,r44,r50,r80, align="h",
          labels = c("10%","23%", "44%","50%", "80%"), label_size = 14, hjust = 0,
          vjust = 1)

#Compute statistics Micasense range
Targets.p<-ls(pattern="R.M")
Targets.r<-lapply(Targets.p,get)
names(Targets.r)<-Targets.p

#Range
#Wavelength
for (i in 1:length(Targets.r))   #For all the df on the list
{
  Targets.r[[i]] <- summarySE(Targets.r[[i]], measurevar="Reflectance", groupvars=c("Wavelength"))
  assign(paste0("W.",names(Targets.r[i])),Targets.r[[i]])
}

#Coefficient of variation (sd*100/mean)
for (i in 1:length(Targets.r))   #For all the df on the list
{
  Targets.r[[i]]$cv <- (Targets.r[[i]]$sd/Targets.r[[i]]$Reflectance)*100
}
summary(Targets.r$R.M23Tgt)


#Replicate
Targets.r<-lapply(Targets.p,get)
names(Targets.r)<-Targets.p

for (i in 1:length(Targets.r))   #For all the df on the list
{
  Targets.r[[i]] <- summarySE(Targets.r[[i]], measurevar="Reflectance", groupvars=c("Replicate"))
  assign(paste0("S.",names(Targets.r[i])),Targets.r[[i]])
}

cat("Statistics per replicate (Micasense range)\n")
summary(Targets.r$R.M9Tgt)
summary(Targets.r$R.M23Tgt)
summary(Targets.r$R.M44Tgt)
summary(Targets.r$R.Mica50Tgt)
summary(Targets.r$R.Mica80Tgt)


##############################################
###Plot mean reflectance curve for the 5 targets

Ref.T<-cbind(W.M.M9Tgt[,c("Wavelength", "Reflectance")],W.M.M23Tgt["Reflectance"],W.M.M44Tgt["Reflectance"], W.M.Mica50Tgt["Reflectance"], W.M.Mica80Tgt["Reflectance"])
names(Ref.T)<-c("Wavelength", "10%", "23%", "44%","50%", "80%")
head(Ref.T)

Ref.T<-melt(Ref.T, id="Wavelength", variable.name= "Target", value.name = "Reflectance")

plot.grayS(Ref.T)


###Plot mean reflectance curve for the 5 targets (Micasense Range)

Ref.M<-cbind(W.R.M9Tgt[,c("Wavelength", "Reflectance")],W.R.M23Tgt["Reflectance"],W.R.M44Tgt["Reflectance"], W.R.Mica50Tgt["Reflectance"], W.R.Mica80Tgt["Reflectance"])
names(Ref.M)<-c("Wavelength", "10%", "23%", "44%","50%", "80%")
head(Ref.M)

Ref.M<-melt(Ref.M, id="Wavelength", variable.name= "Target", value.name = "Reflectance")

plot.graySM(Ref.M)


##################################################################################
##Analysis per band

#Gaussian convolution

GC.9<-fGaussianConvolMultiWl(Wl = M.M9Tgt[,1], Ref = M.M9Tgt[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                             convol = "Gaussian", weights = NULL)

GC.23<-fGaussianConvolMultiWl(Wl = M.M23Tgt[,1], Ref = M.M23Tgt[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                              convol = "Gaussian", weights = NULL)

GC.44<-fGaussianConvolMultiWl(Wl = M.M44Tgt[,1], Ref = M.M44Tgt[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                              convol = "Gaussian", weights = NULL)

GC.50<-fGaussianConvolMultiWl(Wl = M.Mica50Tgt[,1], Ref = M.Mica50Tgt[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                              convol = "Gaussian")

GC.80<-fGaussianConvolMultiWl(Wl = M.Mica80Tgt[,1], Ref = M.Mica80Tgt[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                              convol = "Gaussian")


Tar.Conv<-cbind(GC.9[,c(1:2)],GC.23[,2],GC.44[,2],GC.50[,2],GC.80[,2],
                GC.9[,3],GC.23[,3],GC.44[,3],GC.50[,3],GC.80[,3])
names(Tar.Conv)<-c("CWavelength","9","23","44","50","80","9.SD","23.SD", "44.SD","50.SD","80.SD")

#Export as csv
write.csv(Tar.Conv,"./Calibration/Mean_RefT.csv")


#######################################
#Plot Gray target reflectance RGB,Re,NIR
par(mfrow=c(1,1)) #plots 1
plot(RefConvol~CWl.v, GC.23, xlab="Wavelength (nm)") #test


################################################
###Tests to see near Lambertian properties

#Comparison test
#anova test->parametric
aov.t9<-lm(Reflectance~Replicate, R.M9Tgt) 
anova(aov.t9)
summary(aov.t9)
outp9<-HSD.test(aov.t9, "Replicate")

aov.t23<-lm(Reflectance~Replicate, R.M23Tgt) 
anova(aov.t23)
summary(aov.t23)
outp23<-HSD.test(aov.t23, "Replicate")

aov.t44<-lm(Reflectance~Replicate, R.M44Tgt) 
anova(aov.t44)
summary(aov.t44)
outp44<-HSD.test(aov.t44, "Replicate")

aov.50<-lm(Reflectance~Replicate, R.Mica50Tgt) 
anova(aov.50)
summary(aov.50)
outp50<-HSD.test(aov.50, "Replicate")

aov.80<-lm(Reflectance~Replicate, R.Mica80Tgt) 
anova(aov.80)
summary(aov.80)
outp80<-HSD.test(aov.80, "Replicate")

#Kruskal-Wallis test (less than 0.05, different)-> non-parametric
kruskal.test(Reflectance~Replicate, R.M9Tgt)
kruskal.test(Reflectance~Replicate, R.M23Tgt)
kruskal.test(Reflectance~Replicate, R.M44Tgt)
kruskal.test(Reflectance~Replicate, R.Mica50Tgt)
kruskal.test(Reflectance~Replicate, R.Mica80Tgt)


############################################################################
