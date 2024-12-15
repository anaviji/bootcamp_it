

##### 1 -----

#La funcion suma recibe dos numeros, realiza su suma
#y devuelve el resultado.
#El valor por defecto del parametro b es 10.
suma <- function(a,b = 10){
  resultado <- a + b
  return(resultado)
}

suma(10,12)
suma(12)
suma(b = 32,a = 20)
suma(a = 12)
suma(b = 12)
suma(30,"texto")


##### 2 -----
#Creamos una funcion que calcula la suma, resta, multiplicacion y division de los dos
#numeros que recibe. Devuelve una lista con los resultados.
operaciones_numericas <- function(a,b = 10){
  if( is.numeric(a) & is.numeric(b) ){
    suma <- a + b
    resta <- a - b
    multiplicacion <- a * b
    division <- a / b
    return(list(suma=suma,resta=resta,multiplicacion=multiplicacion,division=division))  
  } else {
    return("No se ha podido realizar la suma. Las variables no son de tipo numerico") 
  }
}

lista_resultado <- operaciones_numericas(10,12)
operaciones_numericas(a = 12)
operaciones_numericas(b = 12)
operaciones_numericas(30,"texto")

##### 3 -----
#Definimos una funcion que calcula el rango estadistico de un vector numerico
rango_estadistico <- function(vector){
  if( is.numeric(vector) ){
    maximo <- max(vector)
    minimo <- min(vector)
    rango_estadistico <- maximo - minimo
    return(rango_estadistico)  
  } else {
    print("No se ha podido realizar el calculo. La variable no es de tipo numerico")
    return(NULL)
  }
}

rango_estadistico(c(2,15,15,61,32,2,56,23))
rango_estadistico(c("2","15","15","61","32","2","56","23"))

##### 4 -----
#Definimos una funcion que calcula el rango estadistico de todas las columnas
#de un dataframe (siempre que sean numericas)
rango_estadistico_columnas_dataframe <- function(df){
  columnas <- names(df)
  resultado <- c()
  
  for (columna in columnas){
    if( is.numeric(df[,columna]) ){
      resultado[columna] <- rango_estadistico(df[,columna]) 
    }
  }
  return(resultado)
}

df <- data.frame(columna1 = c(2,15,15,61,32,2,56,23),
                 columna2 = c(1,2,3,4,5,6,7,8),
                 columna3 = c("2","15","15","61","32","2","56","23"))


rango_estadistico_columnas_dataframe(df)


