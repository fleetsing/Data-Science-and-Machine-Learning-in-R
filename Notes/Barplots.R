# install.packages("ggplot2")
library(ggplot2)
df <- mpg

pl <- ggplot(df, aes(x = class)) + geom_bar(aes(fill = drv), position = "dodge")
print(pl)