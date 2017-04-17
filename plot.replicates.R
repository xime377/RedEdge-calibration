insert_minor <- function(major_labs, n_minor){
  #function to create minor ticks
  labs <- c(sapply(major_labs, function(x) c(x, rep("", 4))))
  labs[1:(length(labs) - n_minor)]
}

plot.replicates <- function(my_data)
{
  #function to plot gray replicates and the mean in black
  g <- ggplot(my_data, aes(x = Wavelength, y = Reflectance)) + 
        geom_line(aes(group=Replicate),size=0.2,colour="gray62") +
        stat_summary(fun.y = "mean", colour = "black", size = 1, geom = "line")+
    scale_x_continuous(breaks = seq(325, 1080, by = 30), 
                       labels = insert_minor(seq(325, 1080, by=150), 4), 
                       limits = c(325, 1080), expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
    theme(axis.text=element_text(size=12),
    axis.title=element_text(size=14,face="bold"))+
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(g)
}


  
plot.bydates <- function(my_data)
{
  #function to plot replicates grouped by date
  d <-ggplot(my_data, aes(x = Wavelength, y = Reflectance, colour=Date)) + 
    geom_line(size=0.2) +
    scale_x_continuous(breaks = seq(325, 1080, by = 30), 
                       labels = insert_minor(seq(325, 1080, by=150), 4), 
                       limits = c(325, 1080), expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14,face="bold"))+
    guides(colour = guide_legend(override.aes = list(size=5)))+
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(d)
}


plot.byLC<-function(my_data)
{
  #Function to plot replicates grouped by light conditions
  l<-ggplot(my_data, aes(x = Wavelength, y = Reflectance, colour=Light)) + 
    geom_line(size=0.2) +
    scale_x_continuous(breaks = seq(325, 1080, by = 30), 
                       labels = insert_minor(seq(325, 1080, by=150), 4), 
                       limits = c(325, 1080), expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
    scale_color_manual(
    values = c(
      "Clear sky"="#00e6e6", 
      "Cloudy"="#66a3ff",
      "Overcast"="#2c7fb8"))+
    theme(legend.title = element_blank(),
    axis.text=element_text(size=12),
    axis.title=element_text(size=14,face="bold"))+
    guides(colour = guide_legend(override.aes = list(size=3)))+
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(l)
}


plot.byrep <- function(my_data)
{#Function to plot replicates on different colours
  g <- ggplot(my_data, aes(x = Wavelength, y = Reflectance, colour= Replicate)) + 
    geom_line(size=0.2) +
    stat_summary(fun.y = "mean", colour = "black", size = 1, geom = "line")+
    scale_x_continuous(breaks = seq(325, 1080, by = 30), 
                       labels = insert_minor(seq(325, 1080, by=150), 4), 
                       limits = c(325, 1080), expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14, face="bold"))+
    guides(colour = guide_legend(override.aes = list(size=5)))+
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(g)
}


plot.repR <- function(my_data)
{
  #function to plot gray replicates and the mean in black (Micasense range)
  g <- ggplot(my_data, aes(x = Wavelength, y = Reflectance)) + 
    geom_line(aes(group=Replicate),size=0.2,colour="gray62") +
    stat_summary(fun.y = "mean", colour = "black", size = 1, geom = "line")+
    scale_x_continuous(breaks = seq(465, 865, by = 20), 
                       labels = insert_minor(seq(465, 865, by=100), 4), 
                       limits = c(465, 860), expand = c(0, 0)) +
    scale_y_continuous(breaks = seq(0, 1, by = 0.1), expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14,face="bold"))+
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(g)
}

plot.grayS<-function(my_data)
{
 #Function to plot lines on gray scale (lower values darker)
    g<-ggplot(my_data, aes(x=Wavelength, y=Reflectance, colour=Target)) + 
    geom_line(size=0.8)+
    scale_colour_grey(name="")+
    scale_x_continuous(breaks= seq(325,1080,by=30), 
                       labels = insert_minor(seq(325, 1080, by=150),4), 
                       limits = c(325,1080), expand =c(0,0)) +
    scale_y_continuous(expand =c(0,-0.05), limits= c(-0.05, 1.05))+            #Set max 1
      theme(axis.text=element_text(size=12),
            axis.title=element_text(size=14,face="bold"))+
      xlab("Wavelength (nm)") + ylab("Reflectance") +
      background_grid(major = "none", minor = "none")
    return(g)
}

plot.graySM<-function(my_data)
{
  #Function to plot lines on gray scale (Micasense Range)
  g<-ggplot(my_data, aes(x=Wavelength, y=Reflectance, colour=Target)) + 
    geom_line(size=0.8)+
    scale_colour_grey(name="")+
    scale_x_continuous(breaks= seq(325,1080,by=30), 
                       labels = insert_minor(seq(325, 1080, by=150),4), 
                       limits = c(325,1080), expand =c(0,0)) +
    scale_y_continuous(expand =c(0,-0.05), limits= c(-0.05, 1.05))+            #Set max 1
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14,face="bold"))+
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(g)
}
