library(vcd)
library((vcdExtra)
library(gnm)

#Cargar base de datos Mental

#Abrir Mental

str(Mental)

summary(Mental)

#Tabla de frecuencias
> xtabs(Freq ~ mental+ses, data=Mental) 

#Existen 6 niveles socioecon�micos (ses) y 4 estados mentales: Bien (Well), Mild (Mas o menos) , Moderado (Moderate), Da�ado (Impared) 

#Buscando la asociaci�n a trav�s del estado mental y el nivel socioecon�mico a trav�s de un modelo de independencia. Se usa la opci�n (glm) que el uso de un modelo 
de regresi�n lineal. 

> indep <- glm(Freq ~ mental + ses, family = poisson, data = Mental)
> indep

#Sin embargo podemos observar que el modelo no esta establecido en orden (tabla)por lo que lo ponemos en orden por columas y filas para que exista una mejora
y ver la asociaci�n del nivel socioecon�mico frente al estado mental

> Cscore <- as.numeric(Mental$ses)
> Rscore <- as.numeric(Mental$mental)

> Cscore
> Rscore 

#Asociaci�n por columnas
> coleff <- glm(Freq ~ mental + ses + Rscore:ses, family = poisson, data = Mental)
> coleff

#Asociaci�n por filas
> roweff <- glm(Freq ~ mental + ses + mental:Cscore, family = poisson, data = Mental)
> roweff

#Se observa con estos tres modelos de asociaci�n que en el primer caso, el modelo linel el Pvalue el muy peque�o casi llegando a cero por lo que afirmar�amos que 
no existe asociaci�n mientras que en los otros modelos estan cercanos a ceros , se rechaza la hip�tesis nula y se acepta la alterna, por lo tendr�a mucha asociaci�n
entre el nivel sociecon�mico y el estado mental.







#FUENTE:  http://halweb.uc3m.es/esp/Personal/personas/jmmarin/esp/Bayes/practica%205.pdf 



 
