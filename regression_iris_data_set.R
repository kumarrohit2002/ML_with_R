
View(iris)

data(iris)

# Perform linear regression
model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)

# Summary of the model
summary(model)

# Predict values
predictions <- predict(model, iris)

# Print the first few predictions
head(predictions)

# Plot the actual vs predicted values
plot(iris$Sepal.Length, predictions,
     main = "Actual vs Predicted Sepal Length",
     xlab = "Actual Sepal Length",
     ylab = "Predicted Sepal Length",
     pch = 19,
     col = "blue")


abline(0, 1, col = "red") # Add a diagonal line for reference
