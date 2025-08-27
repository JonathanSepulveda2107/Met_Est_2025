temperatura <- read.csv("C:/Users/Usuario.PC07/Downloads/temperatura.csv")
View(temperatura)

dim(temperatura) #numero de filas y columnas
names(temperatura) #nombres de las columnas
str(temperatura) #estructura del objeto

#resumen estadistico
summary(temperatura)

names(temperatura) <- c("anio", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic")



names(temperatura)

#Crear columna Media_anual con temperatura media anual
temperatura$Ene
temperatura$Media_anual <- rowMeans(temperatura[,2:13])
head(temperatura)

#Crear objeto con medias mensuales de temperatura
medias_mensuales <- colMeans(temperatura [,2:13])
help(boxplot)

#Boxplot para solo un mes
boxplot(temperatura$Ene,
        main="Temperatura de enero,
        ylab=°C",
        col="lightblue")
datos_meses <- temperatura[,2:13]
boxplot(datos_meses,
        main= "Temperatura"
        Ylab="°C",
        col="lightgreen",
        names= c ("Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"))

