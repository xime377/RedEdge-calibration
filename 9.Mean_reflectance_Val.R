###Set WD
setwd("H:/Ximena/MSc Thesis/Results")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
library(reshape2)
library(ggplot2)
library(cowplot)


if(!require(devtools)) install.packages("devtools") #Denpendencies of F.. DP
if(!require(FieldSpectroscopyCC)) install_github("tommasojulitta/FieldSpectroscopyCC") 
library(FieldSpectroscopyCC)
if(!require(FieldSpectroscopyDP)) install_github("tommasojulitta/FieldSpectroscopyDP") 
library(FieldSpectroscopyDP)
library(splines)
if(!require(SDMTools)) install.packages("SDMTools")
library(SDMTools)


##Load functions
source("./lib/load.file.R")
source("./lib/plot.replicates.R")
source("./lib/Ref.melt.R")
devtools::load_all("VegIndx")

##Load files
dir(,"csv")
#24/03
R24<-read.csv("./Validation/R24.csv", header=T)
str(R24)
head(R24)
names(R24)

#08/04
R08<-read.csv("./Validation/R08.csv", header=T)
head(R08)
names(R08)


#Import characteristics of the camera
MicaR<-read.csv("Micasense.csv", header=T)
str(MicaR)
head(MicaR)


##Separate per sample
#24/03
S1.24<-R24[,c(1:6)]
S2.24<-R24[,c(1,7:11)]
C1.24<-R24[,c(1,12:16)]
C2.24<-R24[,c(1,17:21)]
C3.24<-R24[,c(1,22:27)]
C4.24<-R24[,c(1,28:35)]
C5.24<-R24[,c(1,36:43)]
C6.24<-R24[,c(1,44:49)]

#08/04
G1.8<-R08[,c(1:8)]
G2.8<-R08[,c(1,9:12)]
G3.8<-R08[,c(1,13:16)]
B1.8<-R08[,c(1,17:22)]
S1.8<-R08[,c(1,23:27)]
S2.8<-R08[,c(1,28:33)]


#Group them
Al.24<-ls(pattern = ".24")
A.24<-lapply(Al.24,get)
names(A.24)<-Al.24
  
Al.8<-ls(pattern = ".8")
A.8<-lapply(Al.8,get)
names(A.8)<-Al.8


###Put all the values in one column

for (i in 1:length(A.24))   #For all the df on the list
{
  A.24[[i]] <- Ref.melt(A.24[[i]])   #melt data
  assign(paste0("M.",names(A.24[i])), as.data.frame(A.24[[i]]))  #output as df
}

for (i in 1:length(A.8))   #For all the df on the list
{
  A.8[[i]] <- Ref.melt(A.8[[i]])   #melt data
  assign(paste0("M.",names(A.8[i])), as.data.frame(A.8[[i]]))  #output as df
}



##Plot reflectance curve per target
#24/03
p1<-plot.replicates(M.S1.24)
p2<-plot.replicates(M.S2.24)
p3<-plot.replicates(M.C1.24)
p4<-plot.replicates(M.C2.24)
p5<-plot.replicates(M.C3.24)
p6<-plot.replicates(M.C4.24)
p7<-plot.replicates(M.C5.24)
p8<-plot.replicates(M.C6.24)

plot_grid(p1,p2,p3,p4,p5,p6,p7,p8, #all plots together
          labels = c("Soil1","Soil2", "Crop1","Crop2",
                     "Crop3","Crop4", "Crop5", "Crop6"), label_size = 14, hjust = -4.5,
          vjust = 2.5)

#08/04
p9<-plot.replicates(M.G1.8)
p10<-plot.replicates(M.G2.8)
p11<-plot.replicates(M.G3.8)
p12<-plot.replicates(M.B1.8)
p13<-plot.replicates(M.S1.8)
p14<-plot.replicates(M.S2.8)

plot_grid(p9,p10,p11,p12,p13,p14, #all plots together
          labels = c("Grass1","Grass2", "Grass3","BeetR1",
                     "Soil1","Soil2"), label_size = 14, hjust = -4.5,
          vjust = 2.5)


##Gaussian convolution
#24/03
G.S1.24<-fGaussianConvolMultiWl(Wl = M.S1.24[,1], Ref = M.S1.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                             convol = "Gaussian", weights = NULL)
G.S2.24<-fGaussianConvolMultiWl(Wl = M.S2.24[,1], Ref = M.S2.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)
G.C1.24<-fGaussianConvolMultiWl(Wl = M.C1.24[,1], Ref = M.C1.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)
G.C2.24<-fGaussianConvolMultiWl(Wl = M.C2.24[,1], Ref = M.C2.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)
G.C3.24<-fGaussianConvolMultiWl(Wl = M.C3.24[,1], Ref = M.C3.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)
G.C4.24<-fGaussianConvolMultiWl(Wl = M.C4.24[,1], Ref = M.C4.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)
G.C5.24<-fGaussianConvolMultiWl(Wl = M.C5.24[,1], Ref = M.C5.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)
G.C6.24<-fGaussianConvolMultiWl(Wl = M.C6.24[,1], Ref = M.C6.24[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                               convol = "Gaussian", weights = NULL)

#08/04
G.G1.8<-fGaussianConvolMultiWl(Wl = M.G1.8[,1], Ref = M.G1.8[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                convol = "Gaussian", weights = NULL)
G.G2.8<-fGaussianConvolMultiWl(Wl = M.G2.8[,1], Ref = M.G2.8[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                convol = "Gaussian", weights = NULL)
G.G3.8<-fGaussianConvolMultiWl(Wl = M.G3.8[,1], Ref = M.G3.8[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                convol = "Gaussian", weights = NULL)
G.B1.8<-fGaussianConvolMultiWl(Wl = M.B1.8[,1], Ref = M.B1.8[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                convol = "Gaussian", weights = NULL)
G.S1.8<-fGaussianConvolMultiWl(Wl = M.S1.8[,1], Ref = M.S1.8[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                convol = "Gaussian", weights = NULL)
G.S2.8<-fGaussianConvolMultiWl(Wl = M.S2.8[,1], Ref = M.S2.8[,3], CWl.v = MicaR[,3], FWHM.v = MicaR[,4], 
                                convol = "Gaussian", weights = NULL)


###Calculate VI of the samples
##24/03
#TCARI/OSAVI
TCARIO24<-TCARI.OSAVI(G.S1.24[,2])
names(TCARIO24)<-"s1"
head(TCARIO24)

TCARIO24$s2<-TCARI.OSAVI(G.S2.24[,2])
TCARIO24$c1<-TCARI.OSAVI(G.C1.24[,2]) 
TCARIO24$c2<-TCARI.OSAVI(G.C2.24[,2]) 
TCARIO24$c3<-TCARI.OSAVI(G.C3.24[,2]) 
TCARIO24$c4<-TCARI.OSAVI(G.C4.24[,2]) 
TCARIO24$c5<-TCARI.OSAVI(G.C5.24[,2])
TCARIO24$c6<-TCARI.OSAVI(G.C6.24[,2])

TCARIO24<-data.frame(TCARIO24)
TCARIO24<-t(TCARIO24)

#GI
gi24<-GI(G.S1.24[,2])
names(gi24)<-"s1"
head(gi24)

gi24$s2<-GI(G.S2.24[,2])
gi24$c1<-GI(G.C1.24[,2]) 
gi24$c2<-GI(G.C2.24[,2]) 
gi24$c3<-GI(G.C3.24[,2]) 
gi24$c4<-GI(G.C4.24[,2]) 
gi24$c5<-GI(G.C5.24[,2])
gi24$c6<-GI(G.C6.24[,2])

gi24<-data.frame(gi24)
gi24<-t(gi24)

#NDVI
ndvi24<-NDVI(G.S1.24[,2])
names(ndvi24)<-"s1"
head(ndvi24)

ndvi24$s2<-NDVI(G.S2.24[,2])
ndvi24$c1<-NDVI(G.C1.24[,2]) 
ndvi24$c2<-NDVI(G.C2.24[,2]) 
ndvi24$c3<-NDVI(G.C3.24[,2]) 
ndvi24$c4<-NDVI(G.C4.24[,2]) 
ndvi24$c5<-NDVI(G.C5.24[,2])
ndvi24$c6<-NDVI(G.C6.24[,2])

ndvi24<-data.frame(ndvi24)
ndvi24<-t(ndvi24)

#NDRe 
ndre24<-NDRe(G.S1.24[,2])
names(ndre24)<-"s1"
head(ndre24)

ndre24$s2<-NDRe(G.S2.24[,2])
ndre24$c1<-NDRe(G.C1.24[,2]) 
ndre24$c2<-NDRe(G.C2.24[,2]) 
ndre24$c3<-NDRe(G.C3.24[,2]) 
ndre24$c4<-NDRe(G.C4.24[,2]) 
ndre24$c5<-NDRe(G.C5.24[,2])
ndre24$c6<-NDRe(G.C6.24[,2])

ndre24<-data.frame(ndre24)
ndre24<-t(ndre24)

#Evi
evi24<-EVI(G.S1.24[,2])
names(evi24)<-"s1"
head(evi24)

evi24$s2<-EVI(G.S2.24[,2])
evi24$c1<-EVI(G.C1.24[,2]) 
evi24$c2<-EVI(G.C2.24[,2]) 
evi24$c3<-EVI(G.C3.24[,2]) 
evi24$c4<-EVI(G.C4.24[,2]) 
evi24$c5<-EVI(G.C5.24[,2])
evi24$c6<-EVI(G.C6.24[,2])

evi24<-data.frame(evi24)
evi24<-t(evi24)

##08/04
#TCARI/OSAVI
TCARIO8<-TCARI.OSAVI(G.G1.8[,2])
names(TCARIO8)<-"g1"
head(TCARIO8)

TCARIO8$g2<-TCARI.OSAVI(G.G2.8[,2])
TCARIO8$g3<-TCARI.OSAVI(G.G3.8[,2]) 
TCARIO8$b1<-TCARI.OSAVI(G.B1.8[,2]) 
TCARIO8$s1<-TCARI.OSAVI(G.S1.8[,2]) 
TCARIO8$s2<-TCARI.OSAVI(G.S2.8[,2]) 

TCARIO8<-data.frame(TCARIO8)
TCARIO8<-t(TCARIO8)

#GI
gi8<-GI(G.G1.8[,2])
names(gi8)<-"g1"
head(gi8)

gi8$g2<-GI(G.G2.8[,2])
gi8$g3<-GI(G.G3.8[,2]) 
gi8$b1<-GI(G.B1.8[,2]) 
gi8$s1<-GI(G.S1.8[,2]) 
gi8$s2<-GI(G.S2.8[,2]) 

gi8<-data.frame(gi8)
gi8<-t(gi8)

#NDVI
ndvi8<-NDVI(G.G1.8[,2])
names(ndvi8)<-"g1"
head(ndvi8)

ndvi8$g2<-NDVI(G.G2.8[,2])
ndvi8$g3<-NDVI(G.G3.8[,2]) 
ndvi8$b1<-NDVI(G.B1.8[,2]) 
ndvi8$s1<-NDVI(G.S1.8[,2]) 
ndvi8$s2<-NDVI(G.S2.8[,2]) 

ndvi8<-data.frame(ndvi8)
ndvi8<-t(ndvi8)

#NDRe 
ndre8<-NDRe(G.G1.8[,2])
names(ndre8)<-"g1"
head(ndre8)

ndre8$g2<-NDRe(G.G2.8[,2])
ndre8$g3<-NDRe(G.G3.8[,2]) 
ndre8$b1<-NDRe(G.B1.8[,2]) 
ndre8$s1<-NDRe(G.S1.8[,2]) 
ndre8$s2<-NDRe(G.S2.8[,2]) 

ndre8<-data.frame(ndre8)
ndre8<-t(ndre8)

#Evi
evi8<-EVI(G.G1.8[,2])
names(evi8)<-"g1"
head(evi8)

evi8$g2<-EVI(G.G2.8[,2])
evi8$g3<-EVI(G.G3.8[,2]) 
evi8$b1<-EVI(G.B1.8[,2]) 
evi8$s1<-EVI(G.S1.8[,2]) 
evi8$s2<-EVI(G.S2.8[,2]) 

evi8<-data.frame(evi8)
evi8<-t(evi8)


###Load mean DN per sample
RefSam.path <- "./Validation/DN_mean/" 
load.file(RefSam.path, ".csv")

tcario24$ASD<-TCARIO24
GI24$ASD<-gi24
NDVI24$ASD<-ndvi24
NDRE24$ASD<-ndre24
EVI24$ASD<-evi24

tcario8$ASD<-TCARIO8
GI8$ASD<-gi8
NDVI8$ASD<-ndvi8
NDRE8$ASD<-ndre8
EVI8$ASD<-evi8


#Export them
write.csv(tcario24, "./Validation/DN_reflec/tcario24.csv")
write.csv(GI24, "./Validation/DN_reflec/GI24.csv")
write.csv(NDVI24, "./Validation/DN_reflec/NDVI24.csv")
write.csv(NDRE24, "./Validation/DN_reflec/NDRE24.csv")
write.csv(EVI24, "./Validation/DN_reflec/EVI24.csv")

write.csv(tcario8, "./Validation/DN_reflec/tcario8.csv")
write.csv(GI8, "./Validation/DN_reflec/GI8.csv")
write.csv(NDVI8, "./Validation/DN_reflec/NDVI8.csv")
write.csv(NDRE8, "./Validation/DN_reflec/NDRE8.csv")
write.csv(EVI8, "./Validation/DN_reflec/EVI8.csv")

#########################################################