
# K nearest neighbours project

library(ISLR)
library(caTools)
library(class)
library(ggplot2)

# Check the head of the iris Data Frame.
head(iris)
str(iris)

# Use scale() to standardize the feature columns of the iris dataset.
var(iris[,1])
iris.standard <- scale(iris[, -5])
head(iris.standard)
var(iris.standard[,1])

# Join the standardized data with the response/target/label column.
Species <- iris$Species
iris.standard <- cbind(as.data.frame(iris.standard), Species)
head(iris.standard)

# Use the caTools library to split your standardized data into train and test sets.
set.seed(101)
split <- sample.split(iris.standard$Species, SplitRatio = 0.7)
iris.train <- subset(iris.standard[,-5], split == T)
species.train <- subset(iris.standard[,5], split == T)
iris.test <- subset(iris.standard[,-5], split == F)
species.test <- subset(iris.standard[,5], split == F)

# Use the knn function to predict Species of the test set with k = 1.
predicted.species <- knn(iris.train, iris.test, species.train, k = 1)
str(predicted.species)
table(predicted.species)

# What was your misclassification rate?
misclass.error <- mean(species.test != predicted.species)
print(misclass.error)

# Create a plot of the error (misclassification) rate for k values ranging from 1 to 10.
predicted.species <- NULL
error.rate <- NULL

for (i in 1:10) {
  set.seed(101)
  predicted.species <- knn(iris.train, iris.test, species.train, k = i)
  
  error.rate[i] <- mean(species.test != predicted.species)
}

print(error.rate)

k.values <- 1:10
error.df <- data.frame(k.values, error.rate)

pl <- ggplot(error.df, aes(x = k.values, y = error.rate)) + geom_point(color = "blue") + geom_line(lty = "dotted", color = "red") + theme_bw()
print(pl)





