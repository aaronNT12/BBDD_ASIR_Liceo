https://www.w3schools.com/sql/sql_ref_mysql.asp

-- conectar con el servidor de bases de datos--
mysql -u root -p -- donde "-u" es user y "-p" es password -- 

-- VER BASES DE DATOS --
SHOW DATABASES; 
-- CREAR BASE DE DATOS --
-- CREATE DATABASE nombreBaseDeDatos --
CREATE DATABASE aviones;
-- SELECCIONAR BASE DE DATOS --
-- USE nombreBaseDeDatos --
USE aviones;
-- CREAR TABLA --
/*
CREATE TABLE nombreTabla (
    nombreColumna1 tipoDeDato [opcional(por ejemplo si es clave primaria o si acepta valores nulos)],
    nombreColumna2 tipoDeDato [opcional],
    .... ,
    nombreColumnaN tipoDeDato [opcional]

);
*/
CREATE TABLE aviones (
    id INT(1) PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(25) NOT NULL,
    fechaCreacion INT(4) NULL,
    asientos INT(3) NULL
);
-- VER TABLAS CREADAS DE LA BASE DE DATOS --
SHOW TABLES;
-- VER ESTRUCTURA (es decir, cómo está creada) DE LA TABLA --
-- DESCRIBE nombreTabla --
DESCRIBE aviones;

-- CREAMOS OTRA TABLA --
CREATE TABLE pilotos (
    id INT(1) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    apellido1 VARCHAR(55) NOT NULL,
    apellido2 VARCHAR(55) NULL,
    telefono INT(13) NULL,
    email VARCHAR(255) NOT NULL
);

-- ACTUALIZAR ALGUNA ESTRUCTURA DE UNA TABLA --
-- ALTER TABLE--
-- Añadir una columna a la tabla --
ALTER TABLE pilotos
ADD COLUMN tipoPiloto BOOLEAN NOT NULL;

-- Eliminar una columna de la tabla --
ALTER TABLE pilotos
DROP COLUMN tipoPiloto;

-- Modificar una columna USANDO MODIFY --
ALTER TABLE pilotos
MODIFY COLUMN telefono INT(13) NOT NULL;

-- Modificar una columna USANDO CHANGE (usamos CHANGE cuando queremos renombrar y cambiar algo en la estructura a la vez)--
ALTER TABLE pilotos
CHANGE COLUMN nombre nombrePiloto VARCHAR(155) NOT NULL;

-- Renombrar una columna --
ALTER TABLE pilotos
RENAME COLUMN telefono TO tlfno


-- INSERTAR DATOS EN UNA TABLA --
-- INSERT INTO nombreTabla (columna1, columna2, ..., columnaN) --
-- VALUES (valor1, valor2, ..., valorN); --
/*
VARCHAR -> USO DE COMILLAS, VALEN "" Y ''
INT -> NUMEROS SIN COMILLAS , SOLO ALCANZA HASTA 11 DIGITOS, a partir de ahi hay que usar BIGINT
NULL -> NULL SIN COMILLAS
TYNIINT -> SOLO ACEPTA 1 Y 0 (FUNCIONA COMO BOOLEAN, 1 PARA TRUE Y 0 PARA FALSE)
*/
INSERT INTO pilotos (nombre, apellido1, apellido2, tlfno, email)
    VALUES ("Alberto", "Silva", NULL, 0034697765453, "albertito@gmail.com");


-- VER LOS DATOS INTRDUCIDOS DE UNA TABLA --
-- SELECT * --
-- FROM nombreTabla --
-- WHERE condicionACumplir --
SELECT *
FROM pilotos;

/*COMO PODEMOS APRECIAR, EL TELEFONO NO SE PUEDE GUARDAR BIEN A PESAR DE ESTAR
CONFIGURADO CON UNA LONGITUD DE 13 DIGITOS, ESTO OCURRE PORQUE EL TIPO DE DATO
INT TAN SOLO ALCANZA VALORES PARA EL INTERVALO [-2147483648 a 2147483647], LA 
SOLUCIÓN SERÁ CAMBIAR EL TIPO DE DATO INT POR UN BIGINT*/
ALTER TABLE pilotos
MODIFY COLUMN tlfno BIGINT NOT NULL;

-- ACTUALIZAR DATOS--
--UPDATE nombreTabla --
--SET columna=valor --
--WHERE id=valor--
UPDATE pilotos
SET tlfno= 0034697765534
WHERE id = 1;

-- hacemos más INSERTS --
INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Juan Manuel", "Pérez", "González", 0034565666765, "lococonalas@gmail.com");
INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Marcos", "Caamaño", "Pérez", 0034676543223, "caamaño@hotmail.com");

-- INSERCIONES MÚLTIPLES --
INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Pedro", "González", "García", 0034678787765, "losgarcia@gmail.com"),
           ("Jesús", "Nazaret", NULL, 0034687765666, "HEAVENSdoor@gmail.com"),
           ("Mario", "Bros", NULL, 0034655436678, "fontaneriamario@nintendo.com");

-- BORRAR REGISTROS DE UNA TABLA --
-- DELETE 
-- FROM nombreTabla --
-- WHERE col=valor; --
DELETE 
FROM pilotos
WHERE id = 5;

INSERT INTO pilotos (nombrePiloto, apellido1, apellido2, tlfno, email)
    VALUES ("Satán", "Lucifer", NULL, 0034657987666, "calentitoelinfierno@hotmail.com");


ALTER TABLE pilotos
MODIFY COLUMN id INT(3) PRIMARY KEY AUTO_INCREMENT; -- este cambio, por ser clave primaria, no funcionará, tendremos que omitir la parte de "PRIMARY KEY AUTO_INCREMENT" --

ALTER TABLE pilotos
MODIFY COLUMN id INT(3);

--1--
   -- Crear una tabla aviones formada por las siguientes columnas: --
    
    CREATE TABLE aviones (
        id INT(3) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    reaccion TINYINT(1) NOT NULL,
    combate TINYINT(1) NOT NULL,
    velocidadMaxima DECIMAL(5,2) NOT NULL
    );
   

-- 2 --


    --Inserta los siguientes aviones:--
    BOEING 747 , 1, 0, 777.20
    F 55, 1, 1, 999.99
    EURO FIGHTER, 1, 1, 999.99
    Avion de papel, 0, 0 , 1.00
    AIRBUS 333, 1, 0, 566.77


INSERT INTO aviones(nombre,reaccion,combate,velocidadMaxima)
    VALUES("BOEING 747",1,0,777.20),
        ("F 55",1, 1, 999.99),
        ("EURO FIGHTER", 1, 1, 999.99),
        ("Avion de papel", 0, 0, 1.00),
        ("AIRBUS 333", 1, 0, 566.77);
-- 3 --
    --BORRAR EL AVION DE PAPEL--
    

DELETE FROM aviones
    WHERE id = 4;

-- 4 --
   -- AÑADIR UNA COLUMNA A LA TABLA QUE SEA coste DECIMAL (10,2) NN --
   
    ALTER TABLE aviones add coste DECIMAL (10,2) NOT NULL;

   -- MUESTRA LOS DATOS DE LA TABLA, ¿QUÉ PASÓ CON LA COLUMNA QUE ACABAMOS DE CREAR? --

    DESCRIBE TABLE aviones;

   /*Podemos observar que la nueva columna Costo tiene como dato por defecto 0.00
    ya que cuando los datos ya existentes en la tabla previos a la creación de esta columna
    no tenían definidos este nuevo campo. Deberemos modificar los registros en el caso de querer introducir
    algún valor en la columna coste.
*/


-- 5 --
   -- borra la columna velocidadMaxima --

ALTER TABLE aviones DROP COLUMN velocidadMaxima;

