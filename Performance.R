
suma <- function(a,b = 10){
  resultado <- a + b
  return(resultado)
}


#Por ultimo, vamos a comparar la velocidad de los loops vs la vectorizacion y la 
#familia de funciones apply


#Definimos dos matrices de un millon de filas y 2 columnas
matriz <- matrix(seq(1,1000000),500000,2)
nueva_matriz <- matrix(NA, 500000,2)

#Vamos a recorrer los valores de la matriz, aplicamos la funcion suma e 
#introducimos los resultados en nueva_matriz
#La funcion system.time nos permite conocer el tiempo de ejecucion del codigo
#que contiene
system.time(
  for (i in seq(1,500000)){
    for (j in seq(1,2)){
      nueva_matriz[i,j] <- suma(matriz[i,j])
    }
  }
)

#Realizamos la misma accion de forma vectorial
nueva_matriz <- matrix(NA, 500000,2)
system.time(
  nueva_matriz <- suma(matriz)
)

#Realizamos la misma accion haciendo uso de la funcion apply
system.time(
  nueva_matriz <- apply(X = matriz, MARGIN = c(1,2), FUN = suma)
)

