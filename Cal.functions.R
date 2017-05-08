##Calibration functions

#Slope calculation
#'
#' @param R mean reflectance
#' @param DN mean digital number values
#' @param c constant calibration parameter (offset)
#'
#' @return "m" gain of the linear funtion


SC<-function(R,DN,c){
  
  m=(R-c)/DN  
  }


#Linear calibration
#'
#' @param m gain
#' @param DN raster image input
#' @param c constant calibration parameter (offset)
#'
#' @return Raster with reflectance values

LC<-function(m,DN,c){
  
R= (m*10000*DN)-c  
return(R)
}

#RedEdge considers 32768 100% of reflectance


