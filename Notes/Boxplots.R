# install.packages("ggplot2")
library(ggplot2)

df <- mtcars

pl <- ggplot(df, aes(x = factor(cyl), y = mpg)) + geom_boxplot(aes(fill = factor(cyl))) + coord_flip()
print(pl)