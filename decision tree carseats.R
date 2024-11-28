
install.packages('ISLR')
install.packages('rpart')
install.packages('rpart.plot')
install.packages('caret')


library(ISLR)
library(rpart)
library(rpart.plot)
library(caret)

data(Carseats)

# Step 2: Create a binary variable for High sales (Sales > 8)
Carseats$High <- ifelse(Carseats$Sales > 8, "Yes", "No")
Carseats$High <- as.factor(Carseats$High)

# Step 3: Split the data into training and testing sets (70% training, 30% testing)
set.seed(42)  # For reproducibility
trainIndex <- createDataPartition(Carseats$High, p = 0.7, list = FALSE)
trainData <- Carseats[trainIndex, ]
testData <- Carseats[-trainIndex, ]

# Step 4: Train a decision tree model
tree_model <- rpart(High ~ . - Sales, data = trainData, method = "class")

# Plot the initial tree
rpart.plot(tree_model)

# Step 5: Prune the tree to 9 nodes using cross-validation
# Perform cross-validation to find the optimal complexity parameter (cp)
cv_tree <- printcp(tree_model)  # Displays cross-validation results

# Prune the tree to 9 nodes
# Find the complexity parameter (cp) that corresponds to the desired tree size
pruned_tree <- prune(tree_model, cp = tree_model$cptable[which.min(tree_model$cptable[,"nsplit"] >= 9), "CP"])

# Plot the pruned tree
rpart.plot(pruned_tree)

# Step 6: Evaluate the model on the test set
predictions <- predict(pruned_tree, testData, type = "class")

# Create a confusion matrix to evaluate the predictions
conf_matrix <- confusionMatrix(predictions, testData$High)

# Print the confusion matrix and evaluation metrics
print(conf_matrix)
