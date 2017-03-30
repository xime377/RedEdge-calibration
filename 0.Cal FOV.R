#Set WD
#setwd("C:/Users/UAVstudent/Google Drive/MSc Thesis/Results")
setwd("C:/Users/Ximena/Google Drive/MSc Thesis/Results")


#Load functions
source("./lib/FOV.Cal.R")


#Calculate the FOV of a sensor at certain height
height<-0.2 #height where the sensor is located (meters)
FOV.s<-7.5 #FOV of the sensor (degrees)
s.incl<-45  #Sensor inclination (degrees), 0 by default

FOV(height,FOV.s,s.incl) 

