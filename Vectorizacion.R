

#La funcion suma recibe dos numeros, realiza su suma y devuelve el resultado.
#El valor por defecto del parametro b es 10.
suma <- function(a,b = 10){
  resultado <- a + b
  return(resultado)
}

vector_numerico <- c(1,2,3,4,5,6,7,8,9,10)
vector_resultado <- c()
#Aplicamos la funcion con un bucle for (opcion no recomendada)
for (i in vector_numerico){
  vector_resultado[i] <- suma(i)
}


#Aplicamos la funcion de forma vectorizada sobre un vector
vector_resultado <- suma(a = vector_numerico)



#Aplicamos la funcion de forma vectorizada sobre una matriz
matriz_numerica <- matrix(vector_numerico , nrow = 5 , ncol = 2)
matriz_resultado <- suma(matriz_numerica)



#Aplicamos la funcion de forma vectorizada sobre un dataframe
df_numerico <- data.frame(columna1=vector_numerico, columna2=vector_numerico)
df_resultado <- suma(df_numerico)


