
install.packages('e1071')
install.packages('caret')
install.packages('titanic')


library(e1071)
library(caret)
library(dplyr)
library(titanic)

# Step 1: Load Titanic dataset
data("titanic_train")  

View(titanic_train)

# Step 2: Data Preprocessing
# Select relevant columns
titanic <- titanic_train %>%
  select(Pclass, Sex, Age, SibSp, Parch, Fare, Embarked, Survived)

# Handle missing values in 'Age' by replacing with the mean
titanic$Age[is.na(titanic$Age)] <- mean(titanic$Age, na.rm = TRUE)

# Define a custom Mode function to calculate the most frequent value
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Handle missing values in 'Embarked' by replacing with the mode
titanic$Embarked[is.na(titanic$Embarked)] <- Mode(titanic$Embarked)

# Convert categorical variables to factors
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
titanic$Survived <- as.factor(titanic$Survived)

# Step 3: Split the data into training and testing sets
set.seed(42)  # For reproducibility
trainIndex <- createDataPartition(titanic$Survived, p = 0.7, list = FALSE)
trainData <- titanic[trainIndex, ]
testData <- titanic[-trainIndex, ]

# Step 4: Train the Naive Bayes classifier
model <- naiveBayes(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = trainData)

# Step 5: Make predictions
predictions <- predict(model, testData)

# Step 6: Evaluate the model using a confusion matrix
conf_matrix <- confusionMatrix(predictions, testData$Survived)

print(conf_matrix)
