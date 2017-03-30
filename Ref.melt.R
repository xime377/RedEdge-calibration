Ref.melt <- function(x){
  x <- melt(x, id="Wavelength", 
            variable.name= "Replicate",
            value.name = "Reflectance")
  x
}
