
v <- c(1,2,3)
m <- matrix(1:10, nrow = 2)
df <- mtcars

class(v)
class(m)
class(df)

my.list <- list(v, m, df)
my.list
class(my.list)

my.named.list <- list(sample_vec = v, sample_mat = m, sample_df = df)
my.named.list

my.named.list[1]
class(my.named.list[1])
my.named.list["sample_vec"]
class(my.named.list["sample_vec"])

my.named.list$sample_vec
class(my.named.list$sample_vec)
my.named.list[["sample_vec"]]
class(my.named.list[["sample_vec"]])
my.named.list[[1]]
class(my.named.list[[1]])

double.list <- c(my.named.list, my.named.list)
double.list
