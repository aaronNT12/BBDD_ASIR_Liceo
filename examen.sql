--1º----

CREATE DATABASE suenho;

USE suenho;

CREATE TABLE familiares(
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(55) NOT NULL,
    parentesco VARCHAR(55) NOT NULL
);

CREATE TABLE suenho(
    tipoSuenho VARCHAR(55),
    duracionSueño VARCHAR(5),
    protagonista BOOLEAN
);



--2º---------------------------------


ALTER TABLE familiares
ADD COLUMN idFamiliares INT(2) PRIMARY KEY AUTO_INCREMENT FIRST;


ALTER TABLE suenho
ADD COLUMN idSuenho INT(2) PRIMARY KEY AUTO_INCREMENT FIRST;

INSERT INTO familiares(nombre,apellido,parentesco)
VALUES("Oana","Vázquez","prima"),
("Martin","Vázquez","padre"),
("María","López","madre");


INSERT INTO suenho(tipoSuenho,duracionSueño,protagonista)
VALUES("sueño",1,true),
("sueño",2,true),
("pesadilla",1,false),
("pesadilla",3,true),
("sueño",2,true),
("pesadilla",2,true);

--4º-----------------------

SELECT *
FROM suenho
WHERE protagonista = FALSE;


--5º--------------------------

SELECT *FROM familiares
WHERE (parentesco = "madre") OR nombre = "Oana";

--6º-------------------------

ALTER TABLE familiares
ADD COLUMN edad INT(2) AFTER apellido;

---7º------------------------------

ALTER TABLE familiares
DROP COLUMN parentesco;

--8º---------------------------------


ALTER TABLE suenho
MODIFY COLUMN tipoSuenho tipoPesadilla ENUM(1,2,3);

--9º------------------------------------------------

SELECT *FROM suenho
WHERE (tipoSuenho ="pesadilla")AND protagonista=True;


--3º-------------------------------

SELECT *
FROM familiares
WHERE nombre = (%a_ez);