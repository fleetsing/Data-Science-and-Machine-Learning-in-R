
# Dplyr Exercises

library(dplyr)

# Return rows of cars that have an mpg value greater than 20 and 6 cylinders.
result <- filter(mtcars, mpg > 20 & cyl == 6)
result <- mtcars %>% filter(mpg > 20 & cyl == 6)
print(result)

# Reorder the Data Frame by cyl first, then by descending wt.
result <- arrange(mtcars, cyl, desc(wt))
result <- mtcars %>% arrange(cyl, desc(wt))
print(result)

# Select the columns mpg and hp.
result <- select(mtcars, mpg, hp)
result <- mtcars %>% select(mpg, hp)
print(result)

# Select the distinct values of the gear column.
result <- distinct(select(mtcars, gear))
result <- mtcars %>% select(gear) %>% distinct()
print(result)

# Create a new column called "Performance" which is calculated by hp divided by wt.
result <- mutate(mtcars, Performance = hp / wt)
result <- mtcars %>% mutate(Performance = hp / wt)
print(result)

# Find the mean mpg value using dplyr.
result <- summarise(mtcars, mpg_mean = mean(mpg))
result <- mtcars %>% summarise(mpg_mean = mean(mpg))
print(result)

# Use pipe operators to get the mean hp value for cars with 6 cylinders.
result <- mtcars %>% filter(cyl == 6) %>% summarise(hp_mean = mean(hp))
print(result)
