x <- 0

while (x < 10) {
  print(paste0("x is: ", x))
  
  x <- x + 1
  if (x == 5) {
    print("x is now equal to 5! Breaking loop.")
    break
  }
}
