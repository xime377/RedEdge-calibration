#Set WD
#setwd("H:/Ximena/MSc Thesis/Results/UAV imagery/")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results/UAV imagery/")


#Load libraries
library(exifr) #On windows it is needed to install strawberry http://strawberryperl.com/

#Load imgs
dir(,"tif")
T.img.O <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/000"), (pattern=".tif$"), 
                      full.names=F) #Load all images

T.img.H <- list.files(path=("./Lonnstorp/2017_04_08/Micasense/Flight_2/H"), (pattern=".tif$"), 
                      full.names=F) #Load all images



#Transfer EXIF information from original images to converted images

#exiftool.call("--help")

#One img
#exiftool.call("-tagsfromfile C:/Users/Ximena/Lonnstorp/2017_04_08/Micasense/Flight_2/000/IMG_0000_1.tif -ext TIF -all:all -makernotes -make -model -P C:/Users/Ximena/Lonnstorp/2017_04_08/Micasense/Flight_2/H/IMG_0000_1.tif")


#Multiple imgs
for(i in 1:length(T.img.H)) #Create the command
{
  T.img.H[i] <- (paste0("-tagsfromfile C:/Users/Ximena/Lonnstorp/2017_04_08/Micasense/Flight_2/000/",T.img.O[i],
                        " -all:all -makernotes -make -model -P -overwrite_original C:/Users/Ximena/Lonnstorp/2017_04_08/Micasense/Flight_2/H/",T.img.O[i]))
  
  exiftool.call(T.img.H[i])    #Copy the exifs to the new imgs          
}


#End
######
