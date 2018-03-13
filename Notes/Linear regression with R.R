# install.packages("corrgram")
# install.packages("corrplot")
# install.packages("caTools")

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)

df <- read.csv("~/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Machine Learning with R/student-mat.csv", sep = ";")
head(df)
summary(df)

any(is.na(df))
str(df)

num.cols <- sapply(df, is.numeric)
cor.data <- cor(df[, num.cols])
head(cor.data)

print(corrplot((cor.data), method = "color"))
corrgram(df)
corrgram(df, order = T, lower.panel = panel.shade, upper.panel = panel.pie, text.panel = panel.txt)

pl <- ggplot(df, aes(x = G3)) + geom_histogram(bins = 20, alpha = 0.5, fill = "blue")
print(pl)

set.seed(101)

sample <- sample.split(df$G3, SplitRatio = 0.7)
train <- subset(df, sample == T)
test <- subset(df, sample == F)

model <- lm(G3 ~ ., data = train)
print(summary(model))

res <- residuals(model)
class(res)
res <- as.data.frame(res)
head(res)

print(ggplot(res, aes(res)) + geom_histogram(fill = "blue", alpha = 0.7))
par(mfrow = c(2,2))
plot(model)

G3.predictions <- predict(model, test)
results <- cbind(G3.predictions, test$G3)
colnames(results) <- c("predicted", "actual")
results <- as.data.frame(results)

head(results)
min(results)

to_zero <- function(x) {
  if (x < 0) {
    return(0)
  } else {
    return(x)
  }
}

results$predicted <- sapply(results$predicted, to_zero)
min(results)

mse <- mean( (results$actual - results$predicted)^2 )
print(mse)
print(mse^0.5)

SSE <- sum( (results$predicted - results$actual)^2 )
print(SSE)

SST <- sum( (mean(df$G3) - results$actual)^2 )
print(SST)

R2 <- 1 - SSE/SST
print(R2)
