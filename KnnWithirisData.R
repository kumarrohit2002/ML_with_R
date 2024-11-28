
#View(ir)
#for randomize data
ir <- ir[sample(1:nrow(ir)),];
View(ir)
table(ir$Species)

summary(ir[c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')]);

ir_train <- ir[1:90,-5 ]
ir_test <- ir[91:150, -5]
ir_train_lables <- ir[1:90, 'Species']
ir_test_lables <- ir[91:150, 'Species']

library(class);

ir_test_pred <- knn(train = ir_train, test = ir_test , cl=ir_train_lables, k=21)  #error

library(gmodels);

CrossTable(x=ir_test_lables,y=ir_test_pred,proc.chisq=FALSE);

aa <- table(ir_test_lables, ir_test_pred);

#install.packages('caret')
library(caret);

confusionMatrix(aa)


