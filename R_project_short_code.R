library(readr)
library(dplyr)
library(ggplot2)
library(e1071)         # For SVM and Naive Bayes
library(xgboost)       # For XGBoost
library(rpart)         # For Decision Tree
library(randomForest)  # For Random Forest
library(DataExplorer)  # For EDA plots
library(viridis)       # For color scales
library(pROC)          # For ROC curves

# Load data
df <- read.csv('Maternal Health Risk Data Set.csv')

# Data overview
head(df)
summary(df)

# Check for missing values
colSums(is.na(df))

# Remove duplicates
df <- df[!duplicated(df), ]

# Convert 'RiskLevel' to a factor
df$RiskLevel <- factor(df$RiskLevel, levels = c("low risk", "mid risk", "high risk"))

# Exploratory Data Analysis (EDA)
plot_intro(df)
plot_histogram(df)
plot_bar(df %>% select(RiskLevel))
plot_correlation(df)

# Split data into train and test sets
library(caTools)
# Set seed for reproducibility
set.seed(123)
split <- sample.split(df$RiskLevel, SplitRatio = 0.7)

train <- subset(df, split == TRUE)  # Training set
test <- subset(df, split == FALSE)  # Test set


# Select numeric columns for feature scaling
X_train <- train %>% select_if(is.numeric)
X_test <- test %>% select_if(is.numeric)

# Scale features
scaler <- preProcess(X_train, method = c("center", "scale"))
X_train <- predict(scaler, X_train)
X_test <- predict(scaler, X_test)

# Initialize vectors to store results
accuracy <- c()

X_train
X_test


# --- SVM Model ---
svm_model <- svm(RiskLevel ~ ., data = train)
y_pred_svm <- predict(svm_model, test)
svm_cm <- confusionMatrix(y_pred_svm, test$RiskLevel)
accuracy["SVM"] <- svm_cm$overall["Accuracy"] * 100


# --- Decision Tree Model ---
dt_model <- rpart(RiskLevel ~ ., data = train)
y_pred_dt <- predict(dt_model, test, type = "class")
dt_cm <- confusionMatrix(y_pred_dt, test$RiskLevel)
accuracy["Decision Tree"] <- dt_cm$overall["Accuracy"] * 100


# --- Random Forest Model ---
rf_model <- randomForest(RiskLevel ~ ., data = train)
y_pred_rf <- predict(rf_model, test)
rf_cm <- confusionMatrix(y_pred_rf, test$RiskLevel)
accuracy["Random Forest"] <- rf_cm$overall["Accuracy"] * 100

# --- Naive Bayes Model ---
nb_model <- naiveBayes(RiskLevel ~ ., data = train)
y_pred_nb <- predict(nb_model, test)
nb_cm <- confusionMatrix(y_pred_nb, test$RiskLevel)
accuracy["Naive Bayes"] <- nb_cm$overall["Accuracy"] * 100


# --- XGBoost Model ---
xgb_model <- xgboost(data = as.matrix(X_train), 
                     label = as.numeric(train$RiskLevel) - 1, 
                     nrounds = 100, 
                     objective = "multi:softmax", 
                     num_class = 3, 
                     verbose = 0)

y_pred_xgb <- predict(xgb_model, as.matrix(X_test))
y_pred_xgb <- factor(y_pred_xgb, levels = 0:2, labels = levels(train$RiskLevel))
xgb_cm <- confusionMatrix(y_pred_xgb, test$RiskLevel)
accuracy["XGBoost"] <- xgb_cm$overall["Accuracy"] * 100


# Confusion Matrix Visualization
plot_confusion_matrix <- function(cm, title) {
  cm_table <- as.table(cm)
  cm_df <- as.data.frame(cm_table)
  names(cm_df) <- c("Actual", "Predicted", "Freq")
  
  ggplot(cm_df, aes(x = Predicted, y = Actual, fill = Freq)) +
    geom_tile() +
    geom_text(aes(label = Freq), color = "white") +
    scale_fill_viridis_c() +
    theme_minimal() +
    labs(title = title, x = "Predicted", y = "Actual")
}
# for all Algo

plot_confusion_matrix(svm_cm, "SVM Confusion Matrix")
plot_confusion_matrix(dt_cm, "Decision Tree Confusion Matrix")
plot_confusion_matrix(rf_cm, "Random Forest Confusion Matrix")
plot_confusion_matrix(nb_cm, "Naive Bayes Confusion Matrix")
plot_confusion_matrix(xgb_cm, "XGBoost Confusion Matrix")


# Bar Plot for Accuracy Comparison
bar_positions <- barplot(
  accuracy,
  names.arg = names(accuracy),
  col = viridis(5),
  main = "Model Comparison (Accuracy)",
  ylab = "Accuracy (%)",
  las = 2
)

text(
  x = bar_positions,
  y = accuracy + 2,
  labels = paste0(round(accuracy, 1), "%"),
  col = "red",
  cex = 0.9
)
