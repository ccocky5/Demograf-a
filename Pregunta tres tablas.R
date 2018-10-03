library(vcd)
library((vcdExtra)
library(gnm)

#Cargar base de datos Mental

#Abrir Mental

str(Mental)

summary(Mental)

#Tabla de frecuencias
> xtabs(Freq ~ mental+ses, data=Mental) 

#Existen 6 niveles socioeconòmicos (ses) y 4 estados mentales: Bien (Well), Mild (Mas o menos) , Moderado (Moderate), Dañado (Impared) 

#Buscando la asociaciòn a travès del estado mental y el nivel socioeconòmico a travès de un modelo de independencia. Se usa la opciòn (glm) que el uso de un modelo 
de regresiòn lineal. 

> indep <- glm(Freq ~ mental + ses, family = poisson, data = Mental)
> indep

#Sin embargo podemos observar que el modelo no esta establecido en orden (tabla)por lo que lo ponemos en orden por columas y filas para que exista una mejora
y ver la asociaciòn del nivel socioeconòmico frente al estado mental

> Cscore <- as.numeric(Mental$ses)
> Rscore <- as.numeric(Mental$mental)

> Cscore
> Rscore 

#Asociaciòn por columnas
> coleff <- glm(Freq ~ mental + ses + Rscore:ses, family = poisson, data = Mental)
> coleff

#Asociaciòn por filas
> roweff <- glm(Freq ~ mental + ses + mental:Cscore, family = poisson, data = Mental)
> roweff

> Salud_Mental <- xtabs(Freq ~ ses+mental, data=Mental) 
> Salud_Mental

#Tablas de asociación (niveles socioeconómicos)
> Salud_Mental <- xtabs(Freq ~ ses+mental, data=Mental) 
> Salud_Mental

#Gráfica asociación mosaico salud mental y niveles socioeconómicos 
> assoc(Mental,color=TRUE,shade=T,main="mosaico")
> chisq.test(Mental)
        
        

#FUENTE:  http://halweb.uc3m.es/esp/Personal/personas/jmmarin/esp/Bayes/practica%205.pdf 



 

