# Laboratorio Semana 3
# 20/08/2025
#Jo


# Importar datos ----------------------------------------------------------

Temp <- read.csv("temperatura.csv", header = T)
Temp <- read.csv("Data/Medias_temp.csv", header =T)

## Graficar datos ----------------------------------------------------------


# Ingresar datos de manera manual

edad <- c(18, 19, 18, 18, 25, 19, 18, 18, 18, 17, 19, 
          19, 18, 17, 19, 18, 19, 19)
alumno <- seq(1,18,1)

info <- data.frame(alumno, edad)

info$Altura <- c(174,174,170,160,158,155,188,170,175,170,172,170,174,180,158,
                 161,188,164)

boxplot(info$Altura,
        # col sirve para ponerle color
        col = "green",
        #Main sirve para ponerle un titulo al boxplot
        main = "clase 3 semestre")

colores = c("red", "white", "yellow")
boxplot(datos_meses,
        col = colores)

# Estadísticas descriptivas -----------------------------------------------

url <- "https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv"

inspeccion <- read.csv(url)

head(inspeccion)

prof_url_2 <- paste0("https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv")
senasica <- read.csv(prof_url_2)
head(senasica)

# Datos de URL seguros (https): Dropbox y GitHub

library(repmis) #No olvidar cargar la paqueteria
conjunto <- source_data("https://www.dropbox.com/s/hmsf07bbayxv6m3/cuadro1.csv?dl=1")


