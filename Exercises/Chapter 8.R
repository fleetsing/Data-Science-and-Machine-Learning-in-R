
# Install and import the relevant libraries.

library(tree)
library(ISLR)

# Import the used data set.
df <- Carseats
head(df)

# Recode Sales as a binary variable.
High <- ifelse(df$Sales <= 8, "No", "Yes")

# Merge High with the rest of the data.
df <- data.frame(df, High)
head(df)

# Use the tree() function to fit a classification tree in order to predict High using all variables but Sales.
tree.carseats <- tree(High ~ . -Sales, data = df)
summary(tree.carseats)

# Use the plot() function to display the tree struc- ture, and the text() function to display the node labels.
plot(tree.carseats)
text(tree.carseats, pretty = 0)

# Split the observations into a training set and a test set.
set.seed(2)
df.train <- sample(1:nrow(df), 200)
df.test <- df[-df.train,]
High.test <- High[-df.train]

# Build the tree using the training set.
df.tree <- tree(High ~ . -Sales, data = df, subset = df.train)

# Evaluate the model's performance on the test data.
df.pred <- predict(df.tree, df.test, type = "class")
table(df.pred, High.test)
print((86+57)/200)
