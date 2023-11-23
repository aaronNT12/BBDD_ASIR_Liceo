--VER BASE DE DATOS--
CREATE TABLE aviones (
	id int(1) PRIMARY KEY AUTO_INCREMENT,
	modelo VARCHAR(25) NOT NULL,
	fechaCreacion INT(4) NULL,
	asientos INT(3) NULL);

--VER TABLAS CREADAS DE LA BASE DE DATOS--
SHOW TABLES;
--VER ESTRUCTURA DE LA TABLA--
DESCRIBE nombreTabla



--CREAMOS TABLA PILOTOS--
CREATE TABLE pilotos (
	id INT(1) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(55) NOT NULL,
	apellido1 VARCHAR(55) NULL,
	apellido2 VARCHAR(55) NOT NULL,
	telefono INT(13) NULL,
	email VARCHAR (255) NOT NULL
	);

--COLOCAR COLUMNA A LA IZQUIERA O A LA DERECHA--

--FIST para coloca a la izquierda--
--AFTER para colocar a la derecha--
	