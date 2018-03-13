# install.packages("ggplot2")
# install.packages("hexbin")
library(ggplot2)
library(ggplot2movies)
library(hexbin)

pl <- ggplot(movies, aes(x = year, y = rating))

pl2 <- pl + geom_bin2d() + scale_fill_gradient(high = "red", low = "blue")
print(pl2)

pl3 <- pl + geom_hex() + scale_fill_gradient(high = "red", low = "blue")
print(pl3)

pl4 <- pl + geom_density2d()
print(pl4)
