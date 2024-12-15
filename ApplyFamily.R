
#Definimos las funciones que vamos a utilizar

suma <- function(a,b = 10){
  resultado <- a + b
  return(resultado)
}

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


### LAPPLY ----------


#Aplicamos la funcion suma sobre cada uno de los elementos de una lista
lista_numerica <- list(1,2,3,4,5,6,7,8,9,10)
lista_resultado <- lapply( X = lista_numerica , FUN = suma )

#Podemos dar valor al parámetro b de la funcion suma
lista_resultado_2 <- lapply( X = lista_numerica , FUN = suma , b = 25)


#Aplicamos la funcion suma sobre cada uno de los elementos de vector
vector_numerico <- c(1,2,3,4,5,6,7,8,9,10)
lista_resultado <- lapply( X = vector_numerico , FUN = suma , b = 25)



#De momento seguimos trabajando con una funcion que trabaja con variables basicas
#Vamos a pasar a una cuya entrada es un vector


#Aplicamos la funcion sobre una lista de vectores
vector_numerico_1 <- c(1,2,3,4,5)
vector_numerico_2 <- c(10,12,14,16,18)
lista_de_vectores <- list(vector_numerico_1 , vector_numerico_2)
lista_resultado <- lapply(X = lista_de_vectores , FUN = rango_estadistico)


#Aplicamos la funcion sobre las columnas de un dataframe
df_numerico <- data.frame(columna1=vector_numerico_1, columna2=vector_numerico_2)
lista_resultado <- lapply(X = df_numerico , FUN = rango_estadistico)


### APPLY ----------

#¿Que pasa si los vectores forman parte de una matriz? 
#Usamos la función apply, el resultado es un vector

matriz_numerica <- matrix( c(1,2,3,4,5,10,12,14,16,18) , nrow = 5 , ncol = 2)

apply( X = matriz_numerica, MARGIN = 1 , FUN = rango_estadistico)

apply( X = matriz_numerica, MARGIN = 2 , FUN = rango_estadistico)


#Tambien lo podemos usar con un dataframe (pero internamente primero lo convierte a matriz)

apply( X = df_numerico, MARGIN = 1 , FUN = rango_estadistico)

apply( X = df_numerico, MARGIN = 2 , FUN = rango_estadistico)

apply( X = df_numerico, MARGIN = 2 , FUN = mean)


df_mixto <- data.frame(columna1 = vector_numerico_1, columna2 = vector_numerico_2, 
                       columna3 = c("10","12","14","16","18"))

apply( X = df_mixto, MARGIN = 2 , FUN = rango_estadistico)


