Sys.Date()

today <- Sys.Date()
class(today)

c <- "1990-01-01"
class(c)
my.date <- as.Date(c)
class(my.date)

as.Date("Nov-03-93")
my.date <- as.Date("Nov-03-93", format = "%b-%d-%y")
print(my.date)

help("strptime")
as.Date("June,1,2002", format = "%B,%e,%Y")

as.POSIXct("11:02:05", format = "%H:%M:%S")
strptime("11:02:03", format = "%H:%M:%S")
