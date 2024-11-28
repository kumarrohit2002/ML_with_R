install.packages("arules")

install.packages("cluser")

library(cluster)

iris_1 <- iris[ , -5];

set.seed(240);

kmeans.re <- kmeans(iris_1, centers = 3, nstart = 20);

kmeans.re

kmeans.re$cluster
kmeans.re$centers

cm <- table(iris$Species, kmeans.re$cluster)
cm


plot(iris_1[c("sepal.Length","sepal.width")], col = kmeans.re$cluster, main = "k-mean with 3 cluster");

kmeans.re$centers
kmeans.re$centers[ , c("sepal.Length", "sepal.width")]




