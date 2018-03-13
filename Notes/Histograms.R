# install.packages("ggplot2")
# install.packages("ggplot2movies")
library(ggplot2)
library(ggplot2movies)

# Data & Aesthetics:
pl <- ggplot(movies, aes(x = rating))

# Geometry:
pl2 <- pl + geom_histogram(binwidth = 0.1, color = "red", fill = "pink", alpha = 0.3)
print(pl2)

pl3 <- pl2 + xlab("Movie Rating") + ylab("Count")
print(pl3)

pl4 <- pl3 + ggtitle("A title")
print(pl4)

# Advanced:

pl2 <- pl + geom_histogram(binwidth = 0.1, aes(fill = ..count..))
print(pl2)

pl3 <- pl2 + xlab("Movie Rating") + ylab("Count")
print(pl3)

pl4 <- pl3 + ggtitle("A title")
print(pl4)