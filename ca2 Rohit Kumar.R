Q2: In order to determine whether a patient has prostate cancer based on a number of risk
variables, a hospital is using data from patients who exhibit disease symptoms. Apply decision tree
to determine if a patient has cancer using the Prostate cancer dataset. Sort the data into
training and test sets, normalise it, and then determine the accuracy of the model?
  
  

install.packages("rpart")
install.packages("caret")
install.packages("dplyr")
install.packages("rpart.plot")


library(rpart)
library(caret)
library(dplyr)
library(rpart.plot)
getwd();

data <- read.csv("Prostate_cancer.csv")


str(data)


data$diagnosis_result <- as.factor(data$diagnosis_result) 

set.seed(123)
trainIndex <- createDataPartition(data$diagnosis_result, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]


tree_model <- rpart(diagnosis_result ~ . - id, 
                    data = trainData, 
                    method = "class", 
                    control = rpart.control(minsplit = 20, cp = 0.01))


rpart.plot(tree_model)

tree_predictions <- predict(tree_model, testData, type = "class")

confusionMatrix(tree_predictions, testData$diagnosis_result)


  
  
Q3: How can we predict the quality of wine based on its chemical properties using Naive
Bayes?
  

install.packages("e1071")
install.packages("caret")
install.packages("dplyr")


library(e1071)
library(caret)
library(dplyr)


data <- read.csv("WineQT.csv")

str(data)


data$quality <- as.factor(data$quality)

set.seed(123)
trainIndex <- createDataPartition(data$quality, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]


nb_model <- naiveBayes(quality ~ . - Id, data = trainData)  

nb_predictions <- predict(nb_model, testData)

confusionMatrix(nb_predictions, testData$quality)

  
  
  