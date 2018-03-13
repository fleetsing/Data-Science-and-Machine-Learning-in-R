hot <- FALSE
temp <- 100

if (temp > 80) {
  # Execute if condition == TRUE
  hot <- TRUE
} 

print(hot)


temp <- 30

if (temp > 80) {
  print("Hot outside.")

} else if (temp <= 80 & temp >= 50) {
  print("Nice outside.")

} else {
  print("Cold outside.")
  
}


ham <- 5
cheese <- 5
report <- "blank"

if (ham >= 10 & cheese >= 10) {
  report <- "Strong sales of both ham and cheese"
  
} else if (ham == 0 & cheese == 0) {
  report <- "No sales today"
  
} else {
  report <- "We sold something today"
  
}

print(report)

