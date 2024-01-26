SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS grandslams;
CREATE TABLE IF NOT EXISTS grandslams (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  participantes int NOT NULL,
  premio decimal(10,2) NOT NULL,
  pista enum('TIERRA','HIERBA','DURA') NOT NULL,
  ciudad varchar(55) NOT NULL,
  pais varchar(55) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS participaciones;
CREATE TABLE IF NOT EXISTS participaciones (
  id int NOT NULL AUTO_INCREMENT,
  idTenista int NOT NULL,
  idGrandSlam int NOT NULL,
  edicion int NOT NULL,
  campeon tinyint NOT NULL,
  PRIMARY KEY (id),
  KEY participacionesTOtenistas (idTenista),
  KEY participacionesTOgrandslams (idGrandSlam)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS tenistas;
CREATE TABLE IF NOT EXISTS tenistas (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(55) NOT NULL,
  apellido1 varchar(55) NOT NULL,
  apellido2 varchar(55) DEFAULT NULL,
  mano enum('ZURDO','DIESTRO') NOT NULL,
  activo tinyint NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE participaciones
  ADD CONSTRAINT participacionesTOgrandslams FOREIGN KEY (idGrandSlam) REFERENCES grandslams (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT participacionesTOtenistas FOREIGN KEY (idTenista) REFERENCES tenistas (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;




------------------------------------EJERCICIOS_GROUP_BY---------------------------------------------------------------------------------

/*
GROUP BY columna => agrupar por los valores iguales de esa columna

CON UN GROUP BY columna, de forma NECESARIA, en el SELECT, tan solo podremos usar la columna por la que agrupamos
acompañada de otras columna SIEMPRE QUE SE VEAN AFECTADAS POR UNA FUNCIÓN DE AGRUPAMIENTO

3 USOS DE COUNT:
- COUNT(*) => contará el número de registros de cada agrupación
- COUNT(columna) => contará el número de valores NO NULOS para esa agrupación
- COUNT(DISTINCT(columna)) => contará el número de valores NO NULOS para esa agrupación SIN CONTAR VALORES REPETIDOS
*/

--1. Calcula cuántas veces aparece cada tenista en la tabla participaciones --
SELECT COUNT(*) AS "Nº Participaciones"
FROM participaciones
GROUP BY idTenista;

--2. Calcula cuántos torneos jugó cada tenista (si 1 tenista jugó 2 ediciones del mismo torneo, contará como 2 la cuenta)--
SELECT idTenista, COUNT(*) AS "NUMERO DE PARTICIPACIONES" 
FROM participaciones
GROUP BY idTenista;

SELECT idTenista, COUNT(idGrandSlam) AS "NUMERO DE PARTICIPACIONES" 
FROM participaciones
GROUP BY idTenista;

--2B Calcula cuántos torneos jugó cada tenista (si 1 tenista jugó 2 ediciones del mismo torneo, contará solo como 1). --
SELECT idTenista, COUNT(DISTINCT(idGrandSlam)) AS "PARTICIPACIONES EN GRAND SLAMS"
FROM participaciones
GROUP BY idTenista;

--3. Calcula cuántos tenistas jugaron cada torneo --
SELECT idGrandSlam, COUNT(DISTINCT(idTenista)) AS "NUMERO DE TENISTAS"
FROM participaciones
GROUP BY idGrandSlam;

--4. Calcula cuántos participantes distintos tuvo cada torneo --
SELECT idGrandSlam, COUNT(DISTINCT(idTenista)) AS "NUMERO DE TENISTAS QUE PARTICIPARON"
FROM participaciones 
GROUP BY idGrandSlam;

--5. Calcula cuántas veces fue campeón cada tenista --
SELECT idTenista, COUNT(*) AS "NUMERO DE TORNEOS GANADOS"
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista;

-- como hemos filtrado con WHERE campeon = 1, en la columna campeon NO puede haber valores NULL, por lo que también estaría bien hacer: --
SELECT idTenista, COUNT(campeon) AS "NUMERO DE TORNEOS GANADOS"
FROM participaciones
WHERE campeon = 1
GROUP BY idTenista;

--6. Calcula cuántas veces fue campeón cada tenista en 2020 --
SELECT idTenista, COUNT(campeon) AS "NUMERO DE TORNEOS GANADOS"
FROM participaciones
WHERE campeon = 1 AND edicion = 2020
GROUP BY idTenista;