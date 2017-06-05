###Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")


##Load functions
source("./lib/load.file.R")
source("./lib/calc.rmseP.R")

###Load mean DN per sample
RefSam.path <- "./Validation/DN_reflec/" 
load.file(RefSam.path, ".csv")

names(tcario24)

###Calculate RMSE in %
##24/03
#TCARI/OSAVI
Rtcario24<-rmseP(tcario24$Def, tcario24$ASD)
names(Rtcario24)<-"Def"
Rtcario24$BC<-rmseP(tcario24$BC, tcario24$ASD)
Rtcario24$HM<-rmseP(tcario24$HM,tcario24$ASD)
Rtcario24$SEA<-rmseP(tcario24$SEA,tcario24$ASD)
Rtcario24$Ref0<-rmseP(tcario24$Ref0,tcario24$ASD)
Rtcario24$RefE<-rmseP(tcario24$RefE,tcario24$ASD)
Rtcario24$RefI<-rmseP(tcario24$RefI,tcario24$ASD)
Rtcario24$RefS<-rmseP(tcario24$RefS,tcario24$ASD)
Rtcario24$Atlas<-rmseP(tcario24$Atlas,tcario24$ASD)

Rtcario24<-data.frame(Rtcario24)
Rtcario24<-t(Rtcario24)


#GI
Rgi24<-rmseP(GI24$Def, GI24$ASD)
names(Rgi24)<-"Def"
Rgi24$BC<-rmseP(GI24$BC, GI24$ASD)
Rgi24$HM<-rmseP(GI24$HM, GI24$ASD)
Rgi24$SEA<-rmseP(GI24$SEA, GI24$ASD)
Rgi24$Ref0<-rmseP(GI24$Ref0,GI24$ASD)
Rgi24$RefE<-rmseP(GI24$RefE,GI24$ASD)
Rgi24$RefI<-rmseP(GI24$RefI,GI24$ASD)
Rgi24$RefS<-rmseP(GI24$RefS,GI24$ASD)
Rgi24$Atlas<-rmseP(GI24$Atlas,GI24$ASD)

Rgi24<-data.frame(Rgi24)
Rgi24<-t(Rgi24)


#NDVI
Rndvi24<-rmseP(NDVI24$Def, NDVI24$ASD)
names(Rndvi24)<-"Def"
Rndvi24$BC<-rmseP(NDVI24$BC, NDVI24$ASD)
Rndvi24$HM<-rmseP(NDVI24$HM, NDVI24$ASD)
Rndvi24$SEA<-rmseP(NDVI24$SEA, NDVI24$ASD)
Rndvi24$Ref0<-rmseP(NDVI24$Ref0,NDVI24$ASD)
Rndvi24$RefE<-rmseP(NDVI24$RefE,NDVI24$ASD)
Rndvi24$RefI<-rmseP(NDVI24$RefI,NDVI24$ASD)
Rndvi24$RefS<-rmseP(NDVI24$RefS,NDVI24$ASD)
Rndvi24$Atlas<-rmseP(NDVI24$Atlas, NDVI24$ASD)

Rndvi24<-data.frame(Rndvi24)
Rndvi24<-t(Rndvi24)


#NDRe
Rndre24<-rmseP(NDRE24$Def, NDRE24$ASD)
names(Rndre24)<-"Def"
Rndre24$BC<-rmseP(NDRE24$BC, NDRE24$ASD)
Rndre24$HM<-rmseP(NDRE24$HM, NDRE24$ASD)
Rndre24$SEA<-rmseP(NDRE24$SEA, NDRE24$ASD)
Rndre24$Ref0<-rmseP(NDRE24$Ref0,NDRE24$ASD)
Rndre24$RefE<-rmseP(NDRE24$RefE, NDRE24$ASD)
Rndre24$RefI<-rmseP(NDRE24$RefI,NDRE24$ASD)
Rndre24$RefS<-rmseP(NDRE24$RefS, NDRE24$ASD)
Rndre24$Atlas<-rmseP(NDRE24$Atlas, NDRE24$ASD)

Rndre24<-data.frame(Rndre24)
Rndre24<-t(Rndre24)


#EVI
Revi24<-rmseP(EVI24$Def, EVI24$ASD)
names(Revi24)<-"Def"
Revi24$BC<-rmseP(EVI24$BC, EVI24$ASD)
Revi24$HM<-rmseP(EVI24$HM, EVI24$ASD)
Revi24$SEA<-rmseP(EVI24$SEA, EVI24$ASD)
Revi24$Ref0<-rmseP(EVI24$Ref0,EVI24$ASD)
Revi24$RefE<-rmseP(EVI24$RefE,EVI24$ASD)
Revi24$RefI<-rmseP(EVI24$RefI,EVI24$ASD)
Revi24$RefS<-rmseP(EVI24$RefS,EVI24$ASD)
Revi24$Atlas<-rmseP(EVI24$Atlas, EVI24$ASD)

Revi24<-data.frame(Revi24)
Revi24<-t(Revi24)


##08/04
#TCARI/OSAVI
Rtcario8<-rmseP(tcario8$Def, tcario8$ASD)
names(Rtcario8)<-"Def"
Rtcario8$BC<-rmseP(tcario8$BC, tcario8$ASD)
Rtcario8$HM<-rmseP(tcario8$HM,tcario8$ASD)
Rtcario8$SEA<-rmseP(tcario8$SEA,tcario8$ASD)
Rtcario8$Ref0<-rmseP(tcario8$Ref0,tcario8$ASD)
Rtcario8$RefE<-rmseP(tcario8$RefE,tcario8$ASD)
Rtcario8$RefP<-rmseP(tcario8$RefP,tcario8$ASD)
Rtcario8$RefI<-rmseP(tcario8$RefI,tcario8$ASD)
Rtcario8$RefS<-rmseP(tcario8$RefS,tcario8$ASD)
Rtcario8$Atlas<-rmseP(tcario8$Atlas,tcario8$ASD)

Rtcario8<-data.frame(Rtcario8)
Rtcario8<-t(Rtcario8)


#GI
Rgi8<-rmseP(GI8$Def, GI8$ASD)
names(Rgi8)<-"Def"
Rgi8$BC<-rmseP(GI8$BC, GI8$ASD)
Rgi8$HM<-rmseP(GI8$HM, GI8$ASD)
Rgi8$SEA<-rmseP(GI8$SEA, GI8$ASD)
Rgi8$Ref0<-rmseP(GI8$Ref0,GI8$ASD)
Rgi8$RefE<-rmseP(GI8$RefE,GI8$ASD)
Rgi8$RefP<-rmseP(GI8$RefP,GI8$ASD)
Rgi8$RefI<-rmseP(GI8$RefI,GI8$ASD)
Rgi8$RefS<-rmseP(GI8$RefS,GI8$ASD)
Rgi8$Atlas<-rmseP(GI8$Atlas,GI8$ASD)

Rgi8<-data.frame(Rgi8)
Rgi8<-t(Rgi8)


#NDVI
Rndvi8<-rmseP(NDVI8$Def, NDVI8$ASD)
names(Rndvi8)<-"Def"
Rndvi8$BC<-rmseP(NDVI8$BC, NDVI8$ASD)
Rndvi8$HM<-rmseP(NDVI8$HM, NDVI8$ASD)
Rndvi8$SEA<-rmseP(NDVI8$SEA, NDVI8$ASD)
Rndvi8$Ref0<-rmseP(NDVI8$Ref0,NDVI8$ASD)
Rndvi8$RefE<-rmseP(NDVI8$RefE,NDVI8$ASD)
Rndvi8$RefP<-rmseP(NDVI8$RefP,NDVI8$ASD)
Rndvi8$RefI<-rmseP(NDVI8$RefI,NDVI8$ASD)
Rndvi8$RefS<-rmseP(NDVI8$RefS,NDVI8$ASD)
Rndvi8$Atlas<-rmseP(NDVI8$Atlas, NDVI8$ASD)

Rndvi8<-data.frame(Rndvi8)
Rndvi8<-t(Rndvi8)


#NDRe
Rndre8<-rmseP(NDRE8$Def, NDRE8$ASD)
names(Rndre8)<-"Def"
Rndre8$BC<-rmseP(NDRE8$BC, NDRE8$ASD)
Rndre8$HM<-rmseP(NDRE8$HM, NDRE8$ASD)
Rndre8$SEA<-rmseP(NDRE8$SEA, NDRE8$ASD)
Rndre8$Ref0<-rmseP(NDRE8$Ref0,NDRE8$ASD)
Rndre8$RefE<-rmseP(NDRE8$RefE,NDRE8$ASD)
Rndre8$RefP<-rmseP(NDRE8$RefP,NDRE8$ASD)
Rndre8$RefI<-rmseP(NDRE8$RefI,NDRE8$ASD)
Rndre8$RefS<-rmseP(NDRE8$RefS,NDRE8$ASD)
Rndre8$Atlas<-rmseP(NDRE8$Atlas, NDRE8$ASD)

Rndre8<-data.frame(Rndre8)
Rndre8<-t(Rndre8)


#EVI
Revi8<-rmseP(EVI8$Def, EVI8$ASD)
names(Revi8)<-"Def"
Revi8$BC<-rmseP(EVI8$BC, EVI8$ASD)
Revi8$HM<-rmseP(EVI8$HM, EVI8$ASD)
Revi8$SEA<-rmseP(EVI8$SEA, EVI8$ASD)
Revi8$Ref0<-rmseP(EVI8$Ref0,EVI8$ASD)
Revi8$RefE<-rmseP(EVI8$RefE,EVI8$ASD)
Revi8$RefP<-rmseP(EVI8$RefP,EVI8$ASD)
Revi8$RefI<-rmseP(EVI8$RefI,EVI8$ASD)
Revi8$RefS<-rmseP(EVI8$RefS,EVI8$ASD)
Revi8$Atlas<-rmseP(EVI8$Atlas, EVI8$ASD)

Revi8<-data.frame(Revi8)
Revi8<-t(Revi8)



###Plot the results
par(mfrow=c(1,2),
    oma = c(0,0,0,0),
    mar = c(5,5,2,0),
    mgp = c(3.5, 0.5, 0))
barplot(Rgi8, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,100), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "P+ELC", "IC+ELC", "C+SEA" , "Atlas"),
        las=2,cex.names=.8) 
barplot(Rgi24, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,100), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 

barplot(Rndvi8, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,200), 
        main="Overcast", names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "P+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 
barplot(Rndvi24, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,200), 
        main="Clear sky", names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 

barplot(Rndre8, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,300), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "P+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 
barplot(Rndre24, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,300), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 

barplot(Revi8, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,300), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "P+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 
barplot(Revi24, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,300), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "IC+ELC", "C+SEA" , "Atlas"), las=2,cex.names=.8) 

dev.off()
par(mfrow=c(1,2),
    oma = c(0,0,0,0),
    mar = c(5,5,2,0),
    mgp = c(3.5, 0.5, 0))
barplot(Rtcario8, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,600),
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "P+ELC", "IC+ELC", "C+SEA" , "Atlas"), las=2, cex.names=.8) 
barplot(Rtcario24, beside=T, font.main=5, xlab="Calibration Method" , ylab="RMSE (%)", font.lab=2, ylim=c(0,600), 
        names= c("none", "BC", "HM", "SEA", "ELC","EC+ELC", "IC+ELC", "C+SEA" , "Atlas"),las=2,cex.names=.8) 


############################################################

##Linear regression
#24/03
tcario.Def24<-lm(Def~ASD, tcario24)
summary(tcario.Def24)
tcario.BC24<-lm(BC~ASD, tcario24)
tcario.HM24<-lm(HM~ASD, tcario24)
tcario.SEA24<-lm(SEA~ASD, tcario24)
tcario.Ref24<-lm(Ref~ASD, tcario24)
tcario.Atlas24<-lm(Atlas~ASD, tcario24)

gi.Def24<-lm(Def~ASD, GI24)
gi.BC24<-lm(BC~ASD, GI24)
gi.HM24<-lm(HM~ASD, GI24)
gi.SEA24<-lm(SEA~ASD, GI24)
gi.Ref24<-lm(Ref~ASD, GI24)
gi.Atlas24<-lm(Atlas~ASD, GI24)

ndvi.Def24 <-lm(Def~ASD, NDVI24)
ndvi.BC24 <-lm(BC~ASD, NDVI24)
ndvi.HM24 <-lm(HM~ASD, NDVI24)
ndvi.SEA24 <-lm(SEA~ASD, NDVI24)
ndvi.Ref24 <-lm(Ref~ASD, NDVI24)
ndvi.Atlas24 <-lm(Atlas~ASD, NDVI24)

ndre.Def24 <-lm(Def~ASD, NDRE24)
ndre.BC24 <-lm(BC~ASD, NDRE24)
ndre.HM24 <-lm(HM~ASD, NDRE24)
ndre.SEA24 <-lm(SEA~ASD, NDRE24)
ndre.Ref24 <-lm(Ref~ASD, NDRE24)
ndre.Atlas24 <-lm(Atlas~ASD, NDRE24)

evi.Def24 <-lm(Def~ASD, EVI24)
evi.BC24 <-lm(BC~ASD, EVI24)
evi.HM24 <-lm(HM~ASD, EVI24)
evi.SEA24 <-lm(SEA~ASD, EVI24)
evi.Ref24 <-lm(Ref~ASD, EVI24)
evi.Atlas24 <-lm(Atlas~ASD, EVI24)


summary(tcario.Def24)

##08/04
tcario.Def8<-lm(Def~ASD, tcario8)
summary(tcario.Def8)
tcario.BC8<-lm(BC~ASD, tcario8)
tcario.HM8<-lm(HM~ASD, tcario8)
tcario.SEA8<-lm(SEA~ASD, tcario8)
tcario.Ref8<-lm(Ref~ASD, tcario8)
tcario.Atlas8<-lm(Atlas~ASD, tcario8)

gi.Def8<-lm(Def~ASD, GI8)
gi.BC8<-lm(BC~ASD, GI8)
gi.HM8<-lm(HM~ASD, GI8)
gi.SEA8<-lm(SEA~ASD, GI8)
gi.Ref8<-lm(Ref~ASD, GI8)
gi.Atlas8<-lm(Atlas~ASD, GI8)

ndvi.Def8 <-lm(Def~ASD, NDVI8)
ndvi.BC8 <-lm(BC~ASD, NDVI8)
ndvi.HM8 <-lm(HM~ASD, NDVI8)
ndvi.SEA8 <-lm(SEA~ASD, NDVI8)
ndvi.Ref8 <-lm(Ref~ASD, NDVI8)
ndvi.Atlas8 <-lm(Atlas~ASD, NDVI8)

ndre.Def8 <-lm(Def~ASD, NDRE8)
ndre.BC8 <-lm(BC~ASD, NDRE8)
ndre.HM8 <-lm(HM~ASD, NDRE8)
ndre.SEA8 <-lm(SEA~ASD, NDRE8)
ndre.Ref8 <-lm(Ref~ASD, NDRE8)
ndre.Atlas8 <-lm(Atlas~ASD, NDRE8)

evi.Def8 <-lm(Def~ASD, EVI8)
evi.BC8 <-lm(BC~ASD, EVI8)
evi.HM8 <-lm(HM~ASD, EVI8)
evi.SEA8 <-lm(SEA~ASD, EVI8)
evi.Ref8 <-lm(Ref~ASD, EVI8)
evi.Atlas8 <-lm(Atlas~ASD, EVI8)


###########################################################
