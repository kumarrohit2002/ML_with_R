install.packages('arules');

library(arules)

data('Groceries')
summary(Groceries)

str(Groceries)

#look for first five items

inspect(Groceries[1:5])

itemFrequency(Groceries[ , 1:3])

itemFrequencyPlot(Groceries)
itemFrequencyPlot(Groceries , support= 0.1)
itemFrequencyPlot(Groceries , topN=20)

image(Groceries[1:5])
image(sample(Groceries , 100))

library(arules)


apriori(Groceries)

groceryrules <- apriori(Groceries , parameter = list(support = 0.006,
                                                     confidence= 0.25,
                                                     minlen = 2))

?apriori
groceryrules

inspect(groceryrules[1:3])
inspect(groceryrules[1:10], lift = 0.5)
inspect(sort(groceryrules , by = "lift")[1:5])


berryrules <- subset(groceryrules , items %in% "berries")
inspect( berryrules)

sodarules <- subset(groceryrules ,rhs %pin% "soda")
inspect(sodarules)

top.soda.rules<- head(sort(sodarules ,  by= "lift"), 5)
inspect(top.soda.rules)

write(groceryrules ,file="groceryrules.csv" ,sep = ',',
      quote =TRUE , row.names=FALSE)


getwd()
groceryrules_df <- as(groceryrules, 'data.frame')

str(groceryrules_df)



















