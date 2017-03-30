#Set WD
#setwd("C:/Users/UAVstudent/Google Drive/MSc Thesis/Results")
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

#The loop places everything in one object 
 for (i in 1:length(Targets.l))
{
  Targets[[i]] <- Ref.melt(Targets[[i]])
  assign(paste0("R.", names(Targets[[i]])), envir = .GlobalEnv)
  }


lapply((Targets.l), function(x) assign("Targets", Targets, envir = globalenv()))


#Separate df
R.Mica5 <- Ref.melt(Mica50Tgt)
R.Mica8 <- Ref.melt(Mica80Tgt)
R.M23<-Ref.melt(M23Tgt)
R.M44<-Ref.melt(M44Tgt)
R.M9<-Ref.melt(M9Tgt)

#Plot reflectance curve per target
p9<-plot.replicates(R.M9)
p23<-plot.replicates(R.M23)
p44<-plot.replicates(R.M44)
p5<-plot.replicates(R.Mica5)
p8<-plot.replicates(R.Mica8)

plot_grid(p9,p23,p44,p5,p8, align="h")


#Calculate the mean of the replicates per target

# Mica50Tgt$Mean<-rowMeans(Mica50Tgt[,c(2:length(Mica50Tgt))])
# Mica80Tgt$Mean<-rowMeans(Mica80Tgt[,c(2:length(Mica80Tgt))])
# M9Tgt$Mean<-rowMeans(M9Tgt[,c(2:length(M9Tgt))])
# M23Tgt$Mean<-rowMeans(M23Tgt[,c(2:length(M23Tgt))])
# M44Tgt$Mean<-rowMeans(M44Tgt[,c(2:length(M44Tgt))])


#Extract Reflectance values from 465 - 860 nm (Micasense 2015)

Mica.Range<-R.Mica[(R.Mica$Wavelength>=465) & (R.Mica$Wavelength<=860),]
# & (Ref$Wavelength>=550) & (Ref$Wavelength<=570) &
#             (Ref$Wavelength>=663) & (Ref$Wavelength<=673) (Ref$Wavelength>=820) & (Ref$Wavelength<=860)
#           (Ref$Wavelength>=712) & (Ref$Wavelength<=722),]
# 
#  Select.range <- function(Wl = Wl, Ref = Ref, Rep = Rep, CW = CW, FWHM = FWHM) {
#   RangeM <- array(NA, length(Rep))
#    #RangeSD <- array(NA, length(Rep))
#    for (i in c(1:length(Rep))) {
#      if ((CW[i] > (min(Wl, na.rm = T) + 2 * FWHM[i])) & 
#         (CW[i] < (max(Wl, na.rm = T) - 2 * FWHM[i]))) {
#        RangeM[i] <- fGaussianConvol(Wl = Wl, Ref = Ref, 
#                                        CW = CW[i], FWHM = FWHM[i])
#        RangeSD[i] <- fGaussianConvolSD(Wl = Wl, Ref = Ref, 
#                                      CW = CW[i], FWHM = FWHM[i])
#      }
#    }
#    return(data.frame(Rep = Replicate, RangeM = Mean, RangeSD = SD))
#    }
# 
# Range <- Select.range(Wl = Ref[,1], Ref = Ref[,3], Rep= Ref [,2], CW = Mica[,3], FWHM = Mica[,4])
summary(Mica.Range)


Replicates.M<- summarySE(Mica.Range, measurevar="Reflectance", groupvars=c("Replicate")) #Computes stadistics
cat("Statistics per replicate\n")
Replicates.M


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

for(i in Targets){
  
  for (i in 1:length(Ref))
{
  Ref[[i]] <- list(Ref.melt(Ref[[i]]))
  assign(paste0("Ref.", names(Ref[[i]])), ref.m[[i]])
}


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
