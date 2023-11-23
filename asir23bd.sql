mysql -u root -p

CREATE DATABASE asir23bd;

USE asir23bd;

CREATE TABLE alumnos (
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(55) NOT NULL,
    apellido2 VARCHAR(55) NULL,
    edad INT(2) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO alumnos (nombre, apellido1, apellido2, edad, email)
VALUES ("Marcos", "Aller", "Amor", 18, "marcos@gmail.com"),
("Miguel", "Carballo", "Beltrán", 18, "miguel@hotmail.com"),
("Julián", "Cortés", "Casal", 19, "julian@gmail.com"),
("Miguel Ángel", "Darriba", "Uzal", 21, "miguelangel@hotmail.es"),
("Iker", "Fernández", "Bonilla", 19, "iker@gmail.com"),
("Daniel", "Fernández", "Miranda", 27, "daniel@yahoo.es"),
("Xián", "Ferreiro", "López", 26, "xian@gmail.com"),
("Sergio", "González", "García", 20, "sergio@gmail.com"),
("Jorge", "González", "Lastra", 18, "jorge@yahoo.es"),
("Javier", "Hervada", "Carnero", 21, "javier@hotmail.com"),
("Hugo", "Lamas", "Ferreiro", 31, "hugo@gmail.com"),
("Carlos", "Liste", "Cabarcas", 21, "carglos@yahoo.es"),
("Jose Antonio", "Lodeiro", "Espiñeiro", 23, "joseantonio@gmail.com"),
("Álvaro", "López", "López", 20, "alvaro@gmail.com"),
("Lucas", "Meizoso", "De Bernardo", 19, "lucas@yahoo.es"),
("Aarón", "Naveira", "Taibo", 23, "aaron@gmail.com"),
("Yoel", "Otero", "Sánchez", 19, "yoel@yahoo.es"),
("Adrián", "Pazo", "Álvarez", 20, "adrian@gmail.com"),
("Martin", "Reboredo", "Orgeira", 19, "martin@yahoo.es"),
("Javier", "Riveiro", "Paz", 21, "javier@hotmail.es"),
("Álvaro", "Rodríguez", "González", 20, "alvaro@yahoo.es"),
("Sara", "Vázquez", "Freire", 18, "sara@yahoo.es"),
("Aitor", "Vigo", "Cruz", 21, "aitor@gmail.com");

ALTER TABLE alumnos
ADD COLUMN id INT(2) PRIMARY KEY AUTO_INCREMENT FIRST;

CREATE TABLE profesores (
    nombre VARCHAR(155) NOT NULL,
    edad INT(2) NOT NULL,
    email VARCHAR(255) NOT NULL,
    especialidad VARCHAR(25) NOT NULL
);

INSERT INTO profesores (nombre, edad, email, especialidad)
VALUES ("Manuel Rico López", 38, "manuel@gmail.com", "INFORMATICA"),
("Xabier Pérez Maestre", 44, "xabier@mundo-r.com", "INFORMATICA"),
("Mónica Pérez Sueiro", 35, "monica@hotmail.com", "INFORMATICA"),
("Jose Antonio Pereira Suárez", 41, "joseantonio@gmail.com", "INFORMATICA"),
("Begoña Cambeiro Núñez", 42, "begoña@gmail.com", "INFORMATICA"),
("Jesús Varela Sánchez", 44, "jesus@gmail.com", "DERECHO");

-- ALTER TABLE multiple => 1 ALTER TABLE y acometer varias acciones sobre la misma tabla --
ALTER TABLE profesores
ADD COLUMN id INT(2) PRIMARY KEY AUTO_INCREMENT FIRST,
ADD COLUMN apellido1 VARCHAR(55) NOT NULL AFTER nombre,
ADD COLUMN apellido2 VARCHAR(55) NULL AFTER apellido1;

-- UPDATE CON VARIOS VALORES --
UPDATE profesores
SET nombre="Manuel"
WHERE id=1;

UPDATE profesores
SET apellido1="Rico"
WHERE id=1;

UPDATE profesores
SET apellido2="López"
WHERE id=1;

-- es mejor hacer un UPDATE de múltiples valores --

UPDATE profesores
SET nombre="Manuel",
    apellido1="Rico",
    apellido2="López"
WHERE id=1;

UPDATE profesores
SET nombre="Xabier",
    apellido1="Pérez",
    apellido2="Maestre"
WHERE id=2;

UPDATE profesores
SET nombre="Mónica",
    apellido1="Pérez",
    apellido2="Sueiro"
WHERE id=3;

UPDATE profesores
SET nombre="Jose Antonio",
    apellido1="Pereira",
    apellido2="Suárez"
WHERE id=4;

UPDATE profesores
SET nombre="Begoña",
    apellido1="Cambeiro",
    apellido2="Núñez"
WHERE id=5;

UPDATE profesores
SET nombre="Jesús",
    apellido1="Varela",
    apellido2="Sánchez"
WHERE id=6;

-- TENEMOS QUE CAMBIAR NOMBRE COLUMNA + TIPO DE DATOS --
ALTER TABLE profesores
CHANGE COLUMN email correoElectronico VARCHAR(155) NOT NULL;

ALTER TABLE profesores
ADD COLUMN salario DECIMAL(6,2) NOT NULL AFTER edad;

-- CREAR TABLA ASIGNATURAS --
CREATE TABLE asignaturas(
    id INT(2) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    acronimo VARCHAR(5) NOT NULL,
    horas INT(3) NOT NULL,
    dificultad VARCHAR(20) NOT NULL,
    profesor VARCHAR(255) NOT NULL
);

INSERT INTO asignaturas (nombre, acronimo, horas, dificultad, profesor)
VALUES ("Base de datos", "BBDDD", 80, "ALTA", "Manuel Rico López"),
("Programación", "PROG", 90, "ALTA", "Jesús Pérez Roca"),
("Formación y Orientación Laboral", "FOL", 55, "BAJA", "Eva Castro Pereira"),
("Lenguaje de marcas", "LM", 60, "BAJA", "Jesús Pérez Roca"),
("Sistemas y redes", "SYR", 70, "MEDIA", "Jose Antonio Pereira Suárez"),
("Entornos de desarrollo", "ENTD", 66, "MEDIA", "Begoña Cambeiro Núñez");

-- Vamos a arreglar los INSERTS para que tengan las asignaturas de ASIR --
DELETE 
FROM asignaturas
WHERE id=2 OR id=6; 
-- Si hay que borrar muchos ids, se utilizaría IN --
DELETE
FROM asignaturas
WHERE id IN (2,6);

-- INSERTAMOS SISTEMAS OPERATIVOS --
INSERT INTO asignaturas (nombre, acronimo, horas, dificultad, profesor)
VALUES ("Implementación de Sistemas Operativos", "ISO", 90, "ALTA", "Xabier Pérez Maestre");

-- Como FOL queda en la columna nombre cortado, aumentamos el número de caracteres --
ALTER TABLE asignaturas
MODIFY COLUMN nombre VARCHAR(50) NOT NULL;

-- Corregimos los datos de FOL --
UPDATE asignaturas
SET nombre = "Formación y Orientación Laboral",
    profesor = "Jesús Varela Sánchez"
WHERE id=3;
-- Corregimos los datos de LM --
UPDATE asignaturas
SET profesor = "Mónica Pérez Sueiro"
WHERE id = 4;

-- Cuando queremos limitar un número de valores válidos para una columna --
-- generamos un enumerado, por ejemplo, para dificultad, solamente permitiremos --
-- insertar los valores "ALTA" "MEDIA" y "BAJA"--

ALTER TABLE asignaturas
MODIFY COLUMN dificultad ENUM("ALTA", "MEDIA", "BAJA");

-- si ponemos otro valor --
INSERT INTO asignaturas (nombre, acronimo, horas, dificultad, profesor)
VALUES ("Asignatura prueba enum", "ape", 90, "EXTREMA", "Xabier Pérez Maestre");

DELETE 
FROM asignaturas
WHERE id = 8;

-- ELIMINAMOS ALUMNOS CON ids 5,10,13 --
DELETE 
FROM alumnos
WHERE id IN(5, 10, 13);

-- VOLVEMOS A INSERTARLOS --
INSERT INTO alumnos (nombre, apellido1, apellido2, edad, email)
VALUES ("Iker", "Fernández", "Bonilla", 21, "iker@gmail.com"),
("Javier", "Hervada", "Carnero", 19, "javier@hotmail.com"),
("Jose Antonio", "Lodeiro", "Espiñeiro", 18, "joseantonio@gmail.com");

-- RECOLOCAMOS LOS IDs ORIGINALES --
UPDATE alumnos
SET id = 5
WHERE id = 24;

UPDATE alumnos
SET id = 10
WHERE id = 25;

UPDATE alumnos
SET id = 13
WHERE id = 26;

-- CREAMOS LA TABLA CENTRO --
CREATE TABLE centros (
    id INT(2) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tipo ENUM("PUBLICO", "CONCERTADO", "PRIVADO") NOT NULL,
    provincia VARCHAR(25) NOT NULL
);

-- INSERTAMOS CENTROS --
INSERT INTO centros (nombre, tipo, provincia)
VALUES("Liceo La Paz", "CONCERTADO", "A CORUÑA"),
("Obradoiro", "PRIVADO", "A CORUÑA"),
("Eusebio da Garda", "PUBLICO", "A CORUÑA");

--creamos la columna en la tabla alumnos--
ALTER TABLE alumnos
ADD COLUMN centro VARCHAR(50) NOT NULL;

-- añadimos los alumnos al liceo --
UPDATE alumnos
SET centro = "Liceo La Paz";

--nserta en la tabla alumnos la columna lugar VARCHAR(55) NOT NULL y sitúala a la derecha de email --
ALTER TABLE alumnos
ADD COLUMN lugar VARCHAR(55) NOT NULL AFTER email;

--Inserción de los valores en la columna--
UPDATE alumnos
SET lugar = "A Coruña"
WHERE id IN (2,3,10,13,20,23);

UPDATE alumnos
SET lugar = "Oleiros"
WHERE id IN (1);

UPDATE alumnos
SET lugar = "O Burgo"
WHERE id IN (4,8);

UPDATE alumnos
SET lugar = "Sada"
WHERE id IN (16,17);

UPDATE alumnos
SET lugar = "Portazgo"
WHERE id IN (9,12);

UPDATE alumnos
SET lugar = "Temple"
WHERE id IN (18);

UPDATE alumnos
SET lugar = "Ferrol"
WHERE id IN (11);

UPDATE alumnos
SET lugar = "Santa Cruz"
WHERE id IN (14);

UPDATE alumnos
SET lugar = "Culleredo"
WHERE id IN (15);

UPDATE alumnos
SET lugar = "Carral"
WHERE id IN (19);

UPDATE alumnos
SET lugar = "Perillo"
WHERE id IN (21);

UPDATE alumnos
SET lugar = "Loureda"
WHERE id IN (22);

UPDATE alumnos
SET lugar = "Culleredo"
WHERE id IN (15);

UPDATE alumnos
SET lugar = "Carral"
WHERE id IN (19);

UPDATE alumnos
SET lugar = "Perillo"
WHERE id IN (21);



UPDATE alumnos
SET lugar = "Culleredo"
WHERE id IN (15);

UPDATE alumnos
SET lugar = "Carral"
WHERE id IN (19);

UPDATE alumnos
SET lugar = "Perillo"
WHERE id IN (21);


UPDATE alumnos
SET lugar = "Culleredo"
WHERE id IN (15);

UPDATE alumnos
SET lugar = "Carral"
WHERE id IN (19);

UPDATE alumnos
SET lugar = "Perillo"
WHERE id IN (21);

UPDATE alumnos
SET lugar = "Gijón"
WHERE id IN (7);

UPDATE alumnos
SET lugar = "Cee"
WHERE id IN (5);

UPDATE alumnos
SET lugar = "Oviedo"
WHERE id IN (6);



--EJERCICIOS DE SELECT--

--1º Muestra los alumnos con 18 años que sean del centro Liceo La Paz--

SELECT *
FROM alumnos
WHERE edad = 18 AND centro LIKE "Liceo La Paz";


--2º Muestra los alumnos con edades comprendidas entre 18 y 20 años cuyo--

--apellido1 sea "González", que estudien en el Liceo la Paz y los alumnos que tengan nombre "Hugo"--

SELECT *
FROM alumnos
WHERE edad BETWEEN 18 AND 20 AND ((apellido1 LIKE "González" AND centro LIKE "Liceo La Paz")) OR nombre LIKE "Hugo";


--3º Muestra los alumnos que sean de A Coruña o de Lugo o Cee, cuyo id sea mayor o igual a 10--
SELECT *
FROM alumnos
WHERE lugar IN ("A CORUÑA","LUGO","CEE") AND id >= 10;

--4º Muestra los alumnos que tengan con segunda letra de nombre una "n" y que acaben en la letra "o"--

--5º Muestra la edad, el nombre y el primer apellido de los alumnos que tengan como cuenta de correo "Hotmail"--

--6º Inserta los valores de las edades de los alumnos--

---------------------------------------------------------------------------------------------------------------------------

--INSERTAR NUEVOS VALORES--

INSERT INTO alumnos(nombre,apellido1,apellido2,edad,email,lugar,centro)
VALUES("Nicolás","Álvarez","Pérez",18,"nicolas@hotmail.com","Baio","Liceo La Paz"),
("Jesús","Ares","Armesto",19,"jesus@hotmail.com","Oleiros","Liceo La Paz"),
("Jose Manuel","Blanco","García",20,"josemanuel@hotmail.com","A Coruña","Liceo La Paz"),
("Adrián","Candedo","Bello",18,"adrian@hotmail.com","A Coruña","Liceo La Paz"),
("Ana","Caramés","Canosa",20,"ana@hotmail.com","A Coruña","Liceo La Paz"),
("Andrea","Carracedo","Caamaño",19,"andrea@hotmail.com","Sada","Liceo La Paz"),
("Andrián","Castro","Beiro",18,"adrian@gmail.com","A Coruña","Liceo La Paz"),
("Sabela","Cobelo","Losada",20,"sabela@gmail.com","Oleiros","Liceo La Paz"),
("Diego","Coello","Morán",22,"diego@gmail.com","Lugo","Liceo La Paz"),
("Antonio","Devesa","Varela",19,)
