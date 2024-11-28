print(getwd())

input<-read.delim("textmining.txt")
print(input)

library("tm")
library("wordcloud")
library("RColorBrewer")
library("SnowballC")

#file.choose()  -> open the new tab you have to select on file

imp<-readLines(file.choose())
imp




out<-Corpus(VectorSource(imp))

out


tospace<- content_transformer(function(x,pattern)gsub(pattern," ",x))

out<-tm_map(out,tospace,"/")
out<-tm_map(out,tospace,"@")
out<-tm_map(out,tospace,"\\/")

#

