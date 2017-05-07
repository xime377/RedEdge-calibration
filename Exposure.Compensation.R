#Exposure compensation  function

EC<-function(img, Fnumber, ExposureT,ISOSR){

  (img *(FNumber^2))/(ExposureT*ISOSR)  
}


##################################################
