
# MoneyBall project

library(dplyr)
library(ggplot2)
library(plotly)

# Use R to open the Batting.csv file and assign it to a dataframe called batting.
batting <- read.csv("/Users/jarnz/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Training Exercises/Capstone and Data Viz Projects/Capstone Project/Batting.csv")

# Use head() to check out the batting.
head(batting)

# Use str() to check the structure.
str(batting)

# Call the head() of the first five rows of AB (At Bats) column.
head(batting$AB)

# Call the head of the doubles (X2B) column.
head(batting$X2B)

# Create a new column called BA and add it to the data frame.
batting$BA <- batting$H / batting$AB
head(batting)

# Check the last 5 entries of the BA column.
tail(batting$BA,5)

# Create a new column called OBP and add it to the data frame.
batting$OBP <- (batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)
head(batting)

# Check the last 5 entries of the OBP column.
tail(batting$OBP, 5)

# Create a new column called X1B and add it to the data frame.
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
head(batting)

# Check the last 5 entries of the X1B column.
tail(batting$X1B)

# Create a new column called SLG and add it to the data frame.
batting$SLG <- ((batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4* batting$HR)) / batting$AB
head(batting)

# Check the last 5 entries of the SLG column.
tail(batting$SLG, 5)

# Check the structure of the data frame.
str(batting)

# Load the Salaries.csv file into a dataframe called sal.
sal <- read.csv("/Users/jarnz/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Training Exercises/Capstone and Data Viz Projects/Capstone Project/Salaries.csv")

# Use head() to check out the salaries.
head(sal)

# Use summary to get the summaries of the batting and the sal data frames.
summary(batting)
summary(sal)

# Use subset() to reassign batting to only contain data from 1985 and onwards.
batting <- subset(batting, yearID >= 1985)
summary(batting)

# Use the merge() function to merge the batting and sal data frames by c('playerID','yearID').
combo <- merge(batting, sal, by = c("playerID", "yearID"))

# Use summary to check the data.
summary(combo)

# Get a data frame called lost_players from the combo data frame.
print("giambja01" %in% combo$playerID)
print("damonjo01" %in% combo$playerID)
print("saenzol01" %in% combo$playerID)

lost_players <- subset(combo, combo$playerID %in% c("giambja01", "damonjo01", "saenzol01"))
lost_players <- droplevels(lost_players)

# Use subset again to only grab the rows where the yearID was 2001.
lost_players2001 <- subset(lost_players, lost_players$yearID == 2001)
lost_players2001 <- droplevels(lost_players2001)

# Reduce the lost_players data frame to the following columns: playerID, H, X2B, X3B, HR, OBP, SLG, BA, AB.
lost_players2001 <- subset(lost_players2001, select = c(playerID, H, X2B, X3B, HR, OBP, SLG, BA, AB))

# Find replacement players for the lost players.
combo2001 <- subset(combo, combo$yearID == 2001)

combo2001cheap <- subset(combo2001, salary < 5000000)

AB_avg <- mean(lost_players2001$AB, na.rm = TRUE)
OBP_avg <- mean(lost_players2001$OBP, na.rm = TRUE)

combo2001cheaptalent <- subset(combo2001cheap, AB > AB_avg & OBP > OBP_avg)

pl <- ggplot(combo2001cheaptalent, aes(x = AB, y = OBP, color = salary)) + geom_point() + geom_smooth()
gpl <- ggplotly(pl)
print(gpl)

options <- head(arrange(combo2001cheaptalent, desc(OBP)), 10)
print(options[,c("playerID", "OBP", "AB", "salary")])
