#Set Working Directory
#setwd("C:/Users/UAVstudent/Google Drive/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")

#Load libraries
library(exifr) #On windowsit is needed to install strawberry http://strawberryperl.com/


#Load img
dir(,"tif")
T.img.path <- list.files(path=("./UAV imagery/Lonnstorp/2017_03_24/Micasense/Flight_2/000"), (pattern=".tif$"), 
                                full.names=T) #Load all images

exif_d <- exifr(T.img.path, exiftoolargs="-filename -FOV -CentralWavelength -Irradiance -IrradianceExposureTime
              -IrradianceGain -IrradiancePitch -IrradianceRoll -IrradianceYaw -Pitch -Roll -Yaw -ShutterSpeed -SpectralIrradiance 
              -WavelengthFWHM")

write.csv(exif_d, "./UAV imagery/Lonnstorp/2017_03_24/Micasense/Flight_2/000/20170324_Lonnstorp_EXIF.csv")
