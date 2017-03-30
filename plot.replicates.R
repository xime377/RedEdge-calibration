insert_minor <- function(major_labs, n_minor){
  #function to create minor ticks
  labs <- c(sapply(major_labs, function(x) c(x, rep("", 4))))
  labs[1:(length(labs) - n_minor)]
}

plot.replicates <- function(my_data)
{
  g <- ggplot(my_data, aes(x = Wavelength, y = Reflectance)) + 
        geom_line(aes(group=Replicate),size=0.2,colour="gray62") +
        stat_summary(fun.y = "mean", colour = "black", size = 1, geom = "line")+
    scale_x_continuous(breaks = seq(325, 1080, by = 30), 
                       labels = insert_minor(seq(325, 1080, by=150), 4), 
                       limits = c(325, 1080), expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, -0.05), limits = c(-0.05, 1.05))+            #Set max 1
    xlab("Wavelength (nm)") + ylab("Reflectance") +
    background_grid(major = "none", minor = "none")
  return(g)
}
