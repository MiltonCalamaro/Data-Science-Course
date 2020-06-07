library(ggplot2)
head(diamonds)
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
dim(diamonds)
library(fmsb)
data<-diamonds[c(1:1),-(1:4)]
data<-rbind(rep(400,5),rep(0,5),data)
radarchart(data)
# https://www.r-graph-galerry.com