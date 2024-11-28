dataset= read.csv('social.csv');

str(dataset);
dataset= dataset[3:5];

View(dataset)


dataset$Purchased = factor(dataset$Purchased , levels = c(0, 1))

install.packages('caTools');
library(caTools);

set.seed(123);
split = sample.split(dataset$Purchased,  SplitRatio = 0.75);

traing_set = subset(dataset, split== TRUE);
test_set = subset(dataset, split== FALSE);

traing_set[-3] = scale(traing_set[-3]);

test_set[-3] = scale(test_set[-3]);

install.packages('e1071');
library(e1071)

classififier = svm(formula = Purchased ~ . , data=traing_set, type= 'C-classification',
                   kernel = 'linear');
y_pred = predict(classififier, newdata = test_set[-3]);

cm = table(test_set[ , 3] , y_pred);
cm








