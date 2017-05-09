
###Vegetation indices designed for 5 bands
#
#The bands are following the next sequence:
#
# Band 1: Blue
# Band 2: Green
# Band 3: Red
# Band 4: NIR
# Band 5: Red edge



#######TCARI############ 
#Haboudane et al. (2002)
#'
#' @param R Raster input
#'
#' @return TCARI raster values

TCARI<-function(R){
  
tcari=3*((R[[5]]-R[[3]])-0.2*(R[[5]]-R[[2]])*	 
(R[[5]]/R[[3]]))

  tcari
}

#######OSAVI############ 
#Rondeaux et al. (1994)
#'
#' @param R Raster input
#'
#' @return 

OSAVI<-function(R){
  
 osavi= (1+0.16)*(R[[4]]-R[[3]])/	 
  (R[[4]]+R[[3]]+0.16)
  
  osavi
}

#######TCARI/OSAVI############ 
#Haboudane et al. (2002)
#'
#' @param R Raster input
#'
#' @return 

TCARI.OSAVI<-function(R){
  
  TO=TCARI(R)/OSAVI(R)
  
  TO
}

#######GI############ 
#Smith et al. (1995)
#' 0 to 1
#' @param R Raster input
#'
#' @return 

GI<-function(R){
  
  gi= R[[2]]/R[[3]]
  
  gi
  
}

#######NDVI############ 
#Rouse et al. (1974)
#'  -1 to 1
#' @param R Raster input
#'
#' @return 

NDVI<-function(R){
  
  ndvi=(R[[4]]-R[[2]])/(R[[4]]+R[[2]])
  
  ndvi
  
}
  
  


########NDRe############ 
#Barnes et al. (2000)
#'  -1 to 1
#' @param R Raster input
#' @return 

NDRe<-function(R){

  ndre=(R[[4]]-R[[5]])/(R[[4]]+R[[5]])
  
}
  
########EVI############ 
#Huete et al. (2002)
#'  -1 to 1
#' @param R Raster input
#' @return 

EVI<-function(R){

evi= 2.5*((R[[4]]-R[[3]])/(R[[4]]-(6*R[[3]])-(7.5*R[[1]])+1))
}


#Add all the functions into a folder
devtools::create('VegIndx')

#Paste the Rscript in the R folder

#End
##############################################################
