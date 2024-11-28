
iris1= iris
iris1$species=NULL

iris1

d= dist(iris1, method = "euclidean")

hfit = hclust(d)
plot(hfit)

grps = cutree(hfit, k=4)

grps
rect.hclust(hfit, k=4 , border = "red");
