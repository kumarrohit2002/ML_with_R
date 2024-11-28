
newdf <- read.csv('EmployData.csv',header = TRUE)
head(newdf)

summary(newdf)

newdf$Age[is.na(newdf$Age)] <- mean(newdf$Age, na.rm=TRUE)  #remove null value
newdf$Salary[is.na(newdf$Salary)] <- mean(newdf$Salary, na.rm=TRUE) #remove null value



newdf$Country <- factor(newdf$Country ,levels = c('France','Spain','Germany'), labels=c(1,2,3))
newdf$Purchased <- factor(newdf$Purchased ,levels = c('Yes','No'), labels=c(1,0))

newdf


#install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(newdf$Purchased ,SplitRatio = 0.8)

training_set = subset(newdf,split==TRUE)
testing_set = subset(newdf,split==FALSE)

View(tringing_set)
View(testing_set)


training_set[ ,2:3]= scale(training_set[ ,2:3])  # for majer one scale
testing_set[ ,2:3]= scale(testing_set[ ,2:3])

training_set

