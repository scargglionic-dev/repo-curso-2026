
# ANAC --------------------------------------------------------------------

# cargar  librerias -------------------------------------------------------

library(tidyverse)
library(dplyr)
# datos -------------------------------------------------------------------

anac_2025 <- read_csv2(file = '202512-informe-ministerio-actualizado-dic-final.csv')

#aereopuertos

read_csv2(file="iata-icao.csv")

#clima

read_csv(file = "registro_temperatura365d_smn.txt")
#es txt, ¿esta encolumnado?si nos fijamos en los caracteres , pauta de como esta formteado no esta delimitado por espacios si no por tamaño fijo "formant"
clima <- read_fwf("registro_temperatura365d_smn.txt", 
                  col_positions = fwf_widths(
                    c(8, 1, 5, 1, 5, 200), 
                    c('fecha', 'x', 'tmax', 'y', 'tmin', 'nombre')
                  ),
                  skip = 3) |> 
  select(-x,-y)

glimpse(anac_2025)
clima[1:2,]
#revisar si podemos encontrar una relacion entre nombre de estacion metereologica y codigo aerepuerto

# analisis de datos -------------------------------------------------------

glimpse(anac_2025) #14 -> se lee de derecha izquiera, esta en el primer lugar d ela linea 14, si hacemos 14 pasos hacia la izquierda llegamos al principio de la linea
#si hacemos algo que se llama raping (envolver), pdodemos envolver la linea y podemos leer un salto d elinea, y se pueda leer todo en un contenedor(o se ala pantalla, ancho de pagina "81" caracteres)
#¿esta bien caracterizada la fehca? esta en formato caracter no e fecha, default de tudiverse toma mes, dia y año y no como nosotros mes, dia año.
#no lo puede interpretar como formato date y lo convierte en caracter
colnames(anac_2025)
#hacemos proceso de limpieaza a ANAC
glimpse(anac_2025)
anac_2025 <- anac_2025 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
  

summary(anac_2025)
###mutate as factor columnas utiles
#tarea hacer factores 


# datos -------------------------------------------------------------------


anac_2019 <-read_csv2("201912-informe-ministerio-actualizado-dic-final.csv")
anac_2020 <-read_csv2("202012-informe-ministerio-actualizado-dic-final.csv")
anac_2021 <-read_csv2("202112-informe-ministerio-actualizado-dic-final.csv")
anac_2022 <-read_csv2("202312-informe-ministerio-actualizado-dic.csv")
anac_2023 <-read_csv2("202312-informe-ministerio-actualizado-dic.csv")
anac_2024 <-as_tibble(read_csv2("202412-informe-ministerio-actualizado-dic-final.csv"))

glimpse(anac_2025)
glimpse(anac_2019)


# analsisis de datos ------------------------------------------------------

anac_2019 <- anac_2019 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
glimpse(anac_2019)

anac_2020 <- anac_2020 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
glimpse(anac_2020)

anac_2021 <- anac_2021 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
glimpse(anac_2021)

anac_2022 <- anac_2022 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
glimpse(anac_2022)

anac_2023 <- anac_2023 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
glimpse(anac_2023)

anac_2024 <- anac_2024 |>
  mutate(
    tipo_vuelo = factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelos = factor(`Clasificación Vuelo`),
    tipo_movimiento = factor(`Tipo de Movimiento`),
    aeropuerto = factor(Aeropuerto),
    origen_destino = factor(`Origen / Destino`),
    aerolinea = factor(`Aerolinea Nombre`),
    calidad_dato = factor(`Calidad dato`),
    aeronave=factor(Aeronave)
  )
glimpse(anac_2024)

summary(anac_2020$tipo_vuelo)
summary(anac_2019$tipo_vuelo)


# ¿Qué se observa en la pandemia? -----------------------------------------


library(tidyverse)

# Creamos un resumen para cada año
resumen_2019 <- as.data.frame(table(anac_2019$tipo_vuelo)) %>% mutate(anio = "2019")
resumen_2020 <- as.data.frame(table(anac_2020$tipo_vuelo)) %>% mutate(anio = "2020")

# Los unimos
comparativa <- bind_rows(resumen_2019, resumen_2020)
colnames(comparativa) <- c("Tipo_Vuelo", "Cantidad", "Año")

# Gráfico de Barras Comparativo
ggplot(comparativa, aes(x = reorder(Tipo_Vuelo, Cantidad), y = Cantidad, fill = Año)) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() + # Lo damos vuelta para que los nombres largos se lean bien
  theme_minimal() +
  labs(title = "Impacto de la Pandemia por Tipo de Vuelo",
       subtitle = "Comparativa 2019 vs 2020",
       x = "Categoría de Vuelo",
       y = "Cantidad de Movimientos") +
  scale_fill_manual(values = c("2019" = "steelblue", "2020" = "firebrick"))

#RTA: los vuelos regulares bajaron 5 veces a comparacion del 2019, el resto de los items tambien bajo, pero en menor medida
#"vuelo escuela" bajo disminuyo, se formaron menos pilotos en pandemia
#"vuelo oficial nacional" paso de  23689 en 2019 a 24577 en 2020, teniendo sentido por los vuelos sanitarios


# ¿Cuánto tiempo se tarda en recuperar flujos pre–pandemia? ----------------

# 1. Unimos todos los años (asegurándote de que tengan la columna 'fecha_limpia')
#unimos todos los años
anac_historico <- bind_rows(anac_2019, anac_2020, anac_2021, anac_2022, anac_2023, anac_2024, anac_2025)

# Convertimos Aeronave a texto en cada año para que coincidan
anac_2019 <- anac_2019 |> mutate(Aeronave = as.character(Aeronave))
anac_2020 <- anac_2020 |> mutate(Aeronave = as.character(Aeronave))
anac_2021 <- anac_2021 |> mutate(Aeronave = as.character(Aeronave))
anac_2022 <- anac_2022 |> mutate(Aeronave = as.character(Aeronave))
anac_2023 <- anac_2023 |> mutate(Aeronave = as.character(Aeronave))
anac_2024 <- anac_2024 |> mutate(Aeronave = as.character(Aeronave))
anac_2025 <- anac_2025 |> mutate(Aeronave = as.character(Aeronave))


anac_historico <- bind_rows(anac_2019, anac_2020, anac_2021, anac_2022, anac_2023, anac_2024, anac_2025)

# 2. Calculamos el volumen mensual
library(lubridate)
#a. Creamos la columna 'fecha_limpia' en el objeto total
# Usamos dmy() porque el formato de ANAC es Día/Mes/Año
anac_historico <- anac_historico %>%
  mutate(fecha_limpia = dmy(`Fecha UTC`))
#b. resumen mensual
evolucion_mensual <- anac_historico %>%
  group_by(mes_anio = floor_date(fecha_limpia, "month")) %>%
  summarise(total_vuelos = n())
# c. resultado
print(evolucion_mensual, n = 100)

library(ggplot2)

ggplot(evolucion_mensual, aes(x = mes_anio, y = total_vuelos)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "darkblue") +
  geom_hline(yintercept = 50000, linetype = "dashed", color = "red") + # Línea de referencia 2019
  theme_minimal() +
  labs(title = "Evolución Mensual de Vuelos en Argentina (2019-2025)",
       subtitle = "La línea roja marca el nivel prepandemia (~50k vuelos)",
       x = "Año",
       y = "Total de Vuelos")

#RTA: el mercado tardo 2 años en recuperarse hasta llegar nuevamente a los niveles del 2019, pero una vez cruzada esta barrera la duplico


# Se puede apreciar diferencias en los patrones de viajes antes/despues --------


# El 2022 fue el año en el que el mercado se recupero, pero duplico la cantidad total de vuelos respecto al 2019. Esto puede deberse a los incentivos de turismo interno como el "pre-viaje", las low cost como Flybondy 
#2024 el mercado volvio a los niveles prepandemia 