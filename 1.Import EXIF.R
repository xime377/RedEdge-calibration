#Load libraries
library(exifr) #On windowsit is needed to install strawberry http://strawberryperl.com/


#Load img
dir(,"tif")
a<-("H:/UAV missions/Lonnstorp/2017_04_30/Micasense/Flight_2/000/IMG_0004_1.tif")
  

T.img.path <- list.files(path=("H:/UAV missions/Lonnstorp/2017_04_30/Micasense/Flight_2/000"), (pattern=".tif$"), 
                                full.names=T) #Load all images

#Extract exif


exif_test<-exifr(a) #extract all the exif data
names(exif_test)    #see what is in the exif data

#Extract exif data useful for the purpose we have
exif_d <- exifr(T.img.path, exiftoolargs="-filename -DateTimeOriginal -FOV -CentralWavelength -Irradiance -IrradianceExposureTime
              -IrradianceGain -IrradiancePitch -IrradianceRoll -IrradianceYaw -Pitch -Roll -Yaw -BlackLevelRepeatDim 
              -Aperture -ShutterSpeed -ISOspeed -Fnumber -ExposureTime -SpectralIrradiance -WavelengthFWHM -FocalLength35efl
              -ScaleFactor35efl -Gain -BandSensitivity")

#Export data as csv
write.csv(exif_d, "H:/UAV missions/Lonnstorp/2017_04_30/Micasense/Flight_2/000/2017_04_30_2_Lonnstorp_EXIF.csv")

