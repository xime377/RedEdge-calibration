#Set WD
setwd("H:/Ximena/MSc Thesis/Results/")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(raster)
library(maps)  
library(GISTools)


#Load functions
devtools::load_all("VegIndx")


##Load orthomosaics
beginCluster()

Def<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_withoutCC.tif")

BC<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_withCC.tif")

HM<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_withHM.tif")

SEA<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_withSEA.tif")

Ref<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_EC_IM_ReflectanceBi.tif")

Atlas<- stack("./UAV imagery/Lonnstorp/2017_04_08/Atlas/Flight_2/Clip_2017-04-08T10-14-44Z_BGREN_13-March-161.tif")


##Calculate vegetation indices
#TCARI/OSAVI
tcariOsavi1<-TCARI.OSAVI(Def)
names(tcariOsavi1)<-"Def"

tcariOsavi2<-TCARI.OSAVI(BC)
names(tcariOsavi2)<-"BC"

tcariOsavi3<-TCARI.OSAVI(HM)
names(tcariOsavi3)<-"HM"

tcariOsavi4<-TCARI.OSAVI(SEA)
names(tcariOsavi4)<-"SEA"

tcariOsavi5<-TCARI.OSAVI(Ref)
names(tcariOsavi5)<-"Ref"

tcariOsavi6<-TCARI.OSAVI(Atlas)
names(tcariOsavi6)<-"Atlas"


#GI
gi1<-GI(Def)
names(gi1)<-"Def"

gi2<-GI(BC)
names(gi2)<-"BC"

gi3<-GI(HM)
names(gi3)<-"HM"

gi4<-GI(SEA)
names(gi4)<-"SEA"

gi5<-GI(Ref)
names(gi5)<-"Ref"

gi6<-GI(Atlas)
names(gi6)<-"Atlas"


#NDVI 
ndvi1<-NDVI(Def)
names(ndvi1)<-"Def"
ndvi1[ndvi1 == 0] <- NA

ndvi2<-NDVI(BC)
names(ndvi2)<-"BC"
ndvi2[ndvi2 == 0] <- NA

ndvi3<-NDVI(HM)
names(ndvi3)<-"HM"
ndvi3[ndvi3 == 0] <- NA

ndvi4<-NDVI(SEA)
names(ndvi4)<-"SEA"
ndvi4[ndvi4 == 0] <- NA

ndvi5<-NDVI(Ref)
names(ndvi5)<-"Ref"
ndvi5[ndvi5 == 0] <- NA

ndvi6<-NDVI(Atlas)
names(ndvi6)<-"Atlas"
ndvi6[ndvi6 == 0] <- NA


#NDRe 
ndre1<-NDRe(Def)
names(ndre1)<-"Def"
ndre1[ndre1 == 0] <- NA

ndre2<-NDRe(BC)
names(ndre2)<-"BC"
ndre2[ndre2 == 0] <- NA

ndre3<-NDRe(HM)
names(ndre3)<-"HM"
ndre3[ndre3 == 0] <- NA

ndre4<-NDRe(SEA)
names(ndre4)<-"SEA"
ndre4[ndre4 == 0] <- NA

ndre5<-NDRe(Ref)
names(ndre5)<-"Ref"
ndre5[ndre5 == 0] <- NA

ndre6<-NDRe(Atlas)
names(ndre6)<-"Atlas"
ndre6[ndre6 == 0] <- NA

#Evi
evi1<-EVI(Def)
names(evi1)<-"Def"

evi2<-EVI(BC)
names(evi2)<-"BC"

evi3<-EVI(HM)
names(evi3)<-"HM"

evi4<-EVI(SEA)
names(evi4)<-"SEA"

evi5<-EVI(Ref)
names(evi5)<-"Ref"

evi6<-EVI(Atlas)
names(evi6)<-"Atlas"


##Group VI
#tcari/osavi
to.list<-ls(pattern="tcariOsavi")
to<-lapply(to.list,get)
names(to)<-to.list

#GI
gi.list<-ls(pattern="gi")
gi.a<-lapply(to.list,get)
names(gi.a)<-gi.list

#ndvi
ndvi.list<-ls(pattern="ndvi")
ndvi.a<-lapply(to.list,get)
names(ndvi.a)<-ndvi.list

#ndre
ndre.list<-ls(pattern="ndre")
ndre.a<-lapply(to.list,get)
names(ndre.a)<-ndre.list

#evi
evi.list<-ls(pattern="evi")
evi.a<-lapply(to.list,get)
names(evi.a)<-evi.list



##Export them
#tcari/osavi  
mapply(writeRaster,to, paste0("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_",
                          names(to)), 'GTiff', options="COMPRESS=NONE",overwrite=T)

#gi
mapply(writeRaster,gi.a, paste0("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_",
                                names(gi.a)), 'GTiff', options="COMPRESS=NONE",overwrite=T)
  
#ndvi
mapply(writeRaster,ndvi.a, paste0("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_",
                                names(ndvi.a)), 'GTiff', options="COMPRESS=NONE",overwrite=T)

#ndre
mapply(writeRaster,ndre.a, paste0("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_",
                                names(ndre.a)), 'GTiff', options="COMPRESS=NONE",overwrite=T)

#evi
mapply(writeRaster,evi.a, paste0("./UAV imagery/Lonnstorp/2017_04_08/VI/Flight_2/Lonnstorp_08_04_2017_2_",
                                names(evi.a)), 'GTiff', options="COMPRESS=NONE",overwrite=T)


##Vizualise all together
#tcari/osavi
par(mfrow=c(3,2),
    oma = c(0,0,0,5),
    mar = c(0,0,2,0))


plot(tcariOsavi1, main="No calibration", axes=F, box=F)

plot(tcariOsavi2, main="Brightness correction",axes=F, box=F)

plot(tcariOsavi3, main="Histogram Matching",axes=F, box=F)

plot(tcariOsavi4,main="Sun elevation angle correction",axes=F, box=F)

plot(tcariOsavi5, main="IN + ELC",axes=F, box=F)

plot(tcariOsavi6,main="Atlas",axes=F, box=F)


#gi
par(mfrow=c(3,2),
    oma = c(0,0,0,5),
    mar = c(0,0,2,0))


plot(gi1, main="No calibration", axes=F, box=F)

plot(gi2, main="Brightness correction",axes=F, box=F)

plot(gi3, main="Histogram Matching",axes=F, box=F)

plot(gi4,main="Sun elevation angle correction",axes=F, box=F)

plot(gi5, main="IN + ELC",axes=F, box=F)

plot(gi6,main="Atlas",axes=F, box=F)


#ndvi
layout(matrix(c(seq(1,6), 7, 7), 4, byrow = T)) # 2x4 matrix
par(oma = c(0,0,0,5),
    mar = c(0,0,2,0))

brk <- c(-1, -0.8, -0.6, -0.4, -0.3, -0.2, 0, 0.2, 0.3, 0.4, 0.5, 1)

plot(ndvi1, main="No calibration", breaks=brk, col=rev(terrain.colors(12)), axes=F, legend=F, box=F)

plot(ndvi2, main="Brightness correction", breaks=brk, col=rev(terrain.colors(12)), axes=F, legend=F, box=F)

plot(ndvi3, main="Histogram Matching", breaks=brk, col=rev(terrain.colors(12)), axes=F, legend=F, box=F)

plot(ndvi4,main="Sun elevation angle correction", breaks=brk, col=rev(terrain.colors(12)), axes=F, legend=F, box=F)

plot(ndvi5, main="IN + ELC", breaks=brk, col=rev(terrain.colors(12)), axes=F, legend=F, box=F)

plot(ndvi6,main="Atlas", breaks=brk, col=rev(terrain.colors(12)), axes=F, legend=F, box=F)

plot(ndvi3, breaks=brk, col=rev(terrain.colors(12)), legend.only=T, horiz=T)



#ndre
par(mfrow=c(3,2),
    oma = c(0,0,0,5),
    mar = c(0,0,2,0))


plot(ndre1, main="No calibration", axes=F, box=F)

plot(ndre2, main="Brightness correction",axes=F, box=F)

plot(ndre3, main="Histogram Matching",axes=F, box=F)

plot(ndre4,main="Sun elevation angle correction",axes=F, box=F)

plot(ndre5, main="IN + ELC",axes=F, box=F)

plot(ndre6,main="Atlas",axes=F, box=F)


#evi
par(mfrow=c(3,2),
    oma = c(0,0,0,5),
    mar = c(0,0,2,0))


plot(evi1, main="No calibration", axes=F, box=F)

plot(evi2, main="Brightness correction",axes=F, box=F)

plot(evi3, main="Histogram Matching",axes=F, box=F)

plot(evi4,main="Sun elevation angle correction",axes=F, box=F)

plot(evi5, main="IN + ELC",axes=F, box=F)

plot(evi6,main="Atlas",axes=F, box=F)




#map.scale()
#=north.arrow(xb=15.75, yb=43.25, len=0.05, lab="N")  


endCluster()

###############################################################
