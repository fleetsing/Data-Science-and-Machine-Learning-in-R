# install.packages("ggplot2")
library(ggplot2)

pl <- ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
print(pl)

pl2 <- pl + coord_cartesian(xlim = c(1, 4), ylim = c(15, 30))
print(pl2)

pl3 <- pl + coord_fixed(ratio = 1/3)
print(pl3)

pl4 <- pl + facet_grid(. ~ cyl)
print(pl4)

pl5 <- pl + facet_grid(drv ~ .)
print(pl5)

pl6 <- pl + facet_grid(drv ~ cyl)
print(pl6)
