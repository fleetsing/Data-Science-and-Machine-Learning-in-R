
# R Functions Exercises

# Create a function that will return the product of two integers.

prod <- function(integer1, integer2) {
  product <- integer1 * integer2
  
  return(product)
}

print(prod(3,4))

# Create a function that checks if a given integer is present in a given vector.

num_check <- function(integer1, vector1) {
  for (current in vector1) {
    if (current == integer1) {
      return(TRUE)
    }
  }
  return(FALSE)
}

print(num_check(2,c(1,2,3)))
print(num_check(2,c(1,4,5)))

# Create a function that returns the count of the number of occurences of a given number in a given vector.

num_count <- function(integer1, vector1) {
  count <- 0
  for (current in vector1) {
    if (current == integer1) {
      count = count + 1
    }
  }
  return(count)
}

print(num_count(2,c(1,1,2,2,3,3)))
print(num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3)))

# [All the things that the exercise says]

bar_count <- function(requested) {
  large_weight = 5
  
  small_count = requested %% large_weight
  large_count = (requested - small_count) / large_weight
  
  return(small_count + large_count)
}

print(bar_count(6))
print(bar_count(17))

# [All the things that the exercise says]

summer <- function(integer1, integer2, integer3) {
  integers <- c(integer1,integer2,integer3)
  summable <- vector()
  for (current in integers) {
    if (current%%3 != 0) {
      summable <- append(summable, current)
    }
  }
  return(sum(summable))
}

print(summer(7,2,3))
print(summer(3,6,9))
print(summer(9,11,12))

# Create a function that will return TRUE if an input integer is prime.

prime_check <- function(integer1) {
  i <- 5
  
  if (integer1 <= 1) {
    return(FALSE)
  } else if (integer1 <= 3) {
    return(TRUE)
  } else if (integer1 %% 2 == 0 | integer1 %% 3 == 0) {
    return(FALSE)
  }
  
  while (i * i <= integer1) {
    if (integer1 %% i == 0 | integer1 %% (i + 2) == 0) {
      return(FALSE)
    }
    
    i <- i + 6
  }
  
  return(TRUE)
}

print(prime_check(2))
print(prime_check(5))
print(prime_check(4))
print(prime_check(237))
print(prime_check(131))
