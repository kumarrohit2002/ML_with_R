getwd()
insurance <- read.csv("insurance.csv",stringsAsFactors =FALSE );
str(insurance)

summary(insurance$charges);

hist(insurance$charges);

table(insurance$region)

cor(insurance[c("age","bmi","children","charges")])


pairs(insurance[c("age","bmi","children","charges")])

install.packages("psych")

library(psych)


pairs.panels(insurance[c("age","bmi","children","charges")])

ins_model <- lm(charges ~ age+children + bmi +sex +smoker + region, data = insursnce)

ins_model


summary(ins_model)








