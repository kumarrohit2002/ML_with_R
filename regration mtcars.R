
library(ggplot2)  # for chart


data(mtcars)

# Step 2: Fit a linear regression model
model <- lm(mpg ~ hp, data = mtcars)


summary(model)

# Step 3: Visualize the actual data points along with the regression line
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue", size = 3) +  # Plot actual data points
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add regression line
  labs(title = "Miles per Gallon vs Horsepower",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()
