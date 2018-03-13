
# Data Visualization project

# Import the ggplot2 & data.table libraries.
library(ggplot2)
library(data.table)

# Use fread to load the csv file 'Economist_Assignment_Data.csv' into a dataframe called df.
df <- fread(file = "/Users/jarnz/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Training Exercises/Capstone and Data Viz Projects/Data Visualization Project/Economist_Assignment_Data.csv", drop = 1)

# Check the head of df.
head(df)

# Use ggplot() + geom_point() to create a scatter plot object called pl.
pl <- ggplot(df, aes(x = CPI, y = HDI)) + geom_point(aes(color = Region))
print(pl)

# Change the points to be larger empty circles.
pl <- ggplot(df, aes(x = CPI, y = HDI)) + geom_point(aes(color = Region), shape = 1, size = 4)
print(pl)

# Add geom_smooth(aes(group=1)) to add a trend line.
pl2 <- pl + geom_smooth(aes(group = 1), method = "lm", formula = y ~ log(x), se = FALSE, color = "red")
print(pl2)

# Add geom_text(aes(label=Country)) to pl2 and see what happens.
pl3 <- pl2 + geom_text(aes(label=Country))
print(pl3)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")
pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
print(pl3)

# Add theme_bw() to your plot and save this to pl4.
pl4 <- pl3 + theme_bw()
print(pl4)

# Add scale_x_continuous().
pl5 <- pl4 + scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10=least corrupt)", limits = c(1, 10), breaks = 1:10)
print(pl5)

# Add scale_y_continuous().
pl6 <- pl5 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best", limits = c(0.2, 1.0), breaks = seq(0.2, 1.0, by = 0.2))
print(pl6)

# Use ggtitle() to add a string as a title.
pl7 <- pl6 + ggtitle("Corruption and Human development")
print(pl7)
