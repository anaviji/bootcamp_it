# 3.  Leer el fichero de entrada

# Escribe una función personalizada llamada leer_numeros que tome como argumento 
# el nombre del fichero (numeros.txt) y devuelva un vector de números enteros.
leer_numeros <- function(nombre_fichero){
  # Dentro de la función, verifica si el fichero existe.
  if (file.exists(nombre_fichero)){
    # Si el fichero existe, lee los datos y conviértelos en un vector de enteros.
    df <- readLines(nombre_fichero)
    numeros <- as.integer(df)
    return(numeros)
  } else {
    # Si el fichero no existe, muestra un mensaje de error y utiliza la función stop() para detener la ejecución.
    stop("Error: el fichero no existe")
  }
  
}


# 4.  Calcular los estadísticos
# Utiliza funciones vectorizadas como mean(), median() y sd() para calcular la media, mediana y desviación estándar del vector obtenido.
funciones_vectorizadas <- function(numeros){
  media <- mean(numeros, na.rm=T)
  mediana <- median(numeros, na.rm=T)
  stdev <- sd(numeros, na.rm=T)
  return(list(media=media, mediana=mediana, deviacion_estandar=stdev))
}

# 5.  Manejar valores atípicos
# Utiliza una estructura condicional para verificar si la desviación estándar es mayor que 10.
# Si es así, muestra un mensaje indicando que hay alta variabilidad en los datos.
desviacion <- function(desv_estandar){
  if (desv_estandar > 10){
    print("Hay alta variabilidad en los datos")
  }
}

# 6.  Aplicar una función con la familia apply
# Utiliza la función sapply() para obtener el cuadrado de cada número en el vector.
# Almacena los resultados en un nuevo vector.
cuadrado <- function(a){
  return(a^2)
}

calcular_cuadrados <- function(numeros){
  return(sapply(numeros, cuadrado))
}

# 7.  Escribir los resultados en un fichero de salida
# Crea o sobrescribe un fichero llamado resultados.txt.
# Escribe en el fichero los estadísticos calculados y la lista de números al cuadrado.
# Asegúrate de que el formato del fichero sea legible y esté bien organizado.
escribir_resultados <- function(nombre_fichero, estadisticos_calculados, numeros_cuadrado) {
  sink(nombre_fichero) 
  cat("Estadísticos calculados:\n")
  cat("Media:", estadisticos_calculados$media, "\n")
  cat("Mediana:", estadisticos_calculados$mediana, "\n")
  cat("Desviación estándar:", estadisticos_calculados$deviacion_estandar, "\n\n")
  
  cat("Números elevados al cuadrado:\n")
  cat(toString(numeros_cuadrado), "\n")
  sink()
}

# 8.  Ejecutar y probar el script
numeros <- leer_numeros("data/numeros.txt")
lista_estadisticos <- funciones_vectorizadas(numeros)
desviacion(lista_estadisticos$deviacion_estandar)
numeros_cuadrado <- calcular_cuadrados(numeros)
escribir_resultados("data/resultados.txt", lista_estadisticos, numeros_cuadrado)
