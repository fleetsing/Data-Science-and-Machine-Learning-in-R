
# ggplot2 Exercise

library(ggplot2)
library(ggthemes)
head(mpg)
head(txhousing)
theme_set(theme_gray())

# Histogram of hwy mpg values:

pl <- ggplot(mpg, aes(x = hwy)) + geom_histogram(bins = 20, fill = "red", alpha = 0.5)
print(pl)

# Barplot of car counts per manufacturer with color fill defined by cyl count:

pl2 <- ggplot(mpg, aes(x = manufacturer)) + geom_bar(aes(fill = factor(cyl)))
print(pl2)

# Create a scatterplot of volume versus sales:

pl3 <- ggplot(txhousing, aes(x = sales, y = volume)) + geom_point(color = "blue", alpha = 0.3)
print(pl3)

# Add a smooth fit line to the scatterplot from above:

pl4 <- ggplot(txhousing, aes(x = sales, y = volume)) + geom_point(color = "blue", alpha = 0.3) + geom_smooth(color = "red")
print(pl4)
