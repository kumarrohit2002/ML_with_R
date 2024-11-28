# Load the dataset
concrete <- read.csv('Concrete_Data.csv')
View(concrete)

# Check the structure of the dataset
str(concrete)

# Histogram to visualize the distribution of the target variable 'strength'
hist(concrete$strength)

# Normalize function
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Apply normalization to the entire dataset
concrete_norm <- as.data.frame(lapply(concrete, normalize))
View(concrete_norm)

# Summary of the normalized strength variable
summary(concrete_norm$strength)

# Summary of the original strength variable
summary(concrete$strength)

# Split the dataset into training and test sets
concrete_train <- concrete_norm[1:773, ]
concrete_test <- concrete_norm[774:1030, ]

# Install and load the neuralnet package
install.packages("neuralnet")
library(neuralnet)

# Model 1: Train a neural network with a single hidden node
concrete_model <- neuralnet(strength ~ cement + slag + ash + water + superplasticizer +
                              coarseagg + fineagg + age, data = concrete_train)

# Plot the trained model
plot(concrete_model)

# Test the model
model_results <- compute(concrete_model, concrete_test[1:8])

# Predicted strength values
predicted_strength <- model_results$net.result

# Correlation between predicted and actual strength values
cor(predicted_strength, concrete_test$strength)

# Model 2: Train a neural network with 5 hidden nodes
concrete_model2 <- neuralnet(strength ~ cement + slag + ash + water + superplasticizer +
                               coarseagg + fineagg + age, data = concrete_train, hidden = 5)

# Plot the second model
plot(concrete_model2)

# Test the second model
model_results2 <- compute(concrete_model2, concrete_test[1:8])

# Predicted strength values for the second model
predicted_strength2 <- model_results2$net.result

# Correlation between predicted and actual strength values for the second model
cor(predicted_strength2, concrete_test$strength)
