#Exposure compensation  function
#'
#' @param r raster image (input for the calculation)
#' @param f Fnumber
#' @param e Exposure time
#' @param k ISO speed rating
#'
#' @return Exposure compensated raster

EC<-function(r, f, e, k){

  x=(r*(f^2))/(e*k)  
}


##################################################


