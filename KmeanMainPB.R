library(plumber)
r<-plumb('C://Users/hamil/Desktop/Course Data Science/AspiradorasPlumber.R')
r$run(port=8000)
###Test
#http://127.0.0.1:8000/getCluster?precio=0.2137823&opiniones=0.4452997&rating=0.7295205&alto=-0.3090322&ancho=-0.8670579&profundidad=1.2004021
