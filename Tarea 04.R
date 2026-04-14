
# transformacion de un marco de datos -------------------------------------

# librerias ---------------------------------------------------------------

library(nycflights13)
library(tidyverse)


# Notas -------------------------------------------------------------------
#glimpse() mirada rapida y compacta de los datos
#dplyr (funciones): El primer argumento siempre es un marco de datos.
        #Los argumentos posteriores suelen describir sobre qué columnas operar usando los nombres de las variables (sin comillas).
        #La salida siempre es un nuevo marco de datos.      
        #Los verbos de dplyr se organizan en cuatro grupos según lo que operan: filas, columnas, grupos o tablas.
flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )
#filter() te permite mantener filas basadas en los valores de las columnas1.
flights |> 
  filter(dep_delay > 120)
flights |> 
  filter(month == 1 & day == 1)
#dplyr ejecuta la operación de filtrado, creando un nuevo marco de datos y luego lo imprime. No modifica el conjunto de datos existente porque las funciones de dplyr nunca modifican sus entradas

#guardar el resultado, necesitas usar el operador de asignación, :filter()flights<-
jan1 <- flights |> 
  filter(month == 1 & day == 1)
#arrange() cambia el orden de las filas en función del valor de las columnas
flights |> 
  arrange(year, month, day, dep_time)
#desc()arrange() orden descendente
flights |> 
  arrange(desc(dep_delay))
#distinct() Compara c/ fila completa.Si todos los valores de una fila coinciden con otra, elimina la duplicada.
# |> (pipe) y la función distinct(), toda la tabla de vuelos y, si encontrás dos filas que sean exactamente iguales en todas sus columnas, dejá una sola y borrá las demás
#keep_all = TRUE si conservas las otras columnas al filtrar filas únicas


# ejercicios 3.3.5 --------------------------------------------------------
#1 
# |> = pipe "y luego"
flights |> 
  select(dep_time, sched_dep_time, dep_delay)

#la relacion es la diferencia entre la hora programada del vuelo y a la hra que realmente salio, esto da como rdo el delay.
#p/ que la resta de bien hay que convertir las horas en minutos

#2
#enumerandola
flights |> 
  select(dep_time, dep_delay, arr_time, arr_delay)

# Selecciona dep_time, dep_delay y todo lo que haya en el medio hasta arr_delay ":"
flights |> 
  select(dep_time:arr_delay)
# Coincidencia de nombre
flights |> 
  select(starts_with("dep"), starts_with("arr"))
#usando vector de caracteres

mis_columnas <- c("dep_time", "dep_delay", "arr_time", "arr_delay")

flights |> 
  select(all_of(mis_columnas))

#3 RTA:R la ignorara una vez que ya se haya mencionado
flights |> 
  select(dep_time, sched_dep_time, dep_time, dep_time)
#4 
#any_of() toma un vector de caracteres y selecciona todas las columnas del dataset cuyos nombres coincidan con los elementos de ese vector

#all_of(): Si una de las palabras del vector NO está en el dataset, el código se rompe y te da error

#any_of(): Si una palabra no está, simplemente la ignora y selecciona las que sí encontró. No da error

# Util:"Traeme todas estas variables que tengo en mi lista, y si alguna no está, no te hagas drama, traeme las que encuentres".

#5
#Los ayudantes de selección (como contains(), starts_with(), ends_with(), etc.): ignoran las mayúsculas y minúsculas por defecto.
#tienen un argumento interno llamado ignore.case que, si no le dices nada, siempre está configurado como TRUE.
# si quiero encontrar con exactitud, cambiar el argumento ignore.case a FALSE

#6
#rename() y relocate() primero le cambiás el nombre y luego le decís a R que mueva la columna al principio.

flights |> 
  rename(air_time_min = air_time) |> 
  relocate(air_time_min)
#7 caso de columnas perdidas: intenta ordenar una tabla con una columna que acaba de borrar
flights |> 
  select(tailnum) |> 
  arrange(arr_delay)

#flight: datos completos
#select: "quedate solo con "tailnum"
#arrange: ordena algo que ya no esta por usar "select"


# tuberia -----------------------------------------------------------------

encontrar los vuelos más rápidos al aeropuerto IAH de Houston: necesitas combinar , , , y :filter()mutate()select()arrange()
flights |> 
  filter(dest == "IAH") |> 
  mutate(speed = distance / air_time * 60) |> 
  select(year:day, dep_time, carrier, flight, speed) |> 
  arrange(desc(speed))


# 3.5.7 ejercicios --------------------------------------------------------
#1
flights |> 
  group_by(carrier) |> 
  summarize(promedio_retraso = mean(arr_delay, na.rm = TRUE)) |> 
  arrange(desc(promedio_retraso))
#operadora con peores retrasos :F9: 21.9  FL:20.1  
#efectos mezclados, colinealidad: aereopuertos VS transportistas
#aeropuerto: todas las aerolineas tendran retrasos
# si aerolinea tiene retrasos en todos los aereopuertos, mal transportista

#2 Busca los vuelos que más retrasos se retrasan al salir a cada destino.

flights |> 
  group_by(dest) |> 
  filter(dep_delay == max(dep_delay, na.rm = TRUE)) |> 
  select(dest, carrier, flight, dep_delay, sched_dep_time)

#filter(dep_delay == max(...)): Dentro de cada uno de esos montoncitos, R busca cuál es el valor más alto de retraso (max) y se queda solo con esa fila
#select(...): Limpiamos la vista para ver solo lo importante: el destino, la aerolínea, el número de vuelo y cuánto se retrasó.
#los vuelos con mas retraso es de HNL a HA

#3
library(tidyverse)
library(nycflights13)

flights |> 
  group_by(hour) |> 
  summarize(promedio_retraso = mean(dep_delay, na.rm = TRUE)) |> 
  ggplot(aes(x = hour, y = promedio_retraso)) +
  geom_line(color = "blue", size = 1) +
  geom_point() +
  labs(
    title = "Retraso promedio de salida por hora del día",
    x = "Hora del día (formato 24h)",
    y = "Retraso promedio (minutos)"
  ) +
  theme_minimal()

#el pico de retrasos suele darse entre las 19 y 21 hras

#4
#Si usas un número negativo en slice_min() (o en slice_max()), R hace lo opuesto a lo habitual: en lugar de quedarse con las filas, las elimina
#util p/ limpiar outliers

# Esto te devuelve todos los vuelos MENOS los 10 que menos se retrasaron
flights |> 
  slice_min(dep_delay, n = -10)

#5
#count() wrapper: combina varios verbos en una sola palabra
#count() es la unión de group_by() + summarize()
#a
flights |> count(dest)
#b
flights |> 
  group_by(dest) |> 
  summarize(n = n())
#a y b piden lo mismo

#count() devuelve resultados en orden(o por orden alfabético del grupo). Si agregás sort = TRUE, le estás sumando un tercer verbo al combo: arrange().
#sort = TRUE: Ordena automáticamente los resultados de mayor a menor (descendente)
#"Combo" de count(var, sort = TRUE) es:
#group_by(var): "Juntame los iguales"
#summarize(n = n()): "Contame cuántos hay"
#arrange(desc(n)): "Poneme el más grande primero"

#6
df <- tibble(
  x = 1:5,
  y = c("a", "b", "a", "a", "b"),
  z = c("K", "K", "L", "L", "K")
)
# a- df |> group_by(y), da el mismo marco de datos, pero con una pequeña línea extra de texto arriba
df |> 
  group_by(y)
#El resultado visual es idéntico al dataframe original, pero se han añadido metadatos de agrupamiento. Esto no cambia los valores ni el orden de las filas, sino que altera cómo las funciones posteriores (como summarize) procesarán los datos, obligándolas a operar de forma independiente para cada nivel de la variable y

#b ordenara las filas
df |>
  arrange(y)
#group_by() solo añade metadatos p/ cálculos posteriores sin alterar la apariencia del dataframe, arrange() realiza un cambio físico en el orden de las filas basándose en los valores de la columna seleccionada, pero no crea una estructura de grupos para funciones de resumen

#c sacara el promedio de los grupos
df |>
  group_by(y) |>
  summarize(mean_x = mean(x))
#group_by |> summarize crea información nueva (el promedio) y descarta las filas individuales
#cadena de pasos conectados por el símbolo |>

#d a ser lo mismo que antes no cambia nada, esta vez usa la tuberia pepeline p/ que vaya todo junto

df |>  
  group_by(y, z) |>  
  summarize(mean_x = mean(x))

#pipeline: Realiza un agrupamiento anidado (por y y luego por z) y calcula el promedio de x para cada combinación única.
#no tenia razon
#(a)1 capa: Al hacer group_by(y), creo un solo nivel de grupos.summarize(), R "consumió" ese nivel para darte el promedio y la tabla quedó limpia (sin grupos).
#(d)2 capas: Al hacer group_by(y, z), creo un agrupamiento anidado (un grupo dentro de otro).
# summarize elimino Z y apartir de ahora solo trabajara con Y,  esta f. reduce dimensiones|

#e en vez de dejarlos agrupados como paso en el pto d,deja los datos como estaban, "limpia parte del proceso"

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x), .groups = "drop")
# d memoria de grupos , e sin memoria
# |> realiza el mismo papel que en d

#f
#agrupara en grupos y sacara su media, eliminando columnas de la tabla
df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

# agrupara , sacara media y agregara columna a la tabla con la media 
df |>
  group_by(y, z) |>
  mutate(mean_x = mean(x))

#summariza: filas (una por c/ combinación única) y las columnas originales desaparecerán, dejando solo las de agrupación y la nueva mean_x
#mutate: Resultado mantendrá las 5 filas originales. La columna mean_x se agregará al final, repitiendo el valor del promedio en c/ fila que pertenezca al mismo grupo

#Pipeline de summarize:Agrupa los datos en subconjuntos basados en y y z.
 #Reduce cada subconjunto a una sola fila con el cálculo estadístico (mean).
 #Descarta el detalle individual de las filas originales.

#Pipeline de mutate: Agrupa los datos de la misma forma.
#Calcula el promedio dentro de c/ grupo, pero preserva todas las filas.
#Asocia el resultado del grupo a c/ registro original, permitiendo comparar, por ejemplo, un valor individual contra el promedio de su grupo en la misma tabla.

#diferencia fundamental entre las dos tuberías es el destino de las filas originales


# 19.2.4 ejercicios -------------------------------------------------------

#1 flecha que salga desde origin (tabla weather) y apunte a faa (tabla airports).
#el aereopuerto e sel lugar fisico de origen

#2 si tuviera info de todos los aerepuertos, weather se conectaria con hra de llegada programada y destino

#3 cambios de horarios de verano
#dataset registra la hora, pero no incluye la zona horaria- cambio de horario de verano
library(nycflights13)
library(dplyr)

weather |> 
  group_by(year, month, day, hour, origin) |> 
  filter(n() > 1) |>
  select(year, month, day, hour, origin, temp, humid, time_hour)
#Si intentás hacer un left_join() usando solo year, month, day, hour y origin, R va a detectar que hay una relación de "uno a muchos" en ese punto y te va a duplicar las filas de los vuelos que salieron a esa hora, lo que te puede arruinar cualquier cálculo de promedio o suma.
#solución: Siempre es mejor usar la columna time_hour como clave de unión, ya que es la única que identifica de forma unívoca cada momento del año.

#4
#p/ representar días especiales (feriados o fechas de baja demanda),ideal crear una tabla de referencia que puedas cruzar con tus datos de vuelos.

dias_especiales <- tibble(
  fecha = as.Date(c("2013-12-24", "2013-12-25", "2013-01-01", "2013-07-04")),
  nombre_evento = c("Nochebuena", "Navidad", "Año Nuevo", "Día de la Independencia"),
  es_feriado = TRUE
)

dias_especiales

#clave primaria sería la columna fecha. En esta tabla de referencia, c/ fecha aparece una sola vez. No tiene sentido tener dos filas para el mismo "25 de diciembre de 2013". La fecha identifica de forma unívoca c/fila de esta tabla

#Para conectarla con la tabla flights del paquete nycflights13:
#Usando una columna de fecha:crear una columna de tipo fecha en flights (porque originalmente vienen año, mes y día por separado) y luego hacer un left_join

#Un left_join() es una operación de combinación de datos que se usa para unir dos tablas basándose en una columna común (una "llave" o "key")

#5 
install.packages("Lahman")
library(Lahman)
# Asignamos a objetos para verlos en el Environment
personas <- People
bateo <- Batting
salarios <- Salaries
directivos <- Managers
premios_dir <- AwardsManagers
lanzamientos <- Pitching
defensa <- Fielding

#diagrama Jugadores - Sueldos
# Unimos la info personal con el bateo y el sueldo
# Usamos playerID como puente principal
jugadores_sueldos <- bateo |> 
  left_join(personas, by = "playerID") |> 
  left_join(salarios, by = c("playerID", "yearID", "teamID"))

# Ver las primeras filas del resultado
head(jugadores_sueldos)

## Unimos la info personal con el bateo y el sueldo
# Usamos playerID como puente principal
jugadores_sueldos <- bateo |> 
  left_join(personas, by = "playerID") |> 
  left_join(salarios, by = c("playerID", "yearID", "teamID"))

#Managers -sueldos
manager_exitosos <- directivos |> 
  inner_join(premios_dir, by = c("playerID", "yearID")) |> 
  left_join(personas, by = "playerID") |> 
  select(nameFirst, nameLast, yearID, awardID)

head(manager_exitosos)

#código para unirlas requiere usar la clave compuesta (playerID, yearID, stint)
perfil_completo <- bateo |> 
  full_join(lanzamientos, by = c("playerID", "yearID", "stint")) |> 
  full_join(defensa, by = c("playerID", "yearID", "stint"))
# 19.3.4
#1

# Identificamos las 48 horas con el mayor retraso promedio de salida
peores_48_horas <- flights |>
  group_by(year, month, day, hour) |>
  summarize(retraso_promedio = mean(dep_delay, na.rm = TRUE), .groups = "drop") |>
  slice_max(retraso_promedio, n = 48)

# Unimos con los datos de clima
analisis_clima <- peores_48_horas |>
  inner_join(weather, by = c("year, month, day, hour"))

# Vemos un resumen de las condiciones climáticas en esas horas
summary(analisis_clima |> select(temp, wind_speed, precip, visib))

#Visibilidad Crítica: En la mayoría de las 48 horas con más retrasos, variable visib (visibilidad) cae significativamente. Muchos de los grandes retrasos ocurren con visibilidad menor a 2 o 3 millas debido a niebla densa o tormentas.

#2
library(nycflights13)
library(dplyr)

vuelos_destinos_top <- flights |> 
  semi_join(top_dest, by = "dest")

top_dest <- flights |> 
  count(dest, sort = TRUE) |> 
  head(10)
vuelos_destinos_top <- flights |> 
  semi_join(top_dest, by = "dest")
unique(vuelos_destinos_top$dest)

#El semi-join es como un filtro inteligente. Mantiene todas las filas de la tabla de la izquierda (flights) que tienen una coincidencia en la tabla de la derecha (top_dest), pero no agrega columnas nuevas ni duplica filas.

#Usando el operador %in% (La opción intuitiva)
#en términos de "pertenencia a una lista", puedes filtrar la columna de destinos basándote en los valores que están en tu tabla top_dest.
#inner_join()
#join tradicional. Este método sí agregará la columna n (el conteo de vuelos) a cada fila de tu resultado.
#
#3
#tabla weather registra el clima hra por hra (exactamente a las 1:00, 2:00, 3:00, etc.). Los vuelos, en cambio, salen en cualquier momento (ej: 13:42)
#join por la columna hour, R busca la hora redonda. 
#Si por alguna razón técnica el sensor del aeropuerto no registró datos justo en esa hora puntual, el vuelo se queda con un NA
#weather solo tiene datos de los tres aeropuertos principales de Nueva York (EWR, JFK, LGA)
#Si hubiera algún registro de vuelo con un origen distinto, no habría correspondencia climática.

#4

#Al analizar los vuelos que no tienen un registro coincidente en la tabla de aviones (planes), el patrón es claro.Un anti_join() entre flights y planes, la gran mayoría de los vuelos "huérfanos" comparten una característica común.

#La variable que explica aproximadamente el 90% de los problemas es carrier (la aerolínea)

# 1. Buscamos los vuelos cuyos aviones no están en la tabla 'planes'
vuelos_sin_avion <- flights |> 
  anti_join(planes, by = "tailnum")

# 2. Contamos cuántos faltantes tiene cada aerolínea
vuelos_sin_avion |> 
  count(carrier, sort = TRUE) |> 
  mutate(porcentaje = n / sum(n) * 100)

#AA y MQ concentran casi la totalidad de las filas.
#resultados para American Airlines van a estar vacíos o sesgados porque sus aviones no "existen" en tabla de referencia

#5
# Creamos una tabla que mapea cada avión con sus aerolíneas
aviones_y_carriers <- flights |>
  filter(!is.na(tailnum)) |> # Quitamos vuelos sin número de cola
  group_by(tailnum) |>
  summarize(aerolineas = paste(unique(carrier), collapse = ", "),
            cantidad = n_distinct(carrier))

# Añadimos esta info a la tabla de vuelos (o a la de planes)
flights_enriquecido <- flights |>
  left_join(aviones_y_carriers, by = "tailnum")
#hipótesis es: "Cada avión es operado por una sola aerolínea"
#Si esto fuera cierto, la columna cantidad que creamos arriba debería ser siempre 1. 
#Vamos a verificarlo buscando casos donde sea mayor a 1

# Buscamos aviones que hayan sido operados por más de una aerolínea
aviones_compartidos <- aviones_y_carriers |>
  filter(cantidad > 1)

# Vemos cuántos son
nrow(aviones_compartidos)

# Miramos algunos ejemplos
head(aviones_compartidos)

Aunque la gran mayoría de los aviones operan para una sola compañía, los datos muestran que existen aviones que volaron para más de una aerolínea en el mismo año (2013)

#Relación entre tailnum y carrier no es una relación de 1 a 1 pura, sino una relación de muchos a muchos (aunque muy desbalanceada hacia el 1 a 1)

#6
#Para sumar esta información a la tabla flights, primero necesitamos la tabla de referencia airports, que contiene las coordenadas geográficas.
# Es mucho más fácil renombrar ANTES de unirse
flights_ubicacion <- flights |> 
  # 1. Unimos el origen
  left_join(
    airports |> select(faa, lat_orig = lat, lon_orig = lon), 
    by = c("origin" = "faa")
  ) |> 
  # 2. Unimos el destino
  left_join(
    airports |> select(faa, lat_dest = lat, lon_dest = lon), 
    by = c("dest" = "faa")
  )

# Verificamos las nuevas columnas
flights_ubicacion |> 
  select(year:day, origin, dest, lat_orig, lon_orig, lat_dest, lon_dest) |> 
  head()

#es más fácil renombrar las columnas ANTES de unirse
#Si te unís a la tabla airports sin renombrar, R te va a traer columnas llamadas lat y lon.
#Al intentar unirte por segunda vez (para el destino), R detectará que ya existen columnas con esos nombres y les agregará sufijos automáticamente (como lat.x y lat.y)
#select(faa, lat_orig = lat, ...) dentro del left_join, solo traés las columnas que necesitás y ya con el nombre "limpio". Esto mantiene tu data frame principal más ordenado desde el primer momento
#by: Como estás uniendo la misma tabla de referencia (airports) a dos columnas distintas de tu tabla principal (origin y dest), renombrar antes te permite saber exactamente qué coordenada pertenece a qué punto del viaje

#7

# 1. Calculamos el retraso medio por destino
retraso_por_destino <- flights |>
  group_by(dest) |>
  summarize(retraso_medio = mean(arr_delay, na.rm = TRUE))

# 2. Nos unimos a la tabla de aeropuertos para obtener latitud y longitud
# Usamos inner_join para quedarnos solo con los aeropuertos que tienen vuelos
mapa_datos <- airports |>
  inner_join(retraso_por_destino, by = c("faa" = "dest"))

# 3. Dibujamos el mapa usando color para el retraso medio
mapa_datos |>
  ggplot(aes(x = lon, y = lat, color = retraso_medio)) +
  borders("state") +
  geom_point(alpha = 0.7, size = 3) +
  scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  coord_quickmap() +
  labs(
    title = "Distribución Espacial de los Retrasos de Llegada",
    subtitle = "Vuelos desde NYC en 2013",
    color = "Retraso Medio (min)",
    x = "Longitud",
    y = "Latitud"
  )
#mean(arr_delay, na.rm = TRUE). Es fundamental incluir na.rm = TRUE porque los vuelos cancelados tienen NA en el retraso y, si no los ignoramos, el promedio de todo el aeropuerto daría NA.

#La Unión (inner_join): Al unir airports con nuestra tabla de retrasos, filtramos automáticamente los aeropuertos que no reciben vuelos desde Nueva York, limpiando el mapa.

#Color: Usar scale_color_gradient2 es muy útil porque nos permite poner un color (ej. azul) para los vuelos que llegan adelantados (retraso negativo) y otro (rojo) para los que llegan tarde.

#Distribución: Al ver el mapa, notarás que ciertos destinos (como los del centro o la costa oeste) podrían tener patrones distintos debido a la distancia o a las rutas climáticas.

#8
# 1. Filtramos por el día exacto y calculamos el retraso promedio por destino
datos_13_junio <- flights |>
  filter(year == 2013, month == 6, day == 13) |>
  group_by(dest) |>
  summarize(retraso_medio = mean(arr_delay, na.rm = TRUE), .groups = "drop")

# 2. Unimos con 'airports' para obtener latitud y longitud
mapa_13_junio <- airports |>
  inner_join(datos_13_junio, by = c("faa" = "dest"))

# 3. Dibujamos el mapa
mapa_13_junio |>
  ggplot(aes(x = lon, y = lat, color = retraso_medio)) +
  borders("state") +
  geom_point(alpha = 0.8, size = 4) +
  scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  coord_quickmap() +
  labs(
    title = "Retrasos de Llegada en EE.UU. el 13 de Junio de 2013",
    subtitle = "Vuelos con origen en NYC (EWR, JFK, LGA)",
    color = "Retraso Medio (min)",
    x = "Longitud",
    y = "Latitud"
  ) +
  theme_minimal()

#el mapa está lleno de puntos rojos y naranjas intensos, especialmente en la mitad este y el sureste de Estados Unidos. Esto indica que ese día hubo retrasos masivos y generalizados, no casos aislados. Los promedios superan los 60-90 minutos en muchos aeropuertos clave

#Ese día, el este de Estados Unidos sufrió una serie de tormentas eléctricas severas generalizadas.

#No fue una simple lluvia; vientos con fuerza de huracán en varias zonas de la costa atlántica media (Maryland, Virginia, Carolina del Norte).
#Granizo de gran tamaño.Tornados (incluso un tornado EF0 que pasó por los suburbios del norte de Washington D.C.).
#Este fenómeno es conocido técnicamente como un Derecho (un complejo de tormentas eléctricas que produce vientos dañinos en línea recta a lo largo de un camino de cientos de kilómetros). 
#Aunque en 2013 fue clasificado como un derecho de "baja intensidad", fue suficiente para paralizar el tráfico aéreo en todo el noreste y sureste del país, derribando líneas eléctricas y causando daños materiales.
