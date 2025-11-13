# Examen Parcial II
# Dr. Marco Aurelio González Tagle
# Alumno: Jonathan Alfredo Sepulveda Flores
# Fecha: 22/10/2025

#===============================================================================

# Librerías

library(dplyr)
library(ggplot2)

# Dropbox

suelo <- read.csv(url("https://www.dropbox.com/s/3pi3huovq6qce42/obs.csv?dl=1"))

# Ajustar las variables

suelo$zone <- as.factor(suelo$zone)
suelo$wrb <- as.factor(suelo$wrb)
head(suelo)

#===============================================================================
# Actividad 1


# P1. Respuesta: el contenido de arcilla aumenta conforme aumenta la profundidad

summary(suelo$Clay1)
summary(suelo$Clay2)
summary(suelo$Clay5)

# Promedio general por capa

colMeans(suelo[, c("Clay1", "Clay2", "Clay5")])

#===============================================================================
# Actividad 2

# P2. Respuesta: si, en el boxplot se detectaron tres valores atipicos 72, 71 y 67

boxplot(suelo$Clay1,
        main = "Contenido de Arcilla (0–10 cm)",
        ylab = "% de Arcilla",
        col = "olivedrab1")

# Detección de outliers

outliers_Clay1 <- boxplot.stats(suelo$Clay1)$out
outliers_Clay1

# P3. Respuesta:Las observaciones Clay1 72, 71 y 67 corresponden a muestras 1, 2 y 106
suelo[outliers_Clay1 %in% suelo$Clay1, ]

# Filtrar valores extremos

suelo_filtrado <- suelo %>% filter(Clay1 < 60)
summary(suelo_filtrado$Clay1)

#===============================================================================
# Actividad 3


# P4. Respuesta: no existe diferencia significativa 

mean(suelo_filtrado$Clay1)
t.test(suelo_filtrado$Clay1, mu = 30)

#===============================================================================
# Actividad 4

# P5. Respuesta:si muestra una relacion positiva fuerte

plot(suelo$Clay1, suelo$Clay5,
     main = "Relación entre Clay1 y Clay5",
     xlab = "Clay1 (%)",
     ylab = "Clay5 (%)",
     pch = 19, col = "skyblue")

# P6. respuesta: La correlacion es positiva y significativa estadisticamente

cor.test(suelo$Clay1, suelo$Clay5)
# la correlacion es significativa

#===============================================================================
# Actividad 5

# P7.Respuesta: si existen diferencias altamente significativas

boxplot(Clay5 ~ zone, data = suelo,
        main = "Contenido de Arcilla (30–50 cm) por Zona",
        xlab = "Zona",
        ylab = "% de Arcilla",
        col = "red")
# ANOVA
anova_result <- aov(Clay5 ~ zone, data = suelo)
summary(anova_result)