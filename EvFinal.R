#EVALUACION FINAL
#Romina Pamela Velazquez
setwd("E:/RO!!!/I-R/Ev Final")
getwd()

#PARTE 0
#Instalacion del paquete
install.packages("ggplot2", dependencies = TRUE, INSTALL_opts = '--no-lock')
#Llamamos al paquete
require(ggplot2) #library(ggplot2) devuelve error
rm(list=ls()) #borra los datos del entorno guardados en la memoria

#PARTE 1
mpg <- dput(mpg)
View(mpg)
dim(mpg)#devuelve 234 filas y 11 columnas
ncol(mpg$cty) #devuelve nro de columnas: 11
nrow(mpg$cty) #devuelve nro de filas en millas: 234
class(mpg) #devuelve de que clase es mpg (es un fata.frame)
str(mpg) #devuelve de que tipo es cada variable del data frame
class(mpg$cty) #devuelve de que clase es la variable milla
plot(mpg$cty,mpg$displ) #devuelve un grafico de dispersion de cty vs displ
#el grafico muestra que a mayor eficiencia del uso de combustible menor es el tamanio del motor
boxplot(cty~class,data=mpg) #devuelve la variacion del rendimiento segun la clase d vehiculo
plot(mpg$class,mpg$cty) #devuelve un error: se necesitan valores finitos de 'xlim'

#PARTE 2
encuesta <- read.table( "gss_cat.csv", header = TRUE,sep = "," , dec = ".")
names(encuesta)
encuesta #muestro los datos en consola
View(encuesta)
horasTV=subset(encuesta,tvhours!='NA') #arma un dataframe sin datos faltantes en tvhours
class(horasTV$tvhours) #devuelve Integer
promedio=sum(horasTV$tvhours)/nrow(horasTV) #devuelve horas de TV que se miran por dia
promedio
promedioSemanal=promedio*7 #devuelve horas de TV que se miran por semana
promedioSemanal
religiones=table(encuesta$relig)
View(religiones) 
which.max(religiones) #devuelve la religion mas comun en el dataframe
which.min(religiones) #devuelve la religion menos comun en el dataframe
ingresos=table(encuesta$rincome)
barplot(ingresos)
#el grafico es dificil de entender por que hay muchos valores superpuestos, 
#habria que reagrupar todos los datos para obtener un mejor grafico 
encuesta$race <- as.factor(encuesta$race)
class(encuesta$race) #devuelve factor
levels(encuesta$race)
encuesta$rincome <- as.factor(encuesta$rincome)
class(encuesta$rincome) #devuelve factor
levels(encuesta$rincome)
ingreso_x_raza=table(encuesta$race,encuesta$rincome)
ingreso_x_raza
View(ingreso_x_raza)
tabla4=cbind(ingreso_x_raza)
View(tabla4)
barplot(tabla4) 
#segun este grafico no hay una raza que tenga mejor o menor ingreso respecto a otra
#ya que no hay una barra donde no aparezcan las tres razas
#pregunta5 no entiendo que pide
table(encuesta$year,encuesta$partyid) #relaciono la cantidad de personas segun ideologia politica por cada anio
View(table(encuesta$year,encuesta$partyid))
tabla=cbind(table(encuesta$year,encuesta$partyid))
View(tabla)
datos<-data.frame(tabla) #creo un dataframe que vincule cantidad de personas por ideologia politica segun cada anio
View(datos) #visualizo el dataframe
datos$Strong.democrat=ts(datos$Strong.democrat) #convierto el tipo de dato a serie de tiempo
datos$Independent=ts(datos$Independent) #convierto el tipo de dato a serie de tiempo
datos$Strong.republican=ts(datos$Strong.republican) #convierto el tipo de dato a serie de tiempo
str(datos) #verifico que las variables me devuelven Time-series
plot(cbind(datos$Strong.democrat,datos$Strong.republican,datos$Independent))
#este grafico me devuelve la cantidad de personas por anio que se identifican como democratas, republicas o independientes

#FIN
