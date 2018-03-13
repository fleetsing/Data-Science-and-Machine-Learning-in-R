
days <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")
temp <- c(22.3,21,19,18.9,24,18.7,19.9)
rain <- c(F,F,T,T,F,T,F)

df <- data.frame(days,temp,rain)

str(df)
summary(df)

df[1,]
df[,1]

df[,"days"]
df$temp

df["days"]

subset(df, subset = rain == T)
subset(df, subset = days == "Mon")
subset(df, subset = temp > 20)

sorted.temp <- order(df["temp"])
sorted.temp
df[sorted.temp,]

df[7:1,]

empty <- data.frame()
c1 <- 1:10
c2 <- letters[1:10]

df <- data.frame(col.name.1 = c1, col.name.2 = c2)

write.csv(df, file = "saved_df.csv")
df2 <- read.csv(file = "saved_df.csv")
df2
df == df2[,2:3]

nrow(df)
ncol(df)
colnames(df)
rownames(df)

str(df)
summary(df)

df[[3,2]]
df[["3","col.name.2"]]

df[[2,"col.name.1"]] <- 9999
df

head(mtcars)

mtcars[1,]

mtcars$mpg
mtcars[,"mpg"]
mtcars[["mpg"]]

mtcars["mpg"]

df2 <- data.frame(col.name.1 = 2000, col.name.2 = "new")
df2

dfnew <- rbind(df, df2)
dfnew

df$newcol <- 2*df$col.name.1
df

df$newcol.copy <- df$newcol
df

df[,"newcol.copy2"] <- df$newcol
df

colnames(df)
colnames(df) <- c(1:5)
df

colnames(df)[1] <- "newname"
df

mtcars[ mtcars$mpg > 20 ,]

mtcars[ mtcars$mpg > 20 & mtcars$cyl > 4 ,]
subset(mtcars, mpg > 20 & cyl > 4)

mtcars[ mtcars$mpg > 20 & mtcars$cyl > 4 , c("mpg", "cyl", "hp")]
subset(mtcars, mpg > 20 & cyl > 4)[c("mpg", "cyl", "hp")]

head(mtcars[,c(1,2,3)])
head(mtcars[,c("mpg","cyl","disp")])

is.na(head(mtcars))
any(is.na(head(mtcars)))
any(is.na(head(mtcars$mpg)))

df[is.na(df)] <- 0
