
# Cargar librerias --------------------------------------------------------

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# Marco de datos ----------------------------------------------------------

penguins
glimpse(penguins)

# Grafico ------------------------------------------------------------------
#inicio del grafico
ggplot(data = penguins)
# ejes 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)
# dispersion
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
#variables
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()
#curvas
#dentro del primer ggplot() es global (afecta a todas las capas)
#dentro de un geom_*() es local (solo afecta a esa capa)

# curvas ------------------------------------------------------------------
#Mapeo Global
#color = species en la función principal: "Quiero que todo lo que venga después se separe por colores según la especie".
#Resultado en el gráfico:

#geom_point() dibujará puntos de diferentes colores.

#geom_smooth() dibujará una línea de regresión distinta para cada especie (3 líneas en total si hay 3 especies), cada una con el color correspondiente.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")

#Mapeo Local
#geom_smooth() no "ve" el mapeo de color porque no está en la raíz global
#geom_point() dibujará puntos de diferentes colores.
#geom_smooth() dibujará una sola línea de regresión gris que atraviesa a todos los puntos, calculando la tendencia general de toda la población sin distinguir especies.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

# formas diferentes para cada especie de pingüino y mejorar las etiquetas
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")
#etiquetas a nuestro grafico
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()


# EJERCICIOS --------------------------------------------------------------

# 1 ¿Cuántas filas hay? ¿Cuántas columnas?penguins?
nrow(penguins)
ncol(penguins)

#HELP
#2 ¿Qué describe la variable en el marco de datos?
?penguins
#bill_length_mm : longitud del pico en milimetros
# bill_depth_mm : altura del pico en milimetros 

#3 diagrama de dispersión con en el eje y y en el eje x. Describe la relación entre estas dos variables 

# bill_depth_mmbill_length_mmbill_depth_mmbill_length_mm
#inicio del grafico 
ggplot(data = penguins)
#ejes
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
)

#dispersion
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point()

#los pingüinos con picos más profundos tienden a tener picos más cortos e inversamente los picos más largos suelen ser menos profundos. También existen casos donde no se cumplen esto.

#4 ¿Qué ocurre si haces un gráfico de dispersión de vs. ? 
ggplot(data = penguins) +
  geom_point(mapping = aes(x = species, y = bill_depth_mm))

no podemos ver la relacion entre variables solo vemosel max y min que llega
#¿Cuál podría ser una mejor opción de geom?speciesbill_depth_mm

ggplot(data = penguins, mapping = aes(x = species, y = bill_depth_mm)) +
  geom_boxplot()
#un Boxplot nos puede dar mas informacion, podemos ver en que medida se ubica la mayoria juntos a su mediana

#5 ¿Por qué lo siguiente da un error y cómo lo solucionarías?

#ggplot(data = penguins) + 
  geom_point()
  el error esta en que no especifica los ejes, se beria agregar aes(flipper_length_mm, body_mass_g)
  
#6 argumento : .na.rmgeom_point()TRUE
  #Elimina los valores no observados. 
  #El valor predeterminado es FALSE. 
  #Para que el argumento funcione con éxito, debe ir dentro de la función del geom (en este caso, geom_point), pero fuera de los paréntesis del aes(), ya que no es una variable, sino una configuración de la herramienta.
  
  ggplot(data = penguins, 
         mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
    geom_point(na.rm = TRUE)
  
#7pie de foto al gráfico: "Los datos provienen del paquete de palmerpenguins."
  #labs()
  
  #title: El título principal (arriba a la izquierda).
  
  #subtitle: Un texto más pequeño debajo del título.
  
  #x: Cambiar el nombre del eje X (por ejemplo, poner "Especies" en vez de "species").
  
  #y: Cambiar el nombre del eje Y.
  
  #caption: El pie de foto (abajo a la derecha).
  
  ggplot(data = penguins, 
         mapping = aes(x = species, y = bill_depth_mm)) +
    geom_boxplot(na.rm = TRUE) +
    labs(caption = "Los datos provienen del paquete de palmerpenguins.")
  
  
  ggplot(data = penguins, 
         mapping = aes(x = species, y = bill_depth_mm, fill = species)) +
    geom_boxplot(na.rm = TRUE) +
    labs(
      title = "Profundidad del pico por especie",
      subtitle = "Estudio en la Estación Palmer, Antártida",
      x = "Especie de Pingüino",
      y = "Profundidad del pico (mm)",
      caption = "Los datos provienen del paquete de palmerpenguins."
    )

  #8 bill_depth_mm
  #bill_depth_mm es una variable continua, tiene muchos valores distintos) R interpretaría que c/ valor es un "grupo" diferente.
  #geom_point -mira solo dentro de sus ()"voy a pintar c/ pto segun la profundidad del pico"
  #geom_smooth,mira los () globales, ve los ejesX e Y, simplemente dibuja una sola línea para todos los datos que tiene disponibles.
  #la estetica a asignar es a color, p/ diferenciar grupos o escalas numéricas.
  ggplot(data = penguins, 
         mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(mapping = aes(color = bill_depth_mm)) +
    geom_smooth()
  
  #9
  #island es una categoría, R usara distintos colores (a diferencia del degrado en caso de variable continua)
  #geom_point(): Pintará los puntos de tres colores según la isla
  #geom_smooth() lee que los datos estan dividiso por islas, dibujara 3 lineas
  #se = FALSE:pidiendo a R que quite la sombra gris (IC). Quedaran solo las líneas de color "limpias".
  
  ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
  ) +
    geom_point() +
    geom_smooth(se = FALSE)
#10 ¿Estos dos gráficos se verán diferentes? ¿Por qué o por qué no?  
  
#No se verán distintos. La única diferencia es que la segunda opción es redundante. R simplemente ejecutará las instrucciones locales de cada capa, las cuales coinciden con las globales del primer ejemplo, produciendo el mismo gráfico de dispersión con su línea de tendencia.
  
  ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
    geom_point() +
    geom_smooth()

  ggplot() +
    geom_point(
      data = penguins,
      mapping = aes(x = flipper_length_mm, y = body_mass_g)
    ) +
    geom_smooth(
      data = penguins,
      mapping = aes(x = flipper_length_mm, y = body_mass_g)
    ) 
  
  
# llamadas GGPLOT - ---------------------------------------------------------

  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
    geom_point()

  #parcelas + ejes + colores
  penguins |> 
    ggplot(aes(x = flipper_length_mm, y = body_mass_g)) + 
    geom_point()  
  
# visualización de distribución 4
  #distribucion de una variable categorica
  ggplot(penguins, aes(x = species)) +
    geom_bar()
  
  #ordenar barras segun su frecuencia 
  ggplot(penguins, aes(x = fct_infreq(species))) +
    geom_bar()
#distribuciones de variables continuas "histrograma"
  ggplot(penguins, aes(x = body_mass_g)) +
    geom_histogram(binwidth = 200)
#anchos de histogramas revelan patrones distintos
  #un ancho de bin de 20 es demasiado estrecho,resulta en demasiadas barras y dificulta determinar la forma de la distribución.Ancho de bin de 2.000 es demasiado alto, resulta en que todos los datos se agrupen en solo tres barras, dificulta determinar la forma de la distribución. Un ancho de contenedor de 200 proporciona un equilibrio sensato.x
  
  ggplot(penguins, aes(x = body_mass_g)) +
    geom_histogram(binwidth = 20)
  
  ggplot(penguins, aes(x = body_mass_g)) +
    geom_histogram(binwidth = 2000)
  
  #grafico de densidad (toma la forma del histograma, capta la forma de la distirbucion mas facil)
  ggplot(penguins, aes(x = body_mass_g)) +
    geom_density()

# 1-4-3 ejercicios  -------------------------------------------------------
#1Haz un gráfico de barras de , donde asignas a la estética. ¿En qué se diferencia esta trama?speciespenguinsspeciesy
  ggplot(data = penguins) +
    geom_bar(mapping = aes(y = species))
#al asignar la variable categorica al eje Y, el grafico pasa a ser un grafico de barras horizontales
  
  #geom_bar _> necesita solo una variable
  
#2 ¿En qué se diferencian las dos siguientes tramas? ¿Qué estética, o , es más útil para cambiar el color de las barras?colorfill
  #color cambia el color del contorno
  ggplot(penguins, aes(x = species)) +
    geom_bar(color = "red")
  
  #fill cambia el color del relleno
  ggplot(penguins, aes(x = species)) +
    geom_bar(fill = "red")
  
#3 ¿Qué hace el argumento en?binsgeom_histogram()
  #agrupa datos numéricos continuos en "cajones" o "contenedores" para contar cuántas observaciones caen en cada uno
  ggplot(penguins, aes(x = body_mass_g)) +
    geom_histogram(bins = 50, fill = "steelblue", color = "white")
  
#4 Haz un histograma de la variable en el conjunto de datos que está disponible cuando cargues el paquete de tidyverse. Experimenta con diferentes anchos de contenedor. ¿Qué ancho de contenedor revela los patrones más interesantes?caratdiamonds
  
  library(tidyverse)
  
  # 1. Binwidth grande (0.5): Visión general (macro)
  ggplot(diamonds, aes(x = carat)) +
    geom_histogram(binwidth = 0.5)
  
  # 2. Binwidth mediano (0.1): Empieza a verse la forma real
  ggplot(diamonds, aes(x = carat)) +
    geom_histogram(binwidth = 0.1)
  
  # 3. Binwidth muy pequeño (0.01): El patrón "interesante"
  ggplot(diamonds, aes(x = carat)) +
    geom_histogram(binwidth = 0.01)
  #antes de pasar a los diamantes de un quilate hay un "vacio", dando a entender que el mercado fuerza los pesos de los diamantes
  

# Variable numérica y categórica ------------------------------------------

#geom_boxplot()
  ggplot(penguins, aes(x = species, y = body_mass_g)) +
    geom_boxplot()
#grafico de densidad
  #linewidth grosor de lineas
  ggplot(penguins, aes(x = body_mass_g, color = species)) +
    geom_density(linewidth = 0.75)
  #transparencia a las curvas de densidad rellenas
  #stética toma valores entre 0 (completamente transparente) y 1 (completamente opaca)
  ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
    geom_density(alpha = 0.5)

# dos variable categoricas -----------------------------------------------
#gráficos de barras apiladas para visualizar la relación entre dos variables categóricas.
#se apilan las variables para ver cuanto espacio ocupa c/ una 
  
  
  ggplot(penguins, aes(x = island, fill = species)) +
    geom_bar()
  ggplot(penguins, aes(x = island, fill = species)) +
    geom_bar(position = "fill")
  ggplot(penguins, aes(x = island, fill = species)) +
    geom_bar(position = "fill") +
    labs(y = "proportion")  

# dos variables numericas -------------------------------------------------

#diagrama de dispersión el gráfico más utilizado para visualizar la relación entre dos variables numéricas.geom_point()geom_smooth()  
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point()

# tres o mas variables ----------------------------------------------------

#diagrama de dispersión los colores de los puntos representan especies y las formas de los puntos representan islas.
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(aes(color = species, shape = island))  
  #fórmulafacet_wrap()facet_wrap()3, que creas con seguida de un nombre de variable. La variable a la que pasas debe ser categórica.~facet_wrap()
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(aes(color = species, shape = species)) +
    facet_wrap(~island)

# 1.5.5 ejercicios --------------------------------------------------------
#1
  help(mpg)
#variables ¡categoricas - numericas?
  glimpse(mpg)
 # <chr> (character). Representan grupos  
 # <int> (entero) o <dbl> (decimal/double)

#2
# A. Mapear variable numérica a COLOR
  ggplot(mpg, aes(x = displ, y = hwy, color = cyl)) +
    geom_point()
  # B. Mapear variable numérica a SIZE
  ggplot(mpg, aes(x = displ, y = hwy, size = cyl)) +
    geom_point()  
  # C. Mapear variable numérica a COLOR y SIZE a la vez
  ggplot(mpg, aes(x = displ, y = hwy, color = cyl, size = cyl)) +
    geom_point()
  # D. Mapear variable numérica a SHAPE (¡Esto fallará!)
  ggplot(mpg, aes(x = displ, y = hwy, shape = cyl)) +
    geom_point()

  #color: variable numerica : degradado de colores 
        #variable categorica: distintos colores +
  #size.variable numerica: crece a medida que el n° aumenta
        #variable categorica: no es aconsejable
  #Forma (Shape): variable numerica: shape es por definicion p/ variables categoricas
                  #varibale categorica: asigna un simbolo distinto a c/ grupo
  #3
  #geom_point(): Entiende cosas como x, y, color, fill, shape y size.
  
  #linewidth: Es una estética diseñada para geometrías que tienen "líneas" como su elemento principal, por ejemplo geom_line(), geom_path()
  #linewidth es ignorado en los diagramas de dispersión tradicionales porque los puntos no se consideran "líneas"
  #no pasara nada agregando una 3era variable a "linewidth"
  
  #4 asignacion de varias esteticas a la misma variable
  #Los puntos serán de distinto color y c/ grupo tendrá un símbolo diferente.
  #Ayuda a las personas con daltonismo (que podrían no distinguir bien los colores)
  
  ggplot(mpg, aes(x = displ, y = hwy, color = class, shape = class)) +
    geom_point()
  
  #5 
  #diagrama de dispersion con color 
  ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
    geom_point()
#Dentro de cada especie individual, se observa que a medida que aumenta la longitud del pico (bill_length_mm), también tiende a aumentar su profundidad (bill_depth_mm)
  
  # faceta por especie
  ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
    geom_point() +
    facet_wrap(~species)
#permite concentrarse en la distirbucion especifica de c/ especie 
  
  #El color es mejor para comparar cómo se superponen o se diferencian los grupos en el mismo plano.
  
  #El facetado es mejor para examinar patrones internos de cada grupo sin ruido visual.
  
#6
  #las leyendas no coinciden porque su nombre no coincide
  #p/ ue dos estéticas (en este caso color y shape) se fusionen en una sola leyenda, deben tener el mismo título
  
  #ambas estetitcas deberan tener el nombre en f. labs()
  # "s" VS "S"
  ggplot(
    data = penguins,
    mapping = aes(
      x = bill_length_mm, y = bill_depth_mm, 
      color = species, shape = species
    )
  ) +
    geom_point() +
    labs(color = "Species")
  
  #CORREGIDO
  ggplot(data = penguins, 
         mapping = aes(x = bill_length_mm, 
                       y = bill_depth_mm, 
                       color = species, 
                       shape = species)) +
    geom_point() +
    labs(
      color = "Species", # Título para el color
      shape = "Species"  # Título idéntico para la forma
    )

#7
  library(tidyverse)
  library(palmerpenguins)
  
  # Gráfico 1: Frecuencias Absolutas (Stack) . Cantidad pinguinos segun especie hay en c/ isla
  ggplot(penguins, aes(x = island, fill = species)) +
    geom_bar()
  
  # Gráfico 2: Proporciones (Fill) . porcentaje de c/ especie en c/ isla
  ggplot(penguins, aes(x = island, fill = species)) +
    geom_bar(position = "fill")
  

# 1.6 guardando parcelas --------------------------------------------------

#guardará la gráfica creada más recientemente en disco:ggsave()  
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point()
  ggsave(filename = "penguin-plot.png") 


# 1.6.1 ejercicios --------------------------------------------------------

#1. se guardara la que us ela funcion "ggsave"
  ggplot(mpg, aes(x = class)) +
    geom_bar()
  ggplot(mpg, aes(x = cty, y = hwy)) +
    geom_point()
  ggsave("mpg-plot.png")

#2 guardar la gráfica como PDF en lugar de PNG
  # Antes (PNG)
  ggsave("mi_grafico.png")
  
  # Ahora (PDF)
  ggsave("mi_grafico.pdf")
  
  #PNG (Mapa de bits): Está hecho de píxeles. Si lo agrandas mucho, se ve "pixelado" o borroso. Es genial para presentaciones rápidas o web.
  
  #PDF / SVG (Vectorial): Está hecho de fórmulas matemáticas. Puedes agrandarlo al tamaño de un edificio y las líneas y letras se verán perfectamente nítidas
  #ggsave() sin especificar qué gráfico quieres guardar, R siempre guardará el último que apareció en tu ventana de "Plots"
  
  