# install.packages("rpart")
# install.packages("rpart.plot")
# install.packages("randomForest")

library(rpart)
library(rpart.plot)
library(randomForest)

str(kyphosis) 
head(kyphosis)

tree <- rpart(Kyphosis ~ . , method = "class", data = kyphosis)
printcp(tree)

plot(tree, uniform = T, main = "Kyphosis Tree")
text(tree, use.n = T, all = T)

prp(tree)

rf.model <- randomForest(Kyphosis ~ . , data = kyphosis)
print(rf.model)
