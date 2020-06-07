library(rvest)
url <- 'https://www.imdb.com/title/tt0451279/?ref_=nv_sr_srsg_0'
pagina_web<-read_html(url)
class(pagina_web) ## generar un arbol de tipo xml para ir indexando
selector <-'#title-overview-widget > div.vital > div.title_block > div > div.ratings_wrapper > div.imdbRating > div.ratingValue > strong > span'
nodo<-html_node(pagina_web,selector)
nodo_texto<-html_text(nodo)
selector_tabla <- '#titleCast > table'
nodo_tabla <- html_node(pagina_web,selector_tabla)
nodo_tabla_texto <-html_table(nodo_tabla)
