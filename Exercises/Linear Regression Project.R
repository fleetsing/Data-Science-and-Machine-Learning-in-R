
# Linear Regression Project

# Read the bikeshare.csv file and set it to a dataframe called bike.
bike <- read.csv("~/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Training Exercises/Machine Learning Projects/CSV files for ML Projects/bikeshare.csv")
head(bike)
str(bike)
summary(bike)

# Create a scatter plot of count vs temp. Set a good alpha value.
print(ggplot(bike, aes(x = temp, y = count)) + geom_point(aes(color = count), alpha = 0.2) + theme_light())

# Convert the datetime column into POSIXct.
bike$datetime <- as.POSIXct(bike$datetime)

# Plot count versus datetime as a scatterplot with a color gradient based on temperature.
print(ggplot(bike, aes(x = datetime, y = count)) + geom_point(aes(color = temp), alpha = 0.2) + theme_light() + scale_color_gradient(high = "red", low = "blue"))

# What is the correlation between temp and count?
cor(bike$temp, bike$count)

# Create a boxplot, with the y axis indicating count and the x axis being a box for each season.
print(ggplot(bike, aes(x = factor(season), y = count)) + geom_boxplot(aes(color = factor(season))) + theme_light())

# Create an "hour" column that takes the hour from the datetime column.
hour <- format(bike$datetime, "%H")
bike <- cbind(bike, hour)
head(bike)

# Create a scatterplot of count versus hour, with color scale based on temp. Only use bike data where workingday==1.
print(ggplot(subset(bike, workingday == 1), aes(x = hour, y = count)) + geom_point(aes(color = temp), alpha = 0.5, position=position_jitter(w=1, h=0)) + theme_light() + scale_color_gradientn(colors=c("dark blue", "blue", "green", "yellow", "red", "dark red")))

# Create the same plot for non working days.
print(ggplot(subset(bike, workingday == 0), aes(x = hour, y = count)) + geom_point(aes(color = temp), alpha = 0.5, position=position_jitter(w=1, h=0)) + theme_light() + scale_color_gradientn(colors=c("dark blue", "blue", "green", "yellow", "red", "dark red")))

# Use lm() to build a model that predicts count based solely on the temp feature.
temp.model <- lm(count ~ temp, data = bike)
summary(temp.model)

# How many bike rentals would we predict if the temperature was 25 degrees Celsius?
6.0462 + 25 * 9.1705
temp.test <- data.frame(temp = c(25))
predict(temp.model, temp.test)

# Use sapply() and as.numeric to change the hour column to a column of numeric values.
bike$hour <- sapply(bike$hour, as.numeric)

# Finally build a model that attempts to predict the count based on multiple predictors.
model <- lm(count ~ . -datetime -atemp -casual -registered, data = bike)
summary(model)
