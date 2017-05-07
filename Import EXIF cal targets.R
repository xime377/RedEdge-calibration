#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries
library(exifr) #On windowsit is needed to install strawberry http://strawberryperl.com/

#Load imgs

T.img.path1 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0008.*.tif$"), 
                                 full.names=T) #9%

T.img.path2 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0004.*.tif$"), 
                                 full.names=T) #9

T.img.path3 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0145.*.tif$"), 
                                 full.names=T) #9%

T.img.path4 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0147.*.tif$"), 
                                 full.names=T) #9%

T.img.path5 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0148.*.tif$"), 
                                 full.names=T) #9%

T.img.path6 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0009.*.tif$"), 
                                 full.names=T) #23%

T.img.path7 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0005.*.tif$"), 
                                 full.names=T) #23

T.img.path8 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0146.*.tif$"), 
                                 full.names=T) #23%

T.img.path9 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0145.*.tif$"), 
                                 full.names=T) #23%

T.img.path10 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0146.*.tif$"), 
                                  full.names=T) #23%

T.img.path11 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0007.*.tif$"), 
                                  full.names=T) #44%

T.img.path12 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0003.*.tif$"), 
                                  full.names=T) #44

T.img.path13 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0147.*.tif$"), 
                                  full.names=T) #44%

T.img.path14 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0143.*.tif$"), 
                                  full.names=T) #44%

T.img.path15<- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0144.*.tif$"), 
                                 full.names=T) #44%

T.img.path16 <- list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path17 <- list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0116.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path18 <- list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0122.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path19 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/1/before/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path20 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/1/after/"), (pattern="0000.*.tif$"),
                                  full.names=T) #RP02-...282 ->50%

T.img.path21 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0002.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path22 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0003.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path23 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0007.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path24 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0008.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path25 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path26 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path27 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0002.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path28 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0141.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path29 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0142.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path30 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0141.*.tif$"), 
                                  full.names=T) #RP02-...282 ->50%

T.img.path31 <- list.files(path=("./Calibration/Cal_pics/2016_08_12/"), (pattern="0123.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path32 <- list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path33 <- list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path34 <- list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0004.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path35 <- list.files(path=("./Calibration/Cal_pics/2016_11_03/1/"), (pattern="0005.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path36 <- list.files(path=("./Calibration/Cal_pics/2016_11_03/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path37 <- list.files(path=("./Calibration/Cal_pics/2016_11_03/2/"), (pattern="0002.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path38 <- list.files(path=("./Calibration/Cal_pics/2016_12_02/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path39 <- list.files(path=("./Calibration/Cal_pics/2016_12_02/"), (pattern="0002.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path40 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/1/after/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path41 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/1/before/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path42 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path43 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path44 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0005.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path45 <- list.files(path=("./Calibration/Cal_pics/2017_03_07/2/"), (pattern="0006.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path46 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0001.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path47 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/1/"), (pattern="0006.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path48 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path49 <- list.files(path=("./Calibration/Cal_pics/2017_03_24/2/"), (pattern="0000.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path50 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0143.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path51 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/1/"), (pattern="0144.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%

T.img.path52 <- list.files(path=("./Calibration/Cal_pics/2017_04_08/2/"), (pattern="0142.*.tif$"), 
                                  full.names=T) #RP02-...200 ->80%


#Group all the images in one list
L.img<-ls(pattern="path")
T.img<-lapply(L.img,get)
names(T.img)<-L.img



#Extract exif

for (i in 1:length(T.img)){
T.img[[i]] <- exifr(T.img[[i]], exiftoolargs="-filename -DateTimeOriginal -FOV -CentralWavelength -Irradiance -IrradianceExposureTime
              -IrradianceGain -IrradiancePitch -IrradianceRoll -IrradianceYaw -Pitch -Roll -Yaw -BlackLevelRepeatDim 
              -Aperture -ShutterSpeed -ISOspeed -Fnumber -ExposureTime -SpectralIrradiance -WavelengthFWHM -FocalLength35efl
              -ScaleFactor35efl -Gain -BandSensitivity")
    write.csv(T.img[[i]], paste0("./Calibration/Cal_pics/EC/", substr(names(T.img[i]),59,68),".csv"))  #Export data as .csv

}

