
# Conditional Statements Exercises

# Write a script that will print "Even Number" if the variable x is an even number, otherwise print "Not Even".
x <- 3

if (x %% 2 == 0) {
  print( "Even Number" )
} else {
  print( "Not Even" )
}

# Write a script that will print 'Is a Matrix' if the variable x is a matrix, otherwise print "Not a Matrix".
x <- matrix()

if ( is.matrix(x) == TRUE ) {
  print( "Is a Matrix" )
} else {
  print( "Not a Matrix")
}

# Create a script that given a numeric vector x with a length 3, will print out the elements in order from high to low.
x <- c(3,7,1)

if ( length(x) == 3 ) {
  y <- c(0, 0, 0)
  
  if ( (x[1] >= x[2]) & (x[1] >= x[3]) ) {
    y[1] <- x[1]
  } else if ( (x[2] >= x[1]) & (x[2] >= x[3]) ) {
    y[1] <- x[2]
  } else {
    y[1] <- x[3]
    
  }
  
  if ( ((x[1] < x[2]) & (x[1] >= x[3])) | ((x[1] < x[3]) & (x[1] >= x[2])) ) {
    y[2] <- x[1]
  } else if ( ((x[2] < x[1]) & (x[2] >= x[3])) | ((x[2] < x[3]) & (x[2] >= x[1])) ) {
    y[2] <- x[2]
  } else {
    y[2] <- x[3]
  }
  
  if ( (x[1] < x[2]) & (x[1] < x[3]) ) {
    y[3] <- x[1]
  } else if ( (x[2] < x[1]) & (x[2] < x[3]) ) {
    y[3] <- x[2]
  } else {
    y[3] <- x[3]
  }
  
  x <- y
  print(x)
  
} else {
  print("Vector length not 3")
}

# Write a script that uses if,else if, and else statements to print the max element in a numeric vector with 3 elements.
x <- c(20,10,1)

if (length(x) != 3) {
  print("Vector length not 3")
} else if ( (x[1] >= x[2]) & (x[1] >= x[3]) ) {
  print(x[1])
} else if ( (x[2] >= x[1]) & (x[2] >= x[3]) ) {
  print(x[2])
} else {
  print(x[3])
}

