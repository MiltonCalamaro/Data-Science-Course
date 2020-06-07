install.packages('plumber', dependencies = TRUE)
install.packages('later')
library(later)
install.packages('plumber')
library(plumber)
getwd()
###correr el servidor local
r<-plumb('C://Users/hamil/Desktop/Course Data Science/Plumber.R')
r$run(port=8000)

# data[1,]
# campos<-as.vector(data[1,])
# ## 8 porque son 8 cluster y 6, porque se tiene 6 variables
# midist<-matrix(0,ncol =8, nrow = 6)
# 
# for (i in 1:6){
#   c<-dist(x=c(campos[i],mycluster$centers[,i]))
#   b<-as.matrix(c)
#   distancia<-b[-1,1]
#   midist[i,]<-distancia
# }
# rownames(midist)<-colnames(mycluster$centers)
# dist_total<-apply(midist,2, sum)
# ## encontrar el cluster con la menor distancia al punto
# ## y asi encontrar el cluster optimo del dato
# cluster<-which.min(dist_total)

