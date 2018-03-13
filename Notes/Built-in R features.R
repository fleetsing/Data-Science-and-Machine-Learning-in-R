seq(0, 10, by = 2)
seq(0, 100, by = 10)

v <- c(2,6,4,9,1)
sort(v)
sort(v, decreasing = FALSE)
sort(v, decreasing = TRUE)

cv <- c("a", "d", "B", "c")
sort(cv)

v <- 1:10
v
rev(v)

str(v)
str(mtcars)

summary(v)
summary(mtcars)

v1 <- 1:10
v2 <- 20:25
append(v1, v2)

v <- c(1:3)
is.array(v)
as.array(v)
