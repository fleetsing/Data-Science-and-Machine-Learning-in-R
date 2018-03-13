# install.packages("Amelia")

library(Amelia)
library(ggplot2)
library(dplyr)
library(caTools)

df.train <- read.csv("~/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Machine Learning with R/titanic_train.csv")
print(head(df.train))
print(summary(df.train))
print(str(df.train))

missmap(df.train, main = "Missing map", col = c("yellow", "black"), legend = F)

ggplot(df.train, aes(as.factor(Survived))) + geom_bar()
ggplot(df.train, aes(Sex)) + geom_bar(aes(fill = factor(Pclass)))
ggplot(df.train, aes(Age)) + geom_histogram(bins = 20, alpha = 0.5, fill = "blue")
ggplot(df.train, aes(SibSp)) + geom_bar()
ggplot(df.train, aes(Fare)) + geom_histogram(alpha = 0.5, color = "black", aes(fill = factor(Pclass)))

pl <- ggplot(df.train, aes(x = Pclass, y = Age)) + geom_boxplot(aes(group = Pclass, fill = factor(Pclass), alpha = 0.4))
pl <- pl + scale_y_continuous(breaks = seq(min(0), max(80), by = 2)) + theme_bw()
print(pl)

sum(is.na(df.train$Age))

impute_age <- function(age, class) {
  out <- age
  for (i in 1:length(age)) {
    
    if (is.na(age[i])) {
      
      if (class[i] == 1) {
        out[i] <- 37
        
      } else if (class[i] == 2) {
        out[i] <- 29
        
      } else if (class[i] == 3) {
        out[i] <- 24
        
      }
      
    } else {
      out[i] <- age[i]
      
    }
  }
  return(out)
  
}

fixed.ages <- impute_age(df.train$Age, df.train$Pclass)
df.train$Age <- fixed.ages

sum(is.na(df.train$Age))

df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
head(df.train)

df.train[c("Survived", "Pclass", "Parch", "SibSp")] <- lapply(df.train[c("Survived", "Pclass", "Parch", "SibSp")], factor)

log.model <- glm(Survived ~ . , family = binomial(link = "logit"), data = df.train)
summary(log.model)

set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio = 0.7)
final.train <- subset(df.train, split == T)
final.test <- subset(df.train, split == F)

final.log.model <- glm(Survived ~ . , family = binomial(link = "logit"), data = final.train)
summary(final.log.model)

fitted.probabilities <- predict(final.log.model, final.test, type = "response")
fitted.results <- ifelse(fitted.probabilities > 0.5, 1, 0)

misClassError <- mean(fitted.results != final.test$Survived)
print(1 - misClassError)

table(final.test$Survived, fitted.probabilities > 0.5)
