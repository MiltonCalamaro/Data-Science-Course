#* @param msg mensaje
#* @get /echo
function(msg=''){
  list(msn=paste0('El texto es ', msg))
}
#test - http://127.0.0.1:8000/echo?msg=Hola