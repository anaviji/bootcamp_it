
#Importamos la libreria lubridate para usarla posteriormente
#En R solemos importar los paquetes al inicio del script
library(lubridate)

#Cargamos el csv venta diaria
df <- read.csv("data/texto_plano/venta_diaria.csv")

####----
#BUCLE FOR

#Vamos a crear una nueva variable con un bucle
for (indice in seq(1,nrow(df))){
  print(indice)
  # df[indice,"VENTAS"] = df[indice,"UNIDADES"] * df[indice,"PRECIO"]
}

#Vamos a comprobar cuantos domingos en el historico ha habido ventas
#(las tiendas estaban abiertas)
for (dia in df$DIA){
  if(wday(dia)==1){
    # print("Hemos entrado en el condicional")
    # next()
    # break()
    print(paste0("El domingo ",dia," las tiendas estaban abiertas"))
  }
}

####----
#BUCLE WHILE

df_24512_2020 <- df[(year(df$DIA)==2020) & (df$TIENDA==24512),]
df_24512_2020 <- df_24512_2020[order(df_24512_2020$DIA),]
rownames(df_24512_2020) <- NULL
df_24512_2020

venta_2020 <- 0
indice <- 0
while(venta_2020<100000){
  indice <- indice + 1
  print(paste("Numero de iteracion numero",indice))
  if(!is.na(df_24512_2020[indice,"UNIDADES"])){
    venta_2020 <- venta_2020 + df_24512_2020[indice,"UNIDADES"]
  }
}
print(paste0("La tienda 24512 ha tardado ",indice, " dias en alcanzar ",venta_2020," unidades vendidas en 2020")) 
  
####----
#BUCLE REPEAT

venta_2020 <- 0
indice <- 0
repeat{
  indice <- indice + 1
  print(paste("Numero de iteracion numero",indice))
  if(!is.na(df_24512_2020[indice,"UNIDADES"])){
    venta_2020 <- venta_2020 + df_24512_2020[indice,"UNIDADES"]
  }
  if(venta_2020>=100000){
    break()
  }
}
print(paste0("La tienda 24512 ha tardado ",indice, " dias en alcanzar ",venta_2020," unidades vendidas en 2020")) 

