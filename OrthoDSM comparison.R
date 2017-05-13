#Set WD
#setwd("H:/Ximena/MSc Thesis/Results/UAV imagery")
setwd("D:/Google Drive/MSc Thesis/Results/UAV imagery")

###Load libraries
#library(pacman)
#pacman::p_load(agricolae, Rmisc) To install several packages at the same time
library(raster)
library(maps)  
library(GISTools)

##Load orthomosaics


pixO <- lapply(list.files(path=("./Lonnstorp/2017_04_08/Pix4d/Untitl/3_dsm_ortho/2_mosaic/"), (pattern="Untitl_transparent_mosaic.*.tif$"), 
                                full.names=T), raster) #Load all bands

pix4O<- stack(pixO)
subset<-extent(c(381333.3, 381651.6, 6170379, 6170658))
# pix4O<-crop(pix4O,subset)
#  
# writeRaster(pix4O,("./Lonnstorp/2017_04_08/Pix4d/Untitl/3_dsm_ortho/2_mosaic/Lonnstorp_08_04_2017_2_pix4d_stack.tif"),datatype="INT2U",
#             options="COMPRESS=NONE", overwrite=T)

pix4D<- raster("./Lonnstorp/2017_04_08/Pix4d/Untitl/3_dsm_ortho/1_dsm/Untitl_dsm.tif")
pix4D<-crop(pix4D,subset)

AtlasO<- stack("./Lonnstorp/2017_04_08/Atlas/Flight_2/Clip_2017-04-08T10-14-44Z_BGREN_13-March-161.tif")

AtlasD<- raster("./Lonnstorp/2017_04_08/Atlas/Flight_2/2017-04-08T10-14-44Z_DSM_13-March-16.tif")
AtlasD<-crop(AtlasD,subset)

AgisO<- stack("./Lonnstorp/2017_04_08/Agisoft/Flight_2/Orthomosaic/Lonnstorp_08_04_2017_2_with_CC.tif")

AgisD<- raster("./Lonnstorp/2017_04_08/Agisoft/Flight_2/DSM/2017_04_08_Lonsstorp_2_DSM.tif")
AgisD<-crop(AgisD,subset)


##Vizualise all together
#DSM
par(mfrow=c(1,3),
    oma = c(0,0,0,0),
    mar = c(0,0,2,0))


plot(pix4D, axes=F)
box(col="white")
plot(AtlasD, axes=F)
box(col="white")
plot(AgisD, axes=F)
box(col="white")

#Orthomosaic
par(mfrow=c(1,3),
    oma = c(0,0,0,0),
    mar = c(0,0,2,0),
    xaxt="n", yaxt="n")


plotRGB(pix4O, r=3, g=2, b=1, 65535, colNA='white', axes=T, main="Pix4Dmapper")   
plotRGB(AtlasO, r=3, g=2, b=1, 10000, colNA='white', axes=T, main="Atlas")
plotRGB(AgisO, r=3, g=2, b=1, 65535, colNA='white', axes=T, main="Agisoft PhotoScan")   




map.scale()
north.arrow(xb=15.75, yb=43.25, len=0.05, lab="N")  
