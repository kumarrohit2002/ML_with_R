
Set1
# Display hp and wt for cars with more than 6 cylinders
result_a <- mtcars[mtcars$cyl > 6, c("hp", "wt")]
print(result_a)


# Calculate the average mpg
avg_mpg <- mean(mtcars$mpg)
  
# Select cars where mpg is greater than the average mpg
result_b <- mtcars[mtcars$mpg > avg_mpg, ]
print(result_b)


#install.packages("sqldf")
library(sqldf)

result_c <- sqldf('
  SELECT gear, MAX(hp) AS max_hp
  FROM mtcars
  GROUP BY gear
')
print(result_c)

# Filter cars with wt < 3 and hp > 100, then select mpg, wt, and gear
result_d <- mtcars[mtcars$wt < 3 & mtcars$hp > 100, c("mpg", "wt", "gear")]
print(result_d)

# SQL query to calculate the total number of cars for each combination of cyl and gear
result_e <- sqldf('
  SELECT cyl, gear, COUNT(*) AS total_cars
  FROM mtcars
  GROUP BY cyl, gear
')
print(result_e)























# KNN

getwd();

wbcd<-read.csv('wisc_bc_data.csv',stringsAsFactors = FALSE);

str(wbcd)
wbcd<- wbcd[-1];

View(wbcd)

table(wbcd$diagnosis);

wbcd$diagnosis <- factor(wbcd$diagnosis,levels = c('B','M'),labels = c('Benign','Malignant'));

View(wbcd)

round(prop.table(table(wbcd$diagnosis))*100,digits = 1);

summary(wbcd[c('radius_mean','area_mean','smoothness_mean')]);

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))



summary(wbcd_n$area_mean);


wbcd_train <- wbcd_n[1:469, ]; 
wbcd_test <- wbcd_n[470:569, ];
wbcd_train_lables <- wbcd[1:469, 1];
wbcd_test_lables <- wbcd[470:569, 1];

#install.packages('class');
library(class);

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test , cl=wbcd_train_lables, k=21);


#install.packages('gmodels');
library(gmodels);

CrossTable(x=wbcd_test_lables ,y=wbcd_test_pred, proc.chisq=FALSE);

aa <- table(wbcd_test_lables, wbcd_test_pred);

#install.packages('caret')

library(caret);

confusionMatrix(aa)