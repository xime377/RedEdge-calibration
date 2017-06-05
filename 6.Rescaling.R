#Set WD
setwd("H:/Ximena/MSc Thesis/Results")
#setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
#library(pacman)
library(raster)


#Load functions
source("./lib/Atlas.Rescaling.R")


###Load Orthomosaics

Ref0<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_ReflectanceBi.tif")

RefE<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_EC_ReflectanceBi.tif")

RefP<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_PARN_ReflectanceBi.tif")

RefI<- stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_IC_ReflectanceBi.tif")

RefS<-stack("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_IC_ReflectanceBi_SEA.tif")

Atlas<- stack("./UAV imagery/Lonnstorp/2017_04_08/Atlas/Flight_2/Clip_2017-04-08T10-14-44Z_BGREN_13-March-161.tif")


###Re-scale them (Divide by 100000)

Ref0<- (Ref0/100000)

RefE<-(RefE/100000)

RefP<- (RefP/100000)

RefI<- (RefI/100000)

RefS<- (RefS/100000)

Atlas<- ARs(Atlas)


plotRGB(RefS, r=3, g=2, b=1, colNA='white')  #PlotRGB


###Export them

Ref0<- writeRaster(Ref0,("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_ReflectanceBi_R.tif"),
                   options="COMPRESS=NONE", overwrite=T)

RefE<- writeRaster(RefE, ("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_EC_ReflectanceBi_R.tif"),
                   options="COMPRESS=NONE", overwrite=T)

RefP<- writeRaster(RefP, ("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_PARN_ReflectanceBi_R.tif"),
                   options="COMPRESS=NONE", overwrite=T)

RefI<- writeRaster(RefI,("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_IC_ReflectanceBi_R.tif"),
                   options="COMPRESS=NONE", overwrite=T)

RefS<-writeRaster(RefS,("./UAV imagery/Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_IC_ReflectanceBi_SEA_R.tif"),
                  options="COMPRESS=NONE", overwrite=T)

Atlas<- writeRaster(Atlas,("./UAV imagery/Lonnstorp/2017_04_08/Atlas/Flight_2/Clip_2017-04-08T10-14-44Z_BGREN_13-March-161_R.tif"),
                    options="COMPRESS=NONE", overwrite=T)

