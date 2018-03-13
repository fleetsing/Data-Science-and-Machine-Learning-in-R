# install.packages("tidyr")
# install.packages("data.table", type = "source",
#                  repos = "http://Rdatatable.github.io/data.table")
 
library(tidyr)
library(data.table)

comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998:2000,1998:2000,1998:2000)
q1 <- runif(9, min = 0, max = 100)
q2 <- runif(9, min = 0, max = 100)
q3 <- runif(9, min = 0, max = 100)
q4 <- runif(9, min = 0, max = 100)

df <- data.frame(comp = comp, year = yr, Qtr1 = q1, Qtr2 = q2, Qtr3 = q3, Qtr4 = q4)
print(df)

gather(df, Quarter, Revenue, Qtr1:Qtr4)
df %>% gather(Quarter, Revenue, Qtr1:Qtr4)

stocks <- data.frame(
  time = as.Date("2009-01-01") + 0:9,
  x = rnorm(10, 0, 1),
  y = rnorm(10, 0, 2),
  z = rnorm(10, 0, 4)
)
print(stocks)

stocks_gathered <- stocks %>% gather(stock, price, x:z)
print(stocks_gathered)

stocks_gathered %>% spread(stock, price)
spread(stocks_gathered, stock, price) == stocks

stocks_gathered %>% spread(time, price)

df <- data.frame(new_col = c(NA, "a.x", "b.y", "c.z"))
print(df)
df_sep <- separate(df, new_col, c("ABC", "XYZ"))
print(df_sep)

df <- data.frame(new_col = c(NA, "a-x", "b-y", "c-z"))
print(df)
df_sep <- separate(data = df, col = new_col, into = c("ABC", "XYZ"), sep = "-")
print(df_sep)

df_unite <- unite(df_sep, joined_col, ABC, XYZ, sep = ".")
print(df_unite)
