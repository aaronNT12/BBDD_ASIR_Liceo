-- USANDO LA BBDD asir23bd --

-- CONSULTAS DE SELECCION 1 TABLA--

----------------------------------
-------------SELECT---------------
----------------------------------

SELECT * -- con el asterisco indicamos que queremos todas las columnas de la tabla --
FROM nombreTabla
WHERE filtrosAaplicar -- los filtros son normalmente nombreColumna operador valor --

SELECT *
FROM alumnos
WHERE id >= 1; -- "id" es nombreColumna. ">=" es el operador. "1" es el valor

-- Podemos seleccionar en el SELECT qué columnas queremos ver o incluso mostrar columnas --
-- calculadas por nosotros --
-- Vamos a ver un ejemplo para ver solamente el id del alumno, su edad y calcularemos su año de nacimiento --
SELECT id, edad, (2023 - edad)
FROM alumnos;

-- Como vemos, la tercera columna de la consulta anterior no deja del todo claro qué datos muestra--
-- En estos casos podemos poner "ALIAS" a las columnas con la palabra reservada "AS" --
SELECT id, edad, (2023 - edad) AS "fecha de nacimiento"
FROM alumnos;

-- Los alias se los podemos aplicar a cualquier columna --
SELECT id AS "numero de alumno", edad, (2023 - edad) AS "fecha de nacimiento"
FROM alumnos;

----------------------------------
-------------WHERE----------------
----------------------------------

/*
En el WHERE como vimos antes, se podrán realizar filtrados de información. 
Para cada filtro hay que seguir la estructura "columna" "operador" "valor"--
Hay dos tipos de operadores:
    - Aritméticos. = , <, >, >=, <=, distinto de (2 formas) != ó <>
    - Reservados. IN , LIKE , NOT, BETWEEN

También encontraremos palabras lógicas para concatenar los filtros del WHERE.
*/

-- Queremos ver los alumnos de edad 20 años --
SELECT *
FROM alumnos
WHERE edad = 20;
-- Queremos ver los alumnos que NO tengan 20 años --
SELECT *
FROM alumnos
WHERE edad != 20;

SELECT *
FROM alumnos
WHERE edad <> 20;

-- Queremos ver los alumnos que NO tengan 20 años y que a su vez, tengan como colegio el Liceo La Paz --
SELECT *
FROM alumnos
WHERE edad != 20 AND centro LIKE "Liceo La Paz" ;

-- Queremos ver los alumnos que NO tengan 20 años y que a su vez,NO tengan como colegio el Liceo La Paz --

SELECT *
FROM alumnos
WHERE edad != 20 AND centro NOT LIKE "Liceo La Paz" ;

-- Queremos ver los alumnos con edades comprendidas entre 19 y 25 años, que tengan como apellido1 O apellido2 "FERNANDEZ" --
SELECT *
FROM alumnos
WHERE edad BETWEEN 19 AND 25 AND (apellido1 LIKE "FERNÁNDEZ" OR apellido2 LIKE "FERNÁNDEZ");

-- Si no ponemos los paréntesis, estaríamos evaluando realmente, si los alumnos tienen entre 19 y 25 años y apellido1 fernández, --
-- ó que tengan como segundo apellido fernandez, sin importar su edad --