
library(ISLR)
library(class)
library(ggplot2)

head(Caravan)
str(Caravan)
summary(Caravan)

any(is.na(Caravan))

purchase <- Caravan$Purchase
head(purchase)

standardized.Caravan <- scale(Caravan[, -86])

head(standardized.Caravan)

test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]

set.seed(101)

predicted.purchase <- knn(train.data, test.data, train.purchase, k = 3)
head(predicted.purchase) 

table(predicted.purchase)
table(test.purchase)

misclass.error <- mean(test.purchase != predicted.purchase)
print(misclass.error)

predicted.purchase <- NULL
error.rate <- NULL

for (i in 1:20) {
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase, k = i)
  
  misclass.error <- mean(test.purchase != predicted.purchase)
  error.rate[i] <- misclass.error
}

print(error.rate)

k.values <- 1:20
error.df <- data.frame(k.values, error.rate)
pl <- ggplot(error.df, aes(x = k.values, y = error.rate)) + geom_point(color = "blue") + geom_line(lty = "dotted", color = "red") + theme_bw()
print(pl)

