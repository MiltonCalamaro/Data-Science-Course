### analizar la variable, para eliminar valores 
### reemplazar -1por NA
aspiradoras<-aspiradoras[,-5]##eliminar el campo peso porque no tiene valores
aspiradoras<-aspiradoras[!duplicated(aspiradoras), ]
aspiradoras<-aspiradoras[-26,]
View(aspiradoras)
dim(aspiradoras)
#################### PRECIO ###########################
library(stringr)
str(aspiradoras$precio)
aspiradoras$precio<-as.character(aspiradoras$precio)
aspiradoras$precio<-gsub('[$]','',aspiradoras$precio)
aspiradoras$precio<-as.numeric(aspiradoras$precio)
str(aspiradoras$precio)
###calcular la media
preciomedio <-mean(aspiradoras$precio, na.rm = TRUE)
#### reemplazando el valor faltante por la media
aspiradoras$precio[is.na(aspiradoras$precio)]<-preciomedio
hist(aspiradoras$precio)
summary(aspiradoras$precio)

######################## OPINIONES #########################
str(aspiradoras$opiniones)
aspiradoras$opiniones<-as.character(aspiradoras$opiniones)
aspiradoras$opiniones<-gsub(' ratings','',aspiradoras$opiniones)
aspiradoras$opiniones<-gsub(',','',aspiradoras$opiniones)
aspiradoras$opiniones<-as.numeric(aspiradoras$opiniones)
###calcular la media
opiniones_medio <-mean(aspiradoras$opiniones, na.rm = TRUE)
#### reemplazando el valor faltante por la media
aspiradoras$opiniones[is.na(aspiradoras$opiniones)]<-opiniones_medio
hist(aspiradoras$opiniones)
summary(aspiradoras$opiniones)


help("stringr")

####################RATING###########################
str(aspiradoras$rating)
aspiradoras$rating<-as.character(aspiradoras$rating)
aspiradoras$rating<-gsub('[\\n]','',(aspiradoras$rating))
aspiradoras$rating<-gsub(' ','',(aspiradoras$rating))
aspiradoras$rating<-gsub('outof5stars','',(aspiradoras$rating))
aspiradoras$rating<-as.numeric(aspiradoras$rating)
### calcular la media
rating_medio<-mean(aspiradoras$rating,na.rm = TRUE)
### reemplazar el valor faltante con la media
aspiradoras$rating[is.na(aspiradoras$rating)]<-rating_medio
hist(aspiradoras$rating)
summary(aspiradoras$rating)

#################DIMENSION############################
str(aspiradoras$dimension)
aspiradoras$dimension<-as.character(aspiradoras$dimension)
aspiradoras$dimension<-gsub(' inches','',aspiradoras$dimension)
#### crear variables
dimen<-str_split_fixed(aspiradoras$dimension,' x ',n=3)
dimen<-as.data.frame(dimen)
dimen$V1<-as.character(dimen$V1)
dimen$V1<-gsub('-1',NA,dimen$V1)
dimen$V1<-as.numeric(dimen$V1)
dimen$V1[is.na(dimen$V1)]<-mean(dimen$V1,na.rm = TRUE)

dimen$V2<-as.character(dimen$V2)
dimen$V2<-gsub('-1',NA,dimen$V2)
dimen$V2<-as.numeric(dimen$V2)
dimen$V2[is.na(dimen$V2)]<-mean(dimen$V2,na.rm = TRUE)

dimen$V3<-as.character(dimen$V3)
dimen$V3<-gsub('-1',NA,dimen$V3)
dimen$V3<-as.numeric(dimen$V3)
dimen$V3[is.na(dimen$V3)]<-mean(dimen$V3,na.rm = TRUE)

colnames(dimen)<-c('alto','ancho','profundidad')

### concatenando el nuevo dataframe a la base original
res_limpio<-cbind(aspiradoras,dimen)
View(res_limpio)
###eliminar la columna "dimension del producto"
res_limpio<-res_limpio[,-5]
View(res_limpio)

str(res_limpio)











