rm(list = ls())

leer_archivo <- function(path, header, sep, dec){
  df <- read.table(path, header = header, sep = sep, dec = dec)
}
df <- leer_archivo("data/temperaturas.csv", header=T, sep=",", dec=".")


temperatura_media <- function(df){
  for (i in seq(1, nrow(df))){
    df[i, "temperatura_media"] <- mean(c(df[i, "temperatura_maxima"], df[i, "temperatura_minima"]))
  }
  return(df)
}
df <- temperatura_media(df)


temperatura_media_mensual <- function(df){
  ciudades <- unique(df$ciudad)
  
  temp_media_mensual <- c()
  for (i in seq(1, length(ciudades))){
    df_ciudad <- df[df$ciudad == ciudades[i],]
    temp_media_mensual[i] <- mean(df_ciudad$temperatura_media)
  }
  ciudad_max_media = ciudades[which.max(temp_media_mensual)]
  return(ciudad_max_media)
}
ciudad_max_media <- temperatura_media_mensual(df)


generar_archivo <- function(df, ciudad_max_temp, archivo_salida) {
  temperaturas_por_ciudad <- split(df$temperatura_media, df$ciudad)
  
  sink(archivo_salida)
  cat("Temperaturas medias diarias por ciudad:\n")
  for (ciudad in names(temperaturas_por_ciudad)) {
    cat(ciudad, ": ", toString(temperaturas_por_ciudad[[ciudad]]), "\n")
  }
  cat("\nCiudad con la temperatura media más alta del mes: ", ciudad_max_temp, "\n")
  sink()
}

generar_archivo(df, ciudad_max_media, "data/resumen_temperaturas.txt")


# SOLUCIÓN
# Función para leer y procesar los datos
procesar_temperaturas <- function(archivo) {
  # Leer el archivo CSV
  datos <- read.csv(archivo)
  
  # Calcular la temperatura media diaria
  datos$temperatura_media <- rowMeans(datos[, c("temperatura_maxima", "temperatura_minima")])
  
  # Obtener la lista de ciudades
  ciudades <- unique(datos$ciudad)
  
  # Calcular temperaturas medias diarias por ciudad
  temperaturas_medias <- lapply(ciudades, function(ciudad) {
    datos_ciudad <- subset(datos, ciudad == datos$ciudad)
    return(datos_ciudad$temperatura_media)
  })
  names(temperaturas_medias) <- ciudades
  
  # Calcular la temperatura media mensual por ciudad
  temperatura_media_mensual <- sapply(temperaturas_medias, mean)
  
  # Identificar la ciudad con la temperatura media más alta
  ciudad_mas_caliente <- names(which.max(temperatura_media_mensual))
  
  # Generar el resumen
  generar_resumen(temperaturas_medias, ciudad_mas_caliente)
}

# Función para generar el archivo de resumen
generar_resumen <- function(temperaturas_medias, ciudad_mas_caliente) {
  # Abrir el archivo para escribir
  con <- file("resumen_temperaturas.txt", "w")
  
  writeLines("Temperaturas medias diarias por ciudad:", con)
  
  # Escribir las temperaturas medias por ciudad
  for (ciudad in names(temperaturas_medias)) {
    linea <- paste(ciudad, ": ", paste(round(temperaturas_medias[[ciudad]], 2), collapse = ", "), sep="")
    writeLines(linea, con)
  }
  
  writeLines("\nCiudad con la temperatura media más alta del mes: ", con)
  writeLines(ciudad_mas_caliente, con)
  
  # Cerrar el archivo
  close(con)
}

# Llamar a la función principal
procesar_temperaturas("temperaturas.csv")