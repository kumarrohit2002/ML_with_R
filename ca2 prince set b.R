
install.packages("rpart")
install.packages("caret")
install.packages("dplyr")
install.packages("rpart.plot")


library(rpart)
library(caret)
library(dplyr)
library(rpart.plot)


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








#Q 3


install.packages("titanic")  
install.packages("e1071")   
install.packages("caret")    
install.packages("dplyr")    

library(titanic)
library(e1071)
library(caret)
library(dplyr)


data <- titanic_train  

str(data)


data <- data %>% select(Survived, Pclass, Sex, Age) %>% na.omit()

data$Survived <- as.factor(data$Survived)
data$Sex <- as.factor(data$Sex)


set.seed(123)
trainIndex <- createDataPartition(data$Survived, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]


nb_model <- naiveBayes(Survived ~ Pclass + Sex + Age, data = trainData)


nb_predictions <- predict(nb_model, testData)


confusionMatrix(nb_predictions, testData$Survived)





