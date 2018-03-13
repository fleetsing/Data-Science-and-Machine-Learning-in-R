 v <- c(1,2,3,4,5)
 
 for (temp.var in v) {
   result <- temp.var + 1
   print(paste0("temp.var + 1 is equal to: ", result))
 }
 
 mat <- matrix(1:25, nrow=5)
 print(mat)
 
 for (row in 1:nrow(mat)) {
   for (col in 1:ncol(mat)) {
     print(paste("The element in row:", row, "and col:", col, "is", mat[row,col]))
   }
 }