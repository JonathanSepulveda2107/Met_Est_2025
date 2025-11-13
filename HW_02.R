# Asignacion 3: Contraste de medidas
# Jonathan Alfredo Sepulveda Flores IF
# 03/09/2025
# El primer paso es encontrar la base de datos Iris en RStudio
library(datasets)
data("iris")
summary(iris)
## Sepal.Length Sepal.Width Petal.Length Petal.Width 
## Min. :4.300 Min. :2.000 Min. :1.000 Min. :0.100 
## 1st Qu.:5.100 1st Qu.:2.800 1st Qu.:1.600 1st Qu.:0.300 
## Median :5.800 Median :3.000 Median :4.350 Median :1.300 
## Mean :5.843 Mean :3.057 Mean :3.758 Mean :1.199 
## 3rd Qu.:6.400 3rd Qu.:3.300 3rd Qu.:5.100 3rd Qu.:1.800 
## Max. :7.900 Max. :4.400 Max. :6.900 Max. :2.500 
## Species 
## setosa :50 
## versicolor:50 
## virginica :50 
## 
## 
## 
summary(iris$Petal.Length)
## Min. 1st Qu. Median Mean 3rd Qu. Max. 
## 1.000 1.600 4.350 3.758 5.100 6.900
head(iris)
## Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1 5.1 3.5 1.4 0.2 setosa
## 2 4.9 3.0 1.4 0.2 setosa
## 3 4.7 3.2 1.3 0.2 setosa
## 4 4.6 3.1 1.5 0.2 setosa
## 5 5.0 3.6 1.4 0.2 setosa
## 6 5.4 3.9 1.7 0.4 setosa
head(iris$Petal.Length)
## [1] 1.4 1.4 1.3 1.5 1.4 1.7
aggregate(Petal.Length ~ Species, data =iris[iris$Species %in% c("versico
lor", "virginica"),], summary)
## Species Petal.Length.Min. Petal.Length.1st Qu. Petal.Length.Media
n
## 1 versicolor 3.000 4.000 4.35
0
## 2 virginica 4.500 5.100 5.55
0
## Petal.Length.Mean Petal.Length.3rd Qu. Petal.Length.Max.
## 1 4.260 4.600 5.100
## 2 5.552 5.875 6.900
# Prueba 
# ¿Entre las especies versicolor y virginica hay diferencias?
# Datos
iris_sub <- subset(iris, Species %in% c("versicolor", "virginica"))
versicolor <- iris_sub$Petal.Length[iris_sub$Species == "versicolor"]
virginica <- iris_sub$Petal.Length[iris_sub$Species == "virginica"]
# Supuestos
# Normalidad
shapiro.test(versicolor)
## 
## Shapiro-Wilk normality test
## 
## data: versicolor
## W = 0.966, p-value = 0.1585
shapiro.test(virginica)
## 
## Shapiro-Wilk normality test
## 
## data: virginica
## W = 0.96219, p-value = 0.1098
# Homogeneidad de varianzas
var.test(versicolor, virginica)
## 
## F test to compare two variances
## 
## data: versicolor and virginica
## F = 0.72497, num df = 49, denom df = 49, p-value = 0.2637
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
## 0.411402 1.277530
## sample estimates:
## ratio of variances 
## 0.7249678
# Prueba t de Student
# Si varianzas iguales: var.equal = TRUE
# Si diferentes: var.equal = FALSE
## 
## Welch Two Sample t-test
## 
## data: versicolor and virginica
## t = -12.604, df = 95.57, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
## -1.49549 -1.08851
## sample estimates:
## mean of x mean of y 
## 4.260 5.552
# Tamaño del efecto (Cohen's d)
if(!require(effsize)) install.packages("effsize")
## Cargando paquete requerido: effsize
library(effsize)
cohen.d(versicolor, virginica)
## 
## Cohen's d
## 
## d estimate: -2.520756 (large)
## 95 percent confidence interval:
## lower upper 
## -3.052397 -1.989115
# Visualización
# Boxplot comparativo
boxplot(Petal.Length ~ Species, data = iris_sub,
        main = "Comparación de Petal.Length",
        xlab = "Especie", ylab = "Petal.Length",
        col = c("red", "lightblue"))