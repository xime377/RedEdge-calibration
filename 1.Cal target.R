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
  assign(paste0("M.",names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
  }


#Plot reflectance curve per target
p9<-plot.replicates(M.M9Tgt)
p23<-plot.replicates(M.M23Tgt)
p44<-plot.replicates(M.M44Tgt)
p50<-plot.replicates(M.Mica50Tgt)
p80<-plot.replicates(M.Mica80Tgt)

plot_grid(p9,p23,p44,p50,p80, align="h")


#Compute statistics from the Total ASD range
Targets.m<-ls(pattern="M.M")
Targets.T<-lapply(Targets.m,get)
names(Targets.T)<-Targets.m

for (i in 1:length(Targets))   #For all the df on the list
{
  Targets.T[[i]] <- summarySE(Targets.T[[i]], measurevar="Reflectance", groupvars=c("Wavelength"))
  assign(paste0("W.",names(Targets.T[i])),Targets.T[[i]])
}

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

plot_grid(r9,r23,r44,r50,r80, align="h")


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

#CV (sd/mean)
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



###Tests to see near Lambertian properties

#Normality test -> Shapiro test (w<0.99 and pvalue<0.05 shows non-normal distribution https://stats.stackexchange.com/questions/15696/interpretation-of-shapiro-wilk-test)
n9.test<-aggregate(Reflectance~Replicate,data=M.M9Tgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test
n23.test<-aggregate(Reflectance~Replicate,data=M.M23Tgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test
n44.test<-aggregate(Reflectance~Replicate,data=M.M44Tgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test
n50.test<-aggregate(Reflectance~Replicate,data=M.Mica50Tgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test
n80.test<-aggregate(Reflectance~Replicate,data=M.Mica80Tgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test

##Plot multiple qqplots together (https://stats.stackexchange.com/questions/101274/how-to-interpret-a-qq-plot)
par(mfrow=c(2,3)) #plots 2 by 3 window
for (i in c(2:24)){
  qqnorm(Mica50Tgt[,i],main=names(Mica50Tgt)[i])
}


#Comparison test
#anova test
aov.t9<-lm(Reflectance~Replicate, R.M9Tgt) 
anova(aov.t9)
summary(aov.t9)
outp<-HSD.test(aov.t9, "Replicate")


#Kruskal-Wallis test (less than 0.05, different)
kruskal.test(Reflectance~Replicate, R.M9Tgt)
kruskal.test(Reflectance~Replicate, R.M23Tgt)
kruskal.test(Reflectance~Replicate, R.M44Tgt)
kruskal.test(Reflectance~Replicate, R.Mica50Tgt)
kruskal.test(Reflectance~Replicate, R.Mica80Tgt)


##############################################
###Plot mean reflectance curve for the 4 targets

Ref.T<-cbind(W.M.M9Tgt[,c("Wavelength", "Reflectance")],W.M.M23Tgt["Reflectance"],W.M.M44Tgt["Reflectance"], W.M.Mica50Tgt["Reflectance"], W.M.Mica80Tgt["Reflectance"])
names(Ref.T)<-c("Wavelength", "10%", "23%", "44%","50%", "80%")
head(Ref.T)

Ref.T<-melt(Ref.T, id="Wavelength", variable.name= "Target", value.name = "Reflectance")

plot.grayS(Ref.T)


###Plot mean reflectance curve for the 4 targets (Micasense Range)

Ref.M<-cbind(W.R.M9Tgt[,c("Wavelength", "Reflectance")],W.R.M23Tgt["Reflectance"],W.R.M44Tgt["Reflectance"], W.R.Mica50Tgt["Reflectance"], W.R.Mica80Tgt["Reflectance"])
names(Ref.M)<-c("Wavelength", "10%", "23%", "44%","50%", "80%")
head(Ref.M)

Ref.M<-melt(Ref.M, id="Wavelength", variable.name= "Target", value.name = "Reflectance")

plot.graySM(Ref.M)



##################################################################################
##Analysis per band

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


