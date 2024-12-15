

#Vamos a trabajar con distintos tipos de ficheros que vamos a ir almacenando en 
#la carpeta data/

#Dentro de /data hay tres carpetas: "/texto_plano", "/excel", "/archivos_r"

###---------------------
#FICHEROS DE TEXTO PLANO

#Vamos conociendo de forma progresiva los diferentes parametros de entrada de la funcion
df <- read.table(file = "data/texto_plano/venta_diaria.csv")
head(df)
df <- read.table(file = "data/texto_plano/venta_diaria.csv",header = T)
head(df)
df <- read.table(file = "data/texto_plano/venta_diaria.csv",header = T, sep = ",")
head(df)
df <- read.table(file = "data/texto_plano/venta_diaria.csv",header = T,sep = ",", dec = ".")
head(df)
df <- read.table(file = "data/texto_plano/venta_diaria.csv",header = T,sep = ",", dec = ".",
           col.names = c("product","store","day","units","price"))
head(df)
df <- read.table(file = "data/texto_plano/venta_diaria.csv",header = T,sep = ",",dec = ".",
                 colClasses = c("character","numeric","Date","numeric","numeric"))
head(df)
df <- read.table(file = "data/texto_plano/venta_diaria.csv",header = T,sep = ",",dec = ".",
                 na.strings = "NA")
head(df)

#Los casos particulares de la funcion read.table
read.csv("data/texto_plano/venta_diaria.csv")
read.csv2("data/texto_plano/venta_diaria.csv")
read.delim("data/texto_plano/venta_diaria.csv")
read.delim2("data/texto_plano/venta_diaria.csv")


#Exportamos con la funcion generica write.table explorando sus parametros
write.table(x = df, file = "data/texto_plano/dato_exportado_table.csv", sep = ",", dec = ".",
            na = "NA", row.names = F, col.names = T)

#Los casos particulares
write.csv(df, "data/texto_plano/dato_exportado_csv.csv", row.names = F)
write.csv2(df, "data/texto_plano/dato_exportado_csv2.csv", row.names = F)

#Como no existen las funciones de escritura para los casos delim podemos contruirlas nosotros
write.table(x = df, file = "data/texto_plano/dato_exportado_tsv.csv", sep = "\t", dec = ".",
            row.names = F)


#Vamos a partir el dataframe en dos ficheros, uno para cada tienda
write.csv(df[df$TIENDA==24512,], "data/texto_plano/venta_diaria_24512.csv", row.names = F)
write.csv(df[df$TIENDA==14526,], "data/texto_plano/venta_diaria_14526.csv", row.names = F)


###---------------------
#FICHEROS DE EXCEL

#install.packages("openxlsx")
library(openxlsx)

#Vamos a empezar con la escritura. Exportamos df en un excel.
openxlsx::write.xlsx(x = df,file = "data/excel/venta_diaria.xlsx", 
           sheetName = "venta_diaria",
           colNames = T, rowNames = F)

#Creamos un dataframe que solo tiene las ventas de la tienda 14526
df_tienda_14526 <- df[df$TIENDA==14526,]
df_tienda_24512 <- df[df$TIENDA==24512,]

#Exportamos ambos dataframes en el mismo excel. Uno en cada sheet.
lista_dataframes = list("TIENDA_14526" = df_tienda_14526, "TIENDA_24512" = df_tienda_24512)
openxlsx::write.xlsx(lista_dataframes, file = "data/excel/venta_diaria_por_tienda.xlsx",
           rowNames = FALSE)


#Leemos el excel venta_diaria.xlsx
openxlsx::read.xlsx("data/excel/venta_diaria.xlsx", sheet = "venta_diaria", startRow = 1,
                    colNames = T)


###---------------------
#FICHEROS DE FORMATO R
#RDS
#Los RDS nos permiten guardar una unica variable de R
saveRDS(object = df, file = "data/archivos_r/df.rds")

#Borramos el dataframe df del entorno
remove(df)

#Cargamos el archivo rds
df <- readRDS(file = "data/archivos_r/df.rds")


#RDATA
#Los RData nos permiten guardar una o más variables de R
save(df_tienda_14526,df_tienda_24512, file="data/archivos_r/tiendas_14526_24512.RData")

#Eliminamos los dataframes de ambas tiendas
remove(df_tienda_14526,df_tienda_24512)

#Los volvemos a cargar
load("data/archivos_r/tiendas_14526_24512.RData")

#Por ultimo, existe la opcion de guardar todo el entorno de golpe (todas sus variables)
#en un objeto RData
save.image("data/archivos_r/entorno.RData")

#Borramos todas las variables
remove(list = ls())

load("data/archivos_r/entorno.RData")
