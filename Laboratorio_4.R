# Pruebas de t
# caso de mestras independientes
# JASF
# 27/08/2025

# Importar datos de Indice de calidad

calidad <- read.csv("Calidad_plantas.csv", header = T)

calidad$Tratamiento <- as.factor(calidad$Tratamiento)

colores <- c("pink", "skyblue")
boxplot(calidad$IE ~ calidad$Tratamiento,
        col = colores,
        xlab = "Tratamientos",
        ylab = "indice calidad",
        ylim = c(0.4,1.2),
        main = "Vivero Iturbide")

#Estadistica descriptivas
# tapply sirve para obtener un valor cuando contamos
# con varios grupos

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, var)        
tapply(calidad$IE, calidad$Tratamiento, sd)

# Observamos que la varianza del grupo fert es 3 veces
# mas grande que el grupo Control (Ctrl)

# revisar el comportamiento de los datos
library("ggplot2")

ggplot(calidad, aes(x = IE, color = Tratamiento))+
  geom_density()
ggplot(calidad, aes(x = IE, color = Tratamiento))+
  geom_histogram()

# Separar los datos por tratamiento
df_ctrl <- subset(calidad, Tratamiento == "Ctrl")
df_fert <- subset(calidad, Tratamiento != "Ctrl")

# qqplot revisar normalidad
par(mfrow = c (1,2))
qqnorm(df_ctrl$IE); qqline(df_ctrl$IE)
qqnorm(df_fert$IE); qqline(df_fert$IE)
par(mfrow = c(1,1))

# prueba de normalidad
shapiro.test(df_ctrl$IE)
shapiro.test(df_fert$IE)

# Revisar homogenialidad
var.test(df_fert$IE, df_fert$IE)
var.test(calidad$IE ~ calidad$Tratamiento)

# Aplicar la prueba de t, varianzas iguales
# dos colas = two.side

t.test(calidad$IE ~ calidad$Tratamiento,
       var.equal = T,
       alternative = "two.side")

cohens_efecto <- function(x,y) {
  N1 <- length(x); n2 <- length(y)
  s1 <- sd(x);     s2 <- sd(y)
  sp <- sqrt(((n1-1) * s1^2 + (n2 - 1) * s2^2 / (n1 + n2 - 2))
             (mean(x) - (mean(y)) / sp
}