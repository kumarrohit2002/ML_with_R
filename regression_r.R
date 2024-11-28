# Create a vector 'x' containing values from 1 to 5
x <- c(1, 2, 3, 4, 5)

# Create a vector 'y' containing some arbitrary values
y <- c(3, 4, 2, 4, 5)

# Fit a linear regression model with 'y' as the response variable and 'x' as the predictor
model <- lm(y ~ x)

# Summarize the linear model to obtain statistical details
summary(model)

# Extract the R-squared value from the model summary
r_squared <- summary(model)$r.squared

# Print the R-squared value, rounded to 4 decimal places
print(paste("R-squared: ", round(r_squared, 4)))

# Create a scatter plot of 'x' vs 'y'
plot(x, y,
     main = "Linear Regression",    # Title of the plot
     xlab = "x",                    # Label for the x-axis
     ylab = "y",                    # Label for the y-axis
     pch = 19,                      # Type of point to plot (solid circle)
     col = "blue")                  # Color of the points

# Add the regression line to the plot in red
abline(model, col = "red")
