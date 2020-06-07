#* @param precio
#* @param opiniones
#* @param rating
#* @param alto
#* @param ancho
#* @param profundidad
#* @get /getCluster

function(precio,opiniones,rating,alto,ancho,profundidad){
  campos<-c(precio,opiniones,rating,alto,ancho,profundidad)
  ### 8 porque son 8 cluster y 6, porque se tiene 6 variables
  midist<-matrix(0,ncol =8, nrow = 6)
  
  for (i in 1:6){
    c<-dist(x=c(campos[i],mycluster$centers[,i]))
    b<-as.matrix(c)
    distancia<-b[-1,1]
    midist[i,]<-distancia
  }
  rownames(midist)<-colnames(mycluster$centers)
  
  dist_total<-apply(midist,2, sum)
  ### encontrar el cluster con la menor distancia al punto
  ### y asi encontrar el cluster optimo del dato
  num_cluster<-which.min(dist_total)
  return(num_cluster)
}

