goog <- c(450,451,452,445,468)
msft <- c(230,231,231,233,220)

stocks <- c(goog,msft)
stocks

stock.matrix <- matrix(stocks, byrow = T, nrow = 2)
stock.matrix

days <- c("Mon","Tue","Wed","Thu","Fri")
stock.names <- c("GOOG","MSFT")

colnames(stock.matrix) <- days
rownames(stock.matrix) <- stock.names

stock.matrix

colSums(stock.matrix)
rowSums(stock.matrix)

colMeans(stock.matrix)
rowMeans(stock.matrix)

FB <- c(111,112,113,120,145)
tech.stocks <- rbind(stock.matrix, FB)
tech.stocks

avg <- rowMeans(tech.stocks)
avg

tech.stocks <- cbind(tech.stocks,avg)
tech.stocks
