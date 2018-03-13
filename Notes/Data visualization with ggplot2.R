# install.packages("ggplot2")

library(ggplot2)

ggplot(data = mtcars) # data
pl <- ggplot(data = mtcars, aes(x = mpg, y = hp)) # data & aesthetics
pl2 <- pl + geom_point() # data & aesthetics & geometrics
pl2

pl3 <- pl2 + facet_grid(cyl ~ .) # ... & facets
pl3

pl4 <- pl3 + stat_smooth() # ... & facets & statistics
pl4

pl5 <- pl4 + coord_cartesian(xlim = c(15, 25)) # ... & facets & statistics & coordinates
pl5

pl6 <- pl5 + theme_dark() # ... & facets & statistics & coordinates & theme
pl6
