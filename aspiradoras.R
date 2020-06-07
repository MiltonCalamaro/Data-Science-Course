##################################################
## Extraer las url de los homepages
##################################################
library(rvest)
url<-'https://www.amazon.com/s?k=aspiradoras&ref=nb_sb_noss_1'
selector<-'#search > div.s-desktop-width-max.s-desktop-content.sg-row > div.sg-col-20-of-24.sg-col-28-of-32.sg-col-16-of-20.sg-col.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(5) > div.s-main-slot.s-result-list.s-search-results.sg-row > div:nth-child(2) > div > span > div > div > div > div > div:nth-child(2) > div.sg-col-4-of-12.sg-col-8-of-16.sg-col-16-of-24.sg-col-12-of-20.sg-col-24-of-32.sg-col.sg-col-28-of-36.sg-col-20-of-28 > div > div:nth-child(1) > div > div > div:nth-child(1) > h2 > a'

pagina<-read_html(url)
nodo<-html_node(pagina,selector)
#nodo_text <-html_text(nodo)
nodo_links<-html_attr(nodo,'href')
nodo_links
urlcompleta<-paste0('https://www.amazon.com',nodo_links)
#https://www.amazon.com/s?k=aspiradoras&page=2&qid=1591420155&ref=sr_pg_2
#https://www.amazon.com/s?k=aspiradoras&page=3&qid=1591420155&ref=sr_pg_3
library(stringr)
pag <-'s?k=aspiradoras&page=2&qid=1591437463&ref=sr_pg_2'
lista_paginas<-c(0:10)
### Extrayendo todos los links de las home_pages
pag<-str_replace(pag,'page=2',paste0('page=',lista_paginas))
pag<-str_replace(pag,'sr_pg_2',paste0('sr_pg_',lista_paginas))

##############################################################
#obtencion de url de cada producto
#############################################################

## concatenar las url de las homepages
paginas<-paste0('https://www.amazon.com/',pag)

dameLinksPagina<-function(url){
  selector<-'div > div:nth-child(1) > div > div > div:nth-child(1) > h2 > a'
  pagina<-read_html(url)###como el request
  nodo<-html_nodes(pagina,selector)### para obtener todos los links de esa pagina
  #nodo_text <-html_text(nodo)
  nodo_links<-html_attr(nodo,'href')
}
  
test<-dameLinksPagina(paginas[3])
linksAsp<-sapply(paginas,dameLinksPagina)### sapply para aplicar sobre una funció

class(linksAsp) ### es una matrix
dim(linksAsp) ### de dimension 22 x 10
length(linksAsp)
vlink <- as.vector(linksAsp) ### convertir la matriz en vector

vlinksAspiradora<-paste0('https://amazon.com/',vlink)
length(vlinksAspiradora)

############################################################
# Extraer información de los productos
############################################################
url<-'https://www.amazon.com/Holife-Handheld-Vacuum-Rechargeable-Lightweight/dp/B07VDJGDVJ/ref=sr_1_36?dchild=1&keywords=aspiradoras&qid=1591493546&sr=8-36'

pagina_web<-read_html(url) ### es como el beautifulSoup

nombre<-'#productTitle'
nombre_nodo<-html_node(pagina_web, nombre) ### Es como aplicar el soup.find()
nombre_texto<-html_text(nombre_nodo)
nombre_texto

opiniones<-'#acrCustomerReviewText'
opiniones_nodo<-html_node(pagina_web, opiniones) ### Es como aplicar el soup.find()
opiniones_texto<-html_text(opiniones_nodo)
opiniones_texto

precio<-'#priceblock_ourprice'
precio_nodo<-html_node(pagina_web, precio) ### Es como aplicar el soup.find()
precio_texto<-html_text(precio_nodo)
precio_texto


rating<-'#acrPopover'
rating_nodo<-html_node(pagina_web,rating)
rating_texto<-html_text(rating_nodo)

tabla<-'#productDetails_detailBullets_sections1'
tabla_nodo<-html_node(pagina_web,tabla)
tabla_tab<-html_table(tabla_nodo)

val<-tabla_tab$X2
res_tabla<-data.frame(t(val))
tabla_name<-tabla_tab$X1
colnames(res_tabla)<-tabla_name
colnames(res_tabla)

resultado_aspiradoras<-c(nombre_texto, precio_texto,opiniones_texto,
                         rating_texto,
                         as.character(res_tabla$`Item Weight`),
                         as.character(res_tabla$`Product Dimensions`))
View(resultado_aspiradoras)


getArticulo<-function(url){
  result = tryCatch({

    pagina_web<-read_html(url) ### es como el beautifulSoup
    print(url)
    nombre<-'#productTitle'
    nombre_nodo<-html_node(pagina_web, nombre) ### Es como aplicar el soup.find()
    nombre_texto<-html_text(nombre_nodo)
  
    opiniones<-'#acrCustomerReviewText'
    opiniones_nodo<-html_node(pagina_web, opiniones) ### Es como aplicar el soup.find()
    opiniones_texto<-html_text(opiniones_nodo)
  
    precio<-'#priceblock_ourprice'
    precio_nodo<-html_node(pagina_web, precio) ### Es como aplicar el soup.find()
    precio_texto<-html_text(precio_nodo)
    
    rating<-'#acrPopover'
    rating_nodo<-html_node(pagina_web,rating)
    rating_texto<-html_text(rating_nodo)
    
    tabla<-'#productDetails_detailBullets_sections1'
    tabla_nodo<-html_node(pagina_web,tabla)
    tabla_tab<-html_table(tabla_nodo)
    val<-tabla_tab$X2
    res_tabla<-data.frame(t(val))
    tabla_name<-tabla_tab$X1
    colnames(res_tabla)<-tabla_name
    res_tabla<-res_tabla[, !duplicated(colnames(res_tabla))]
    
    ### estos serian los nombres de columnas de las tablas
    col<-c('Item Weight','Product Dimensions')
    if(length(res_tabla)==0){
      #No hay detalles , todo a -1
      mitab<-data.frame(colnames(col))
      mitab<-rbind(mitab, c('-1','-1'))
      colnames(mitab)<-col
    }else{
      #Evaluar cada uno de los atributos
      zero<-matrix('0',ncol = 2, nrow = 1)
      dfzero<-as.data.frame(zero)
      colnames(dfzero)<-col
      peso<-as.character(res_tabla$`Item Weight`[1])
      if (length(peso)==0) peso<-'-1'
      
      dime<-as.character(res_tabla$`Product Dimensions`[1])
      if (length(dime)==0) dime<-'-1'
        
      dfzero$'Item Weigh'<-peso
      dfzero$'Product Dimensions'<-dime
      mitab<-dfzero
      colnames(mitab)<-col
    }
    articulo<-c(nombre_texto, precio_texto,opiniones_texto,rating_texto,
                             as.character(mitab$`Item Weight`[1]),
                             as.character(mitab$`Product Dimensions`[1]))
  
    return(articulo)
    
  }, error = function(e) {
    articulo<-c('-1','-1','-1','-1','-1','-1')
    return(articulo)
  })}

#res<-getArticulo(vlinksAspiradora[1:3])
res<-sapply(vlinksAspiradora[1:5], getArticulo)
View(res)
resultado_datos<-sapply(vlinksAspiradora, getArticulo)

dim(resultado_datos)
res<-t(resultado_datos)
View(res)
mis_aspiradoras<-as.data.frame(res)
colnames(mis_aspiradoras)<-c('nombre','precio','opiniones','rating', 'peso',
                 'dimension')
View(mis_aspiradoras)
aspiradoras<-mis_aspiradoras
