library(ggplot2)
df <- mtcars

# Data & Aesthetics:
pl <- ggplot(df, aes(x = wt, y = mpg))

# Geometry:
pl2 <- pl + geom_point(aes(size = hp, color = disp, shape = factor(cyl)), alpha = 0.9)
print(pl2)

pl3 <- pl2 + scale_color_gradient(high = "red", low = "blue")
print(pl3)