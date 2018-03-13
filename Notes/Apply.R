sample(x = 1:100, 3)

v <- c(1:5)

addrand <- function(x) {
  ran <- sample(1:100, 1)
  return(x + ran)
}

lapply(v, addrand)
sapply(v, addrand)

times2 <- function(num) {
  return(num*2)
}

result <- sapply(v, times2)
print(result)

v <- 1:5

result <- sapply(v, function(num){num*3})
print(result)

add_choice <- function(num,choice) {
  return(num + choice)
}

print(add_choice(2,10))

sapply(v, add_choice, choice = 100)
