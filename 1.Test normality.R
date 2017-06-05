#Set WD
#setwd("H:/Ximena/MSc Thesis/Results")
setwd("D:/Google Drive/MSc Thesis/Results")

###Load libraries

#library(pacman)
#pacman::p_load(agricolae, Rmisc, ggplot2, cowplot) To install several packages at the same time
library(agricolae)
library(reshape2)
library(Rmisc)

#Load functions
source("./lib/load.file.R")


#Import reflectance values
RefTar.path <- "./Calibration/Targets full/" 
load.file(RefTar.path, "Tgt.csv")

#load all as a list
Targets.l<-ls(pattern="Tgt")
Targets<-lapply(Targets.l,get)
names(Targets)<-Targets.l


#Calculate mean per replicate
Mean.9<-colMeans(M9Tgt)
Mean.23<-colMeans(M23Tgt)
Mean.44<-colMeans(M44Tgt)
Mean.55<-colMeans(Mica50Tgt)
Mean.66<-colMeans(Mica80Tgt)

Mean.9<-Mean.9[2:24]
Mean.23<-Mean.23[2:24]
Mean.44<-Mean.44[2:24]
Mean.55<-Mean.55[2:24]
Mean.66<-Mean.66[2:24]


###Group them
Mean.tgt<-qpcR:::cbind.na(Mean.9,Mean.23, Mean.44, Mean.55, Mean.66)

M.MTgt<-melt(Mean.tgt,na.rm=T, value.name = "Reflectance", variable.name= "Target")
head(M.MTgt)

###Tests to see near Lambertian properties
##For the ASD range

#Normality test -> Shapiro test (w<0.99 and pvalue<0.05 shows non-normal distribution https://stats.stackexchange.com/questions/15696/interpretation-of-shapiro-wilk-test)
n.test<-aggregate(Reflectance~Var2,data=M.MTgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test



##Plot multiple qqplots together (https://stats.stackexchange.com/questions/101274/how-to-interpret-a-qq-plot)
par(mfrow=c(2,3)) #plots 2 by 3 window
for (i in length(Mean.tgt)){
  qqnorm(Mean.tgt[,i],main=names(Mean.tgt)[i])
}


M9<-M.MTgt[M.MTgt$Var2=="Mean.9",]
M23<-M.MTgt[M.MTgt$Var2=="Mean.23",]
M44<-M.MTgt[M.MTgt$Var2=="Mean.44",]
M55<-M.MTgt[M.MTgt$Var2=="Mean.55",]
M66<-M.MTgt[M.MTgt$Var2=="Mean.66",]

#Comparison test
#anova test->parametric
aov.t9<-lm(Reflectance~Var2, M9) 
anova(aov.t9)
summary(aov.t9)
outp<-HSD.test(aov.t9, "Replicate")


#


#Kruskal-Wallis test (less than 0.05, different)-> non-parametric
kruskal.test(Reflectance~Var1, M9)
kruskal.test(Reflectance~Var1, M23)
kruskal.test(Reflectance~Var1, M44)
kruskal.test(Reflectance~Var1, M55)
kruskal.test(Reflectance~Var1, M66)



###
##For the Micasense Range

#Extract Reflectance values from 465 - 860 nm (Micasense 2015)
for (i in 1:length(Targets))   #For all the df on the list
{
  Targets[[i]] <- Targets[[i]][(Targets[[i]]$Wavelength>=465) & (Targets[[i]]$Wavelength<=860), ]#subset
  assign(paste0("R.",names(Targets[i])), as.data.frame(Targets[[i]]))  #output as df
}

#Calculate mean per replicate Micasense Range
R.Mean.9<-colMeans(R.M9Tgt)
R.Mean.23<-colMeans(R.M23Tgt)
R.Mean.44<-colMeans(R.M44Tgt)
R.Mean.55<-colMeans(R.Mica50Tgt)
R.Mean.66<-colMeans(R.Mica80Tgt)



#Group them
R.Mean.tgt<-qpcR:::cbind.na(R.Mean.9,R.Mean.23, R.Mean.44, R.Mean.55, R.Mean.66)

R.Mean.tgt<- R.Mean.tgt[2:24,]
R.M.MTgt<-melt(R.Mean.tgt,na.rm=T, value.name = "Reflectance", variable.name= "Target")
head(R.M.MTgt)

#Normality test -> Shapiro test (w<0.99 and pvalue<0.05 shows non-normal distribution https://stats.stackexchange.com/questions/15696/interpretation-of-shapiro-wilk-test)
R.n.test<-aggregate(Reflectance~Var2,data=R.M.MTgt, function(x) {y <- shapiro.test(x); c(y$statistic, y$p.value)}) #shapiro test



##Plot multiple qqplots together (https://stats.stackexchange.com/questions/101274/how-to-interpret-a-qq-plot)
par(mfrow=c(2,3)) #plots 2 by 3 window
for (i in length(Mean.tgt)){
  qqnorm(Mean.tgt[,i],main=names(Mean.tgt)[i])
}


#Comparison test
#anova test->parametric
aov.t9<-lm(Reflectance~Replicate, R.M9Tgt) 
anova(aov.t9)
summary(aov.t9)
outp<-HSD.test(aov.t9, "Replicate")


#Kruskal-Wallis test (less than 0.05, different)-> non-parametric
kruskal.test(Reflectance~Target, R.M9Tgt)
kruskal.test(Reflectance~Replicate, R.M23Tgt)
kruskal.test(Reflectance~Replicate, R.M44Tgt)
kruskal.test(Reflectance~Replicate, R.Mica50Tgt)
kruskal.test(Reflectance~Replicate, R.Mica80Tgt)




