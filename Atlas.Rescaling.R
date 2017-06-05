#RedEdge considers 32768 100% of reflectance

##Atlas Rescaling
#'
#' @param R Raster
#'
#' @return "ref" Reflectance values 


ARs<-function(R){
  
  ref=(R*100)/3276800
  ref
} 
