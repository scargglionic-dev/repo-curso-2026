"Hello World!"
#numeros
5+5
plot(1:10)
5
10
#util para usar con Pyhton
print("hello world")
for (x in 1:10) {
  print(x)
}
#comentarios
"hello word" #comentario
# This is a comment
# written in
# more than just one line
"Hello World!"
#creacion de variables 
name <- "John"
age <- 40

name   # output "John"
age    # output 40

#variables de impresion /salida
name <- "John Doe"

name # auto-print the value of the name variable

name <- "John Doe"

print(name) # print the value of the name variable

for (x in 1:10) {
  print(x)
}

#concatenar elementos 

text <- "awesome"

paste("R is", text)

text1 <- "R is"
text2 <- "awesome"

paste(text1, text2)

num1 <- 5
num2 <- 10

num1 + num2

num <- 5
text <- "Some text"

num + text

# Assign the same value to multiple variables in one line
var1 <- var2 <- var3 <- "Orange"

# Print variable values
var1
var2
var3

#nombres de variables
# Legal variable names:
myvar <- "John"
my_var <- "John"
myVar <- "John"
MYVAR <- "John"
myvar2 <- "John"
.myvar <- "John"

# Illegal variable names:
2myvar <- "John"
my-var <- "John"
my var <- "John"
_my_var <- "John"
my_v@ar <- "John"
TRUE <- "John"

#tipo de datos
my_var <- 30 # my_var is type of numeric
my_var <- "Sally" # my_var is now of type character (aka string)

#tipos basicos de datos
#numeric - (10.5, 55, 787)
#integer - (1L, 55L, 100L, donde la letra "L" declara esto como un entero)
#complex - (9 + 3i, donde "yo" es la parte imaginaria)
#character (también conocida como cadena) - ("k", "R es emocionante", "FALSO", "11.5")
#logical (también conocido como booleano) - (VERDADERO o FALSO)

# numeric
x <- 10.5
class(x)

# integer
x <- 1000L
class(x)

# complex
x <- 9i + 3
class(x)

# character/string
x <- "R is exciting"
class(x)

# logical/boolean
x <- TRUE
class(x)

#Números
#Existen tres tipos de números en R:
#numeric
#integer
#complex

x <- 10.5   # numeric
y <- 10L    # integer
z <- 1i     # complex

x <- 10.5
y <- 55

# Print values of x and y
x
y

# Print the class name of x and y
class(x)
class(y)

x <- 3+5i
y <- 5i

# Print values of x and y
x
y

# Print the class name of x and y
class(x)
class(y)

x <- 3+5i
y <- 5i

# Print values of x and y
x
y

# Print the class name of x and y
class(x)
class(y)

10 + 5
10 - 5

#Funciones matematicas integradas

max(5, 10, 15)

min(5, 10, 15)
#La función devuelve la raíz cuadrada de Un número:sqrt()
sqrt(16)
#a función devuelve el valor absoluto (positivo) de Un número:abs()
abs(-4.7)
#La función redondea un número hacia arriba a su entero más cercano, y la función redondea un número hacia abajo a su entero más cercano, y devuelve el resultado:ceiling()floor()
ceiling(1.4)

floor(1.4)

str <- "Hello"
str # print the value of str

#cuerdas multilinea
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."

str # print the value of str

str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."

cat(str)

#longitud de cuerda
#ra encontrar el número de caracteres en una cadena, use la función:nchar()

str <- "Hello World!"

nchar(str)

#revisa una cuerda
#para comprobar si hay un carácter o una secuencia de caracteres presente en una cadena:grepl()
str <- "Hello World!"

grepl("H", str)
grepl("Hello", str)
grepl("X", str)

#combinar dos cuerdas
Utiliza la función para fusionar/concatenar dos cadenas:paste()
str1 <- "Hello"
str2 <- "World"

paste(str1, str2)

#personajes de escape

#Para insertar caracteres ilegales en una cadena, debes usar un carácter escape.

#Un personaje de escape es una barra diagonal seguida del personaje que quieres insertar.\

#Un ejemplo de carácter ilegal es una doble comilla dentro de una cadena rodeada de comillas dobles:
  
str <- "We are the so-called "Vikings", from the north."

str 

#R booleanos / valores lógicos
#Booleanos (valores lógicos)
#a menudo necesitas saber si una expresión es verdadera o falsa.
#Puedes evaluar cualquier expresión en R, y obtener una de dos respuestas, o .TRUEFALSE
#Cuando comparas dos valores, se evalúa la expresión y R devuelve la respuesta lógica:

10 > 9    # TRUE because 10 is greater than 9
10 == 9   # FALSE because 10 is not equal to 9
10 < 9    # FALSE because 10 is greater than 9

a <- 10
b <- 9

a > b

a <- 200
b <- 33

if (b > a) {
  print ("b is greater than a")
} else {
  print("b is not greater than a")
}

#Operadores
Los operadores se utilizan para realizar operaciones sobre variables y valores

10 + 5
#+	Addition	x + y	
#-	Subtraction	x - y	
#*	Multiplication	x * y	
#/	Division	x / y	
#^	Exponent	x ^ y	
#%%	Modulus (Remainder from division)	x %% y	
#%/%	Integer Division	x%/%y

my_var <- 3

my_var <<- 3

3 -> my_var

3 ->> my_var

my_var # print my_varmy_var <- 3

my_var <<- 3

3 -> my_var

3 ->> my_var

my_var # print my_var

#R operadores logicos

#&	Element-wise Logical AND operator. Returns TRUE if both elements are TRUE
#&&	Logical AND operator - Returns TRUE if both statements are TRUE
#|	Elementwise- Logical OR operator. Returns TRUE if one of the statements is TRUE
#||	Logical OR operator. Returns TRUE if one of the statements is TRUE
#!	Logical NOT - Returns FALSE if statement is TRUE

#Creates a series of numbers in a sequence	x <- 1:10
#%in%	Find out if an element belongs to a vector	x %in% y
#%*%	Matrix Multiplication	x <- Matrix1 %*% Matrix2

#Condiciones e Sentencias If
#Ya sabes que R soporta condiciones de comparación conocidas de las matemáticas, como:
  
  Operator	Name	Example	Try it
#==	Equal	x == y	
#!=	Not equal	x != y	
#>	Greater than	x > y	
#<	Less than	x < y	
#>=	Greater than or equal to	x >= y	
#<=	Less than or equal to	x <= y	
#Estas condiciones pueden usarse de varias maneras, siendo las más comunes en sentencias "if" y bucles.

#La sentencia if
#Una sentencia "if" se escribe junto con la palabra clave, y se utiliza para especificar un bloque de código a ejecutar si una condición es :ifTRUE

a <- 33
b <- 200

if (b > a) {
  print("b is greater than a")
}

a <- 33
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print ("a and b are equal")
}

#Si no: else
#La palabra clave captura todo lo que no está reflejado por las condiciones anteriores:else

a <- 200
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}

a <- 200
b <- 33

if (b > a) {
  print("b is greater than a")
} else {
  print("b is not greater than a")
}

x <- 41

if (x > 10) {
  print("Above ten")
  if (x > 20) {
    print("and also above 20!")
  } else {
    print("but not above 20.")
  }
} else {
  print("below 10.")
}

#Y
#El símbolo & (y) es un operador lógico, y se utiliza para combinar sentencias condicionales:

a <- 200
b <- 33
c <- 500

if (a > b & c > a) {
  print("Both conditions are true")
}

#O
#El símbolo (o) es un operador lógico, y se utiliza para combinar sentencias condicionales:|

a <- 200
b <- 33
c <- 500

if (a > b | a > c) {
  print("At least one of the conditions is true")
}

#Bucles
#bucles pueden ejecutar un bloque de código siempre que se alcance una condición especificada.

#bucles son útiles porque ahorran tiempo, reducen errores y hacen que el código sea más legible.

#R tiene dos comandos de bucle:
  
while Bucles
for Bucles

#Bucles R While
#el bucle podemos ejecutar un conjunto de sentencias siempre que una condición sea VERDADERA:while

i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}

#Pausa del bucle
#Con la afirmación, podemos detener el bucle incluso si la condición while es VERDADERA:break

i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}

#Siguiente
#Con la sentencia, podemos saltar una iteración sin terminar el bucle:next

#salta el valor 3
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}

#¡Yahtzee!
#Si... Else combinado con un bucle while
dice <- 1
while (dice <= 6) {
  if (dice < 6) {
    print("No Yahtzee")
  } else {
    print("Yahtzee!")
  }
  dice <- dice + 1
}

#bucles p/ iterar sobre la secuencia: for

for (x in 1:10) {
  print(x)
}

fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  print(x)
}

dice <- c(1, 2, 3, 4, 5, 6)

for (x in dice) {
  print(x)
}

#Pausa
#Con la sentencia, podemos detener el bucle antes de que haya pasado por todos los elementos:break

fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "cherry") {
    break
  }
  print(x)
}

#El bucle se detendrá en "cherry" porque hemos elegido terminar el bucle usando la afirmación cuando es igual a "cherry" ().breakxx == "cherry"

#Bucles anidados
#También es posible colocar un lazo dentro de otro bucle. Esto se llama bucle anidado:

adj <- list("red", "big", "tasty")

fruits <- list("apple", "banana", "cherry")
for (x in adj) {
  for (y in fruits) {
    print(paste(x, y))
  }
}

#function()

my_function <- function() { # create a function with the name my_function
  print("Hello World!")
}

#Llamar a una función
#Para llamar a una función, utiliza el nombre de la función seguido de paréntesis, como my_function():
my_function <- function() {
  print("Hello World!")
}

my_function() # call the function named my_function

#Argumentos
#La información puede transmitirse a funciones como argumentos.

#Los argumentos se especifican después del nombre de la función, dentro de los paréntesis. Puedes añadir tantas como puedas Argumenta como quieras, sepáralos con una coma.

#El siguiente ejemplo tiene una función con un argumento (fname). Cuando se llama a la función, Pásame un nombre de pila, que se utiliza dentro de la función para imprimir el nombre completo:

my_function <- function(fname) {
  paste(fname, "Griffin")
}

my_function("Peter")
my_function("Lois")
my_function("Stewie")

#Número de argumentos
#Por defecto, una función debe ser llamada con el número correcto de argumentos. Es decir, que si eres La función espera 2 argumentos, tienes que llamar a la función con 2 argumentos, no más, ni menos:

#Esta función espera 2 argumentos y obtiene 2 argumentos:

my_function <- function(fname, lname) {
  paste(fname, lname)
}

my_function("Peter", "Griffin")

#Si intentas llamar a la función con 1 o 3 argumentos, obtendrás un error:

#Esta función espera 2 argumentos y obtiene 1 argumento:
  
  my_function <- function(fname, lname) {
    paste(fname, lname)
  }

my_function("Peter")

#Valor de parámetro por defecto
#El siguiente ejemplo muestra cómo usar un valor de parámetro por defecto.

#Si llamamos a la función sin argumento, utiliza el valor por defecto:

my_function <- function(country = "Norway") {
  paste("I am from", country)
}

my_function("Sweden")
my_function("India")
my_function() # will get the default value, which is Norway
my_function("USA")

#Valores de retorno
#Para que una función devuelva un resultado, use la función:return()

}

my_function <- function(x) {
  return (5 * x)
}

print(my_function(3))
print(my_function(5))
print(my_function(9))

#Funciones anidadas
#Hay dos formas de crear una función anidada:
#Llama a una función dentro de otra función.
#Escribe una función dentro de una función.

#Llama a una función dentro de otra función:

Nested_function <- function(x, y) {
  a <- x + y
  return(a)
}

Nested_function(Nested_function(2,2), Nested_function(3,3))

#Recursividad
#R también acepta recursión de funciones, lo que significa que una función definida puede llamarse a sí misma

tri_recursion <- function(k) {
  if (k > 0) {
    result <- k + tri_recursion(k - 1)
    print(result)
  } else {
    result = 0
    return(result)
  }
}
tri_recursion(6)

txt <- "awesome"
my_function <- function() {
  paste("R is", txt)
}

my_function()

txt <- "global variable"
my_function <- function() {
  txt = "fantastic"
  paste("R is", txt)
}

my_function()

txt # print txt

#El Operador de Asignación Global

#Normalmente, cuando creas una variable dentro de una función, esa variable es local y solo puede usarse dentro de esa función.

#Para crear una variable global dentro de una función, puedes usar el operador de asignación global <<-

#Si usas el operador de asignación , la variable pertenece al ámbito global:<<-
  
  my_function <- function() {
    txt <<- "fantastic"
    paste("R is", txt)
  }

my_function()

print(txt)

##ESTRUCTURA DE DATOS 

#Matrices
#Un array es como una matriz pero puede tener más de dos dimensiones. Almacena elementos del mismo tipo en múltiples dimensiones.

# An array with one dimension with values ranging from 1 to 24
thisarray <- c(1:24)
thisarray

# An array with more than one dimension
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray

#Tramas de datos
#Un data frame es como una tabla en una hoja de cálculo. Puede almacenar diferentes tipos de datos en varias columnas.

# Create a data frame
Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

# Print the data frame
#Data_Frame

#Estructura de datos	Contiene	¿Mismo tipo?	Caso de uso
#Vector	Una sola fila de valores	Sí	Secuencias simples
#Lista	Varios tipos	No	Datos mixtos agrupados
#Matriz	Valores 2D del mismo tipo	Sí	Tablas con datos numéricos
#Matriz	Valores multidimensionales	Sí	Datos 3D o de dimensión superior
#Marco de datos	Columnas de tipos mixtos	No	Trabajar con datos tabulares

#Vectores
#Un vector es simplemente una lista de elementos del mismo tipo.
# Vector of strings
fruits <- c("banana", "apple", "orange")

# Print fruits
fruits

# Vector of numerical values
numbers <- c(1, 2, 3)

# Print numbers
numbers

#Listas
#Una lista en R puede contener muchos tipos de datos diferentes en su interior. Una lista es una colección de datos que está ordenada y cambiante.

#Para crear una lista, utiliza la función:list()
# List of strings
thislist <- list("apple", "banana", "cherry")

# Print the list
thislist
#Listas de acceso
#Puedes acceder a los elementos de la lista consultando su número de índice, entre corchetes. El primer elemento tiene índice 1, el segundo índice 2, y así sucesivamente:

thislist <- list("apple", "banana", "cherry")

thislist[1]

#Cambiar el valor del objeto
#Para cambiar el valor de un elemento específico, consulte el número de índice:

thislist <- list("apple", "banana", "cherry")
thislist[1] <- "blackcurrant"

# Print the updated list
thislist

#Longitud de la lista
#Para saber cuántos elementos tiene una lista, utiliza la función:length()

thislist <- list("apple", "banana", "cherry")

length(thislist)

#Comprueba si existe un artículo
#Para saber si un elemento específico está presente en una lista, utiliza el operador:%in%

thislist <- list("apple", "banana", "cherry")

"apple" %in% thislist

#Matrices
#Una matriz es un conjunto de datos bidimensional con columnas y filas.

#Una columna es una representación vertical de los datos, mientras que una fila es una representación horizontal de los datos.

#Se puede crear una matriz con la función. Especifica los parámetros y para obtener la cantidad de filas y columnas:matrix()nrowncol

# Create a matrix
thismatrix <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)

# Print the matrix
thismatrix

thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)

thismatrix

#Elementos de la matriz de acceso
#Puedes acceder a los objetos usando corchetes. El primer número "1" en el corchete especifica la posición de la fila, mientras que El segundo número "2" especifica la posición de la columna: [ ]

thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)

thismatrix[1, 2]

#Matrices R : ARRRAYS

#En comparación con matrices, los arrays pueden tener más de dos dimensiones.

#Podemos usar la función para crear un array, y el parámetro para especificar las dimensiones:array()dim

# An array with one dimension with values ranging from 1 to 24
thisarray <- c(1:24)
thisarray

# An array with more than one dimension
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray

thisarray <- c(1:24)
multiarray <- array(thisarray, dim = c(4, 3, 2))

multiarray[2, 3, 2]

#También puedes acceder a toda la fila o columna desde una matriz en un array, usando la función:c()

thisarray <- c(1:24)

# Access all the items from the first row from matrix one
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray[c(1),,1]

# Access all the items from the first column from matrix one
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray[,c(1),1]

#Tramas de datos
#Los Data Frames son datos que se muestran en un formato como una tabla.

#Los Data Frames pueden contener diferentes tipos de datos en su interior. Aunque la primera columna puede ser , la la segunda y la tercera pueden ser o . Sin embargo, cada columna debería tener el mismo tipo de datos.characternumericlogical

#Utiliza la función para crear un marco de datos:data.frame()

# Create a data frame
Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

# Print the data frame
Data_Frame

#Resume los datos
#Utiliza la función para resumir los datos de un Data Frame:summary()


Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

Data_Frame

summary(Data_Frame)

#Artículos de acceso
#Podemos usar corchetes simples , doble corchetes o para acceder a columnas desde un marco de datos:[ ][[ ]]$

Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

Data_Frame[1]

Data_Frame[["Training"]]

Data_Frame$Training

#Añadir filas
#Usa la función para añadir nuevas filas en un marco de datos:rbind()

Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

# Add a new row
New_row_DF <- rbind(Data_Frame, c("Strength", 110, 110))

# Print the new row
New_row_DF

#Factores
#Se utilizan factores para categorizar los datos. Ejemplos de factores son:
  
  #Demografía: Hombre/Mujer
#Música: Rock, Pop, Clásico, Jazz
#Entrenamiento: Fuerza, Resistencia
#Para crear un factor, utiliza la función y añadir un vector como argumento:factor()

# Create a factor
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))

# Print the factor
music_genre

#Para imprimir solo los niveles, utiliza la función:levels()

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))

levels(music_genre)

#También puedes establecer los niveles, añadiendo el argumento dentro de la función:levelsfactor()

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Other"))

levels(music_genre)

#Longitud de los factores
#Utiliza la función para saber cuántos elementos hay en el factor:length()

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))

length(music_genre)

#Factores de acceso
#Para acceder a los elementos de un factor, consulte el número de índice, usando corchetes:[]

#Accede al tercer punto:
  
  music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))

music_genre[3]

#Cambiar el valor del objeto
#Para cambiar el valor de un elemento específico, consulte el número de índice:
  
#Cambia el valor del tercer artículo:

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))

music_genre[3] <- "Pop"

music_genre[3]
