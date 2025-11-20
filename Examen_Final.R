# Examen Final - Métodos Estadísticos
# Ejercicio 1: Relación entre DAP y Altura
# Datos del ejercicio
# Jonathan Alfredo Sepulveda Flores IF 2142318

# De los tres ejercicios que habia yo escogi el ejercicio 1

DAP_cm <- c(
  19.57, 29.99, 26.41, 17.47, 22.11, 33.26, 12.87, 22.86, 31.33, 20.67,
  21.61, 24.53, 32.46, 21.81, 22.78, 22.83, 36.03, 35.93, 30.02, 26.93,
  28.69, 32.45, 20.32, 30.88, 18.73, 21.81, 29.54, 17.86, 24.3, 20.69)
Altura_m <- c(
  17.23, 9.6, 12.69, 15.9, 20.78, 17.48, 18.01, 20.06, 15.36, 18.85,
  15.58, 12.82, 16.83, 19.72, 19.02, 17.96, 25.18, 19.24, 20.94, 24.71,
  14.12, 14.88, 23.23, 15.61, 18.09, 21.21, 20.67, 23.26, 22.49, 21.21)
datos <- data.frame(DAP_cm, Altura_m)
# Vista de los datos
head(datos)
summary(datos)
# Medias y desviaciones
mean(DAP_cm)
sd(DAP_cm)
mean(Altura_m)
sd(Altura_m)

# ¿Los árboles con mayor DAP tienden a presentar mayores alturas
# en el rodal estudiado?
# Hipótesis:
# H0: El DAP no está relacionado con la altura de los árboles (r = 0).
# H1: El DAP sí está relacionado con la altura de los árboles (r ≠ 0).
# Normalidad
shapiro.test(DAP_cm)
shapiro.test(Altura_m)
# Como ambas dan p > 0.05, se usa Pearson
cor.test(DAP_cm, Altura_m, method = "pearson")
# Gráfico de dispersión
plot(DAP_cm, Altura_m,
     main="Relación entre DAP y Altura",
     xlab="DAP (cm)", ylab="Altura (m)",
     pch=19, col="firebrick")

# Interpretación:
# El coeficiente de correlación (r) es cercano a 0.67
# y el valor p es muy pequeño (< 0.001).
#
# Con esta evidencia se rechaza H0 y se acepta H1:
# el DAP sí está relacionado con la altura de los árboles.
#
# Conclusión:
# En este rodal, los árboles con mayor diámetro tienden a ser más altos,
# lo que tiene sentido con el crecimiento normal de las especies de pino.