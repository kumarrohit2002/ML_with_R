#step 1: install and load necessary libraries
install.packages("rpart");
install.packages("rpart.plot")

library(rpart);
library(rpart.plot)

#step 2: Load the Iris dataset

data(iris)
str(iris)


#step 3: split the data into training and test sets

set.seed(42) #setting seed for reprocibility
indexs=sample(1:nrow(iris), 0.7 * nrow(iris)) # Reandomly select 70% of the data
iris_train[-indexs,]  #train data 70%
View(iris_train)


iris_test=iris[indexs,] #test data 30%

#step 4: Define the target formula and train the decision tree
target=Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
#tree rpart(target,data =iris_train ,method="class" , control=rpart.control(minsplit=4))

tree = rpart(target, data=iris_train,method = "class")


#setp 5: visualize the decision tree

rpart.plot(tree);

# step 6: make predictions on the test set


predictions=predict(tree,iris_test, type="class")


#step 7: evaluation the model by creating s confusion matrix

confusion_matrix=table(iris_test$Species , predictions)
print(confusion_matrix)


#step 8: calculate accuracy
accuracy = sum(diag(confusion_matrix))/sum(confusion_matrix)
print(paste("Accuracy: ", round(accuracy, 4)))










  
  
  
  
  
  
  
  
  
  
  

