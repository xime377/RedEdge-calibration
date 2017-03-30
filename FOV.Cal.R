#Calculate FOV

degrees.to.radians<-function(x)
{
  if(!is.numeric(x)) stop("Please enter a numeric value!\n")
      radians<-x*pi/180
  radians
}



#' Field of View
#'
#' @param h height where the sensor is located
#' @param a full angle of the sensor
#'
#' @return Field of View

FOV<-function(h,a,b=0) {
  a<-a/2
  a.r<-degrees.to.radians(a)
  b.r<-degrees.to.radians(b)
  FOV.v=h*(tan(b.r) + tan(a.r))
  Radius=round(FOV.v,3)
  Diameter=Radius*2
  res<-cbind(Radius,Diameter)
  return(res)
  }

#' @example FOV(2,1)
