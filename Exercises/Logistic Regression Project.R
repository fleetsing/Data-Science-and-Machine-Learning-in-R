
# Logistic Regression Project

library(plyr)
library(dplyr)
library(Amelia)
library(ggplot2)
library(caTools)

# Read in the adult_sal.csv file and set it to a data frame called adult.
adult <- read.csv("~/Documents/University/Udemy Data Science and Machine Learning R/Course Notes/Training Exercises/Machine Learning Projects/CSV files for ML Projects/adult_sal.csv")
head(adult)
str(adult)

# Drop the index column.
adult <- select(adult, -X)

# Check the head, str and summary of the data.
head(adult)
str(adult)
summary(adult)

# Use table() to check out the frequency of the type_employer column.
table(adult$type_employer)

# Combine the two smallest groups into a single group called "Unemployed".
adult$type_employer <- revalue(adult$type_employer, c("Never-worked" = "Unemployed", "Without-pay" = "Unemployed"))
table(adult$type_employer)

# Combine State and Local gov jobs into a category called SL-gov.
adult$type_employer <- revalue(adult$type_employer, c("State-gov" = "SL-gov", "Local-gov" = "SL-gov"))
table(adult$type_employer)

# Combine self-employed jobs into a category called Self-emp.
adult$type_employer <- revalue(adult$type_employer, c("Self-emp-inc" = "Self-emp", "Self-emp-not-inc" = "Self-emp"))
table(adult$type_employer)

# Use table() to look at the marital column.
table(adult$marital)

# Reduce this to three groups: Married, Not-Married, Never-Married.
adult$marital <- revalue(adult$marital, c("Divorced" = "Not-Married", "Widowed"= "Not-Married", "Separated"= "Not-Married"))
adult$marital <- revalue(adult$marital, c("Married-AF-spouse" = "Married", "Married-civ-spouse"= "Married", "Married-spouse-absent"= "Married"))
table(adult$marital)

# Check the country column using table().
table(adult$country)
levels(adult$country)

# Group these countries together by continents.
change.continent <- function(country) {
  
  out <- as.character(country)
  
  asia <- c("Cambodia", "China", "Hong", "India", "Iran", "Japan", "Laos", "Philippines", "Taiwan", "Thailand", "Vietnam")
  
  europe <- c("England", "France", "Germany", "Greece", "Holand-Netherlands", "Hungary", "Ireland","Italy", "Poland", 
              "Portugal", "Scotland", "Yugoslavia")
  
  central.and.south.america <- c("Columbia", "Cuba", "Dominican-Republic", "Ecuador", "El-Salvador", "Guatemala", "Haiti", 
                                 "Honduras", "Jamaica", "Nicaragua", "Peru", "Trinidad&Tobago")
  
  north.america <- c("Canada", "Mexico", "Outlying-US(Guam-USVI-etc)", "Puerto-Rico", "United-States")
  
  for (i in 1:length(country)) {
    
    if (country[i] %in% asia) {
      out[i] <- "Asia"
      
    } else if (country[i] %in% europe) {
      out[i] <- "Europe"
      
    } else if (country[i] %in% central.and.south.america) {
      out[i] <- "Central.and.South.America"
      
    } else if (country[i] %in% north.america) {
      out[i] <- "North.America"
      
    } else {
      out[i] <- "Other"
      
    }
  }
  return(factor(out))
  
}

adult$country <- change.continent(adult$country)

# Convert any cell with a '?' or a ' ?' value to a NA value.
turn.into.na <- function(df) {
  
  out <- df
  
  for (i in 1:ncol(df)) {
    if (is.factor(df[,i])) {
      
      out[,i] <- recode_factor(df[,i], "?" = NA_character_, " ?" = NA_character_)
      
    }
    
  }
  return(out)
  
}

adult <- turn.into.na(adult)

# Play around with the missmap function from the Amelia package.
missmap(adult, main = "Missing map", col = c("yellow", "black"), legend = F)
missmap(adult, y.at=c(1), y.labels = c(''), col=c('yellow', 'black'), legend = F)

# Use na.omit() to omit NA data from the adult data frame.
adult <- na.omit(adult)

# Use missmap() to check that all the NA values were in fact dropped.
missmap(adult, y.at=c(1), y.labels = c(''), col=c('yellow', 'black'), legend = F)

# Use ggplot2 to create a histogram of ages, colored by income.
pl <- ggplot(adult, aes(x = age)) + geom_histogram(aes(fill = adult$income), color = "black", alpha = 0.9, binwidth = 1) + theme_bw()
print(pl)

# Plot a histogram of hours worked per week.
pl <- ggplot(adult, aes(x = hr_per_week)) + geom_histogram(fill = "blue", color = "black", alpha = 0.9, binwidth = 1) + theme_bw()
print(pl)

# Rename the country column to region column to better reflect the factor levels.
colnames(adult)
colnames(adult)[colnames(adult) == "country"] <- "region"
colnames(adult)

# Create a barplot of region with the fill color defined by income class.
pl <- ggplot(adult, aes(x = region)) + geom_bar(aes(fill = adult$income), color = "black") + theme_bw() + theme(axis.text.x=element_text(angle=90,hjust=1))
print(pl)

# Split the data into a train and test set using the caTools library.
split <- sample.split(adult$income, SplitRatio = 0.7)
train <- subset(adult, split == T)
test <- subset(adult, split == F)

# Use all the features to train a glm() model on the training data set.
log.model <- glm(income ~ . , family = binomial(link = "logit"), data = train)
summary(log.model)

# Use new.model <- step(your.model.name) to use the step() function to create a new model.
new.model <- step(log.model)
print(summary(log.model))
print(summary(new.model))

# Create a confusion matrix using the predict function with type='response'.
fitted.probabilities <- predict(new.model, test, type = "response")
fitted.results <- ifelse(fitted.probabilities > 0.5, 1, 0)

misClassError <- mean(fitted.results != test$income)
print(1 - misClassError)

missTable <- table(test$income, fitted.probabilities > 0.5)

# Calculate the accuracy of the model.
acc <- (missTable[1,1] + missTable[2,2]) / sum(missTable)
print(acc)

# Calculate the recall of the model (true positives / (true positives + false negatives)).
print(6405 / (6405 + 515))

# Calculate the precision of the model (true postitives / (true positives + false positives)).
print(6405 / (6405 + 912))
