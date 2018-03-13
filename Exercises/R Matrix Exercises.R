
# R Matrix Exercises

# Create 2 vectors A and B, where A is (1,2,3) and B is (4,5,6). With these vectors, use the cbind() or rbind() function to create a 2 by 3 matrix from the vectors. You'll need to figure out which of these binding functions is the correct choice.
A <- c(1,2,3)
B <- c(4,5,6)

AB <- rbind(A,B)
print(AB)

# Create a 3 by 3 matrix consisting of the numbers 1-9. Create this matrix using the shortcut 1:9 and by specifying the nrow argument in the matrix() function call. Assign this matrix to the variable mat.
mat <- matrix(1:9, byrow = T, nrow = 3)
print(mat)

# Confirm that mat is a matrix using is.matrix().
print(is.matrix(mat))

# Create a 5 by 5 matrix consisting of the numbers 1-25 and assign it to the variable mat2. The top row should be the numbers 1-5.
mat2 <- matrix(1:25, byrow = T, nrow = 5)
print(mat2)

# Using indexing notation, grab a sub-section of mat2 from the previous exercise.
print(mat2[2:3,2:3])
print(mat2[4:5,4:5])

# What is the sum of all the elements in mat2?
sum.mat2 <- sum(mat2)
print(sum.mat2)

# Use runif() to create a 4 by 5 matrix consisting of 20 random numbers (4*5=20).
random <- matrix(runif(20, min = 0, max = 20), byrow = T, nrow = 4)
print(random)
