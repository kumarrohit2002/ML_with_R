# Load the dataset
dataSet <- read.csv('Salary.csv')

# Summarize the dataset
summary(dataSet)

# Load required libraries
library(caTools)
library(ggplot2)

# Set the seed for reproducibility
set.seed(123)

# Split the dataset into training and testing sets
split <- sample.split(dataSet$Salary, SplitRatio = 2/3)
training_set <- subset(dataSet, split == TRUE)
testing_set <- subset(dataSet, split == FALSE)

# Fit the linear regression model
regressor <- lm(formula = Salary ~ YearsExperience, data = training_set)
summary(regressor)

# Predict using the testing set
y_pred <- predict(regressor, newdata = testing_set)

y_pred
testing_set



# Plot for training set
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Plot for testing set
ggplot() +
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary), color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience (Testing Set)') +
  xlab('Years of Experience') +
  ylab('Salary')
