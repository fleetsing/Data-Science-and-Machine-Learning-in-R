
# Tree methods project

library(ISLR)
library(ggplot2)
library(caTools)
library(rpart)
library(rpart.plot)
library(randomForest)

# Check the head of College, then reassign College to a dataframe called df.
head(College)
df <- College

# Create a scatterplot of Grad.Rate versus Room.Board, colored by the Private column.
pl <- ggplot(df, aes(x = Room.Board, y = Grad.Rate)) + geom_point(aes(color = Private))
print(pl)

# Create a histogram of full time undergrad students, color by Private.
pl2 <- ggplot(df, aes(x = F.Undergrad)) + geom_histogram(aes(fill = Private), color = "black", bins = 50)
print(pl2)

# Create a histogram of Grad.Rate colored by Private.
pl3 <- ggplot(df, aes(x = Grad.Rate)) + geom_histogram(aes(fill = Private), color = "black", bins = 50)
print(pl3)

# What college had a Graduation Rate of above 100% ?
subset(df, df$Grad.Rate > 100)

# Change that college's grad rate to 100%.
df["Cazenovia College", "Grad.Rate"] <- 100
subset(df, df$Grad.Rate > 100)

# Split your data into training and testing sets 70/30. Use the caTools library to do this.
set.seed(101)
split <- sample.split(df$Private, SplitRatio = 0.7)
df.train <- subset(df, split == T)
df.test <- subset(df, split == F)

# Use the rpart library to build a decision tree to predict whether or not a school is Private.
df.tree <- rpart(Private ~ . , method = "class", data = df.train)
printcp(df.tree)

# Use predict() to predict the Private label on the test data.
predicted.private <- predict(df.tree, df.test)

# Check the Head of the predicted values.
head(predicted.private)

# Turn these two columns into one column to match the original Yes/No Label for a Private column.
predicted.private <- as.data.frame(predicted.private)

joiner <- function(x) {
  if (x >= 0.5) {
    return("Yes")
  } else {
    return("No")
  }
}

predicted.private$Private <- sapply(predicted.private$Yes, joiner)
head(predicted.private)

# Now use table() to create a confusion matrix of your tree model.
missTable <- table(predicted.private$Private, df.test$Private)
print(missTable)

# Use the rpart.plot library and the prp() function to plot out your tree model.
prp(df.tree)

# Use randomForest() to build out a model to predict Private class.
rf.tree <- randomForest(Private ~ . , importance = TRUE, data = df.train)

# What was your model's confusion matrix on its own training set? Use model$confusion.
rf.tree$confusion

# Grab the feature importance with model$importance.
rf.tree$importance

# Use the random forest model to predict on the test set.
rf.predict <- predict(rf.tree, df.test)

missTable <- table(rf.predict, df.test$Private)
print(missTable)
