##Calculate RMSE%

#Error calculation
#'
#' @param Pred predicted values
#' @param Ref Reference values
#'
#' @return E Error in %


EP<-function(Pred,Ref){
  
  E=(Pred-Ref)/Ref
  
  E
  }


#Calculation of SE %
#'
#' @param Pred predicted values
#' @param Ref Reference values
#'
#' @return SE Standard Error in %

seP<-function(Pred,Ref){
  
SE= (EP(Pred, Ref))^2

return(SE)
}



#Calculation of MSE %
#'
#' @param Pred predicted values
#' @param Ref Reference values
#'
#' @return MSE Mean Squared Error in %

mseP<-function(Pred,Ref){
  
  MSE= mean(seP(Pred, Ref))
  
  return(MSE)
}



#Calculation of RMSE %
#'
#' @param Pred predicted values
#' @param Ref Reference values
#'
#' @return RMSE in %

rmseP<-function(Pred,Ref){
  
  MSE= sqrt(mseP(Pred, Ref))
  
  return(MSE)
}



##################################################


