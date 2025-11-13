# Gastos mensuales
300 + 240 + 1527 + 400 + 1500 + 1833
## [1] 5800
celular <- 300
celular
## [1] 300
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
total <- celular+transporte+comestibles+gimnasio+alquiler+otros
semestre <- total*5
anual <- total*10
#valor absoluto
abs(10)
## [1] 10
abs(-4)
## [1] 4
#Raiz cuadrada 
sqrt(9)
## [1] 3
#logaritmo natural
log(2)
## [1] 0.6931472
2*9
## [1] 18
4+5 #tambien se puede colocar un comentario
## [1] 9
celular <- 30
Celular <- 300
CELULAR <- 8000
celular+Celular
## [1] 600
CELULAR-celular
## [1] 7700
help(abs)
## starting httpd help server ... done
help(mean)
?abs
?mean
help.search("absolute")
gastos <- c(celular, transporte,comestibles,gimnasio,alquiler,otros)
gastos
## [1] 300 240 1527 400 1500 1833
barplot(gastos)
?sort
gastos_ord <- sort(gastos,decreasing = TRUE)
sort(gastos)
## [1] 240 300 400 1500 1527 1833
gastos_ord <- sort(gastos, decreasing = TRUE)
barplot(gastos_ord)
help("barplot")
barplot(gastos_ord, main = "Gastos mensuales", names.arg = c("otros", "co
mestibles", 
                                                             "alquiler", 
                                                             "gimnasio",
                                                             "celular", "
transporte"))        