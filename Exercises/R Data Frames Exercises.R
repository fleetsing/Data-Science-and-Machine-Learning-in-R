
# R Data Frames Exercises

# Recreate the dataframe by creating vectors and using the data.frame function.
Name <- c("Sam", "Frank", "Amy")
Age <- c(22,25,26)
Weight <- c(150,165,120)
Sex <- c("M", "M", "F")
df <- data.frame(row.names = Name, Age, Weight, Sex)
print(df)

# Check if mtcars is a dataframe using is.data.frame().
print(is.data.frame(mtcars))

# Use as.data.frame() to convert a matrix into a dataframe.
mat <- matrix(1:25, byrow = T, nrow = 5)
print(as.data.frame(mat))

# Set the built-in data frame mtcars as a variable df.
df <- mtcars

# Display the first 6 rows of df.
print(head(df))
print(head(df,6))
print(df[1:6,])

# What is the average mpg value for all the cars?
print(mean(df$mpg))

# Select the rows where all cars have 6 cylinders (cyl column).
print(subset(df, cyl == 6))
print(df[df$cyl == 6,])

# Select the columns am,gear, and carb.
print(df[c("am", "gear", "carb")])

# Create a new column called performance, which is calculated by hp/wt.
df$performance <- df$hp / df$wt
print(df)

# Use round() to reduce this accuracy to only 2 decimal places.
df$performance <- round(df$performance, digits = 2)
print(df)

# What is the average mpg for cars that have more than 100 hp AND a wt value of more than 2.5?
print(mean(subset(df, hp > 100 & wt > 2.5)$mpg))

# What is the mpg of the Hornet Sportabout?
print(df["Hornet Sportabout",]$mpg)
