
#_01_12201517__k22AU_ROHIT_KUMAR


# Q2 .consider the wine dataset solve the following:
 #a. Write the R code to detect and remove rows where the pH column has values outside the range O to 14.
wine<-read.csv('WineDataset CA1.csv');
View(wine)
library(dplyr)

#wine_filtered <- wine %>% filter(pH >= 0 & pH <= 14)
#View(wine_filtered)
#summary : Detect and remove rows where pH values are outside the range 0 to 14:
#         The R code uses the filter() function to remove any rows in the dataset where the pH column has values outside the valid range of 0 to 14.


# b. Write the R code to standardize the WineType column so that all values are lowercase.
wine$Type <- tolower(wine$Type)
View(wine)

# summary: Standardize the WineType column to lowercase: The R code converts all values in the
#            WineType column to lowercase using tolower(), ensuring consistent formatting in the dataset.

#c. Write the R code to check if the WineDataset contains any missing values
miss<-sum(is.na(wine))

if (miss > 0) {
  print("Yes,data contains missing value")
} else {
  print("No,data not contain any missing value")
}

# summary: Check if the Wine dataset contains any missing values: This code checks for missing values 
#          using is.na(). If any missing values are found, it prints a message saying the dataset contains missing values; otherwise, it prints that no missing values exist.


#3. Apply KNN on inbuilt dataset 'diamonds'. Consider 90% of the data as a training data and rest
#of the data as testing data.

data(diamonds)
str(diamonds)

diamonds_subset <- diamonds[, c("carat", "depth", "table", "price", "x", "y", "z", "cut")]

diamonds_subset$cut <- as.factor(diamonds_subset$cut)

set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(diamonds_subset$cut, p = 0.9, list = FALSE)
trainData <- diamonds_subset[trainIndex, ]
testData <- diamonds_subset[-trainIndex, ]
library(ggplot2)
library(caret)
library(class)

preProcValues <- preProcess(trainData[, -8], method = c("center", "scale"))
trainData_normalized <- predict(preProcValues, trainData[, -8])
testData_normalized <- predict(preProcValues, testData[, -8])

knn_pred <- knn(train = trainData_normalized, test = testData_normalized, cl = trainData$cut, k = 5)

confusionMatrix(knn_pred, testData$cut)

#summary: The K-Nearest Neighbors (KNN) algorithm is applied to the diamonds dataset. The dataset is split into 90% training data 
#        and 10% testing data. After normalizing the data, the KNN algorithm predicts the diamond "cut" and evaluates the results using a confusion matrix.




# Q3: You are a data analyst at a retail company. The company has provided you with a dataset
#contaming sales information, and you are required to perform vuious SQL queries on this
#dataset using R- The dataset is stored in a CSV file named sales_data.csv. [use sqldf]

sales<-read.csv('sales_data.csv');
View(sales)

#a. Retrieve the total sales (totalAmount)for each product (productId), sorted in descending order oftotal sales.

library(sqldf)
total_product <- sqldf("SELECT ProductID, SUM(TotalAmount) AS TotalAmount
                                  FROM sales
                                  GROUP BY ProductID
                                  ORDER BY TotalAmount DESC")

View(total_product)

#summary: Retrieve total sales for each product (ProductID): Using the sqldf package, this SQL query retrieves the total sales amount 
#         ping by product ID, and sorts the results in descending order based on the total sales.



#b. Display the customer v.•here Cggbmgug&amount is greater than average
average <- sqldf("SELECT AVG(TotalAmount) AS avgAmount FROM sales")$avgAmount

above_average <- sqldf(paste("SELECT * FROM sales WHERE totalAmount > ", average))

View(above_average)

#Summary: Display customers where the total amount is greater than the average: This query calculates the average sales amount and then retrieves records where the total sales amount exceeds 
#the calculated average


#c. Display all details where productid is greater than and equal to 2004.

products <- sqldf("SELECT * FROM sales WHERE ProductID >= 2004")

View(products)

#summary :Display all details where ProductID is greater than or equal to 2004: The query selects and displays all rows from the dataset where the ProductID is greater than or equal to 2004, allowing 
#         the user to filter the data by specific product IDs.








