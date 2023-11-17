# load library tidyverse, gridExtra and ggExtra
library(tidyverse)
library(ggExtra)
library(gridExtra)
 
# set theme
theme_set(theme_bw(12))
 
# create x and y vector
xAxis <- rnorm(1000)                 
yAxis <- rnorm(1000) + xAxis + 10  
 
# create sample data frame
sample_data <- data.frame(xAxis, yAxis) 
 
# create scatter plot using ggplot() function
plot <- ggplot(sample_data, aes(x=xAxis, y=yAxis))+
          geom_point()+
        theme(legend.position="none")
 
# use ggMarginal function to create
# marginal histogram, boxplot and density plot
# fill, colo and size property is used for customization
plot1 <- ggMarginal(plot, type="histogram", fill= "green", size=10)
plot2 <- ggMarginal(plot, type="boxplot", color="yellow" )
plot3 <- ggMarginal(plot, type="density", color="green")
 
# combine plots in a grid
grid.arrange( plot1, plot2, plot3, ncol=3)