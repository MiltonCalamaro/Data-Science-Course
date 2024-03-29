data<-res_limpio
data<-data.frame(data$precio,
                 data$opiniones,
                 data$rating,
                 data$alto,
                 data$ancho,
                 data$profundidad)
colnames(data)<-c('precio','opiniones','rating',
                  'alto','ancho','profundidad')
View(data)
### escalado de la data
data<-scale(data)
###guardar la data
write.csv(data,file ='data.csv',row.names = FALSE)


mycluster<-kmeans(data,3, nstart = 5 , iter.max = 30)
mycluster
### para saber el numero de iteraciones que utilizo para la convergencia
mycluster$iter
#### para medir las distancias de error
### para cada cluster cual es la distancia media
### cuanta mas peque�os sean los valores mas cercanos se encuentran las varaiables
mycluster$withinss

wss<-(nrow(data)-1)*sum(apply(data,2,var))

for (i in 2:20) wss[i]<-sum(kmeans(data,centers = i)$withinss)
plot(1:20,wss,type='b',xlab = 'Numero de clusters',
                        ylab = 'Whitinss groups')


mycluster<-kmeans(data,8, nstart = 5 , iter.max = 30)
mycluster

library(fmsb)
par(mfrow=c(2,4))
dat<-as.data.frame(t(mycluster$centers[1,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[2,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[3,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[4,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[5,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[6,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[7,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[8,]))
dat<-rbind(rep(5,6),rep(-1.5,6),dat)
radarchart(dat)






