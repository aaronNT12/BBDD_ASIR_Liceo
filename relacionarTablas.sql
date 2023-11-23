-- Para relacionar tablas utilizamos FK--
/*
 Las FK (claves foraneas) eran columnas (claves) pertenecientes a una tabla 
 siendo PK (claves primarias) en otra tabla distinta.
*/

-- trabajando con la base de datos asir23bd --
-- profesores -> centros --
-- 1º paso: ¿Cardinalidad? => 1 profesor pertenece a 1 centro, 1 centro tiene N profesores --
/*
    PARA LAS RELACIONES DE CARDINALIDAD 1:N, TENDREMOS QUE CREAR UNA COLUMNA.
    ESTA COLUMNA SERÁ LA FK DE LA RELACIÓN. 
    HAY QUE PENSAR EN CUÁL DE LAS 2 TABLAS TENEMOS QUE CREARLA
    SE CREARÁ LA COLUMNA EN LA TABLA CON CARDINALIDAD MÁXIMA 1 (un profesor puede pertenecer
     como máximo a 1 centro => creamos la columna en la tabla profesores).
*/

-- 2º paso: escribir los comandos --
ALTER TABLE profesores
ADD COLUMN idCentro INT(2) NOT NULL,
ADD CONSTRAINT profesoresToCentrosFK FOREIGN KEY(idCentro) REFERENCES profesores(id);
--Lo que quiere decir la línea 21, literalmente es: --
-- + ADD CONSTRANINT profesoresToCentrosFK => AÑADE UNA RESTRICCIÓN DE NOMBRE profesoresToCentrosFK --
-- + FOREIGN KEY(idCentro) => ESTABLECER QUE LA COLUMNA DE LA TABLA PROFESORES idCentro es CLAVE FORANEA --
-- + REFERENECES profesores(id) => APUNTA A LA TABLA PROFESORES, EN CONCRETO, A SU COLUMNA id QUE ES PK --


/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`asir23bd`.`#sql-3518_4d2`, CONSTRAINT `profesoresToCentrosFK` FOREIGN KEY (`idCentro`) 
REFERENCES `profesores` (`id`))

ESTO QUIERE DECIR QUE EN LA COLUMNA QUE ES FK ESTAMOS INTRODUCIENDO UN VALOR NO VÁLIDO.
LOS VALORES NO VÁLIDOS SON DE VARIOS TIPOS:
   + QUE NO SE CORRESPONDE EL TIPO DE DATO.
   + QUE ES NULL CUANDO LA FK NO ACEPTA NULOS.
   + QUE ES UN VALOR QUE NO CONTIENE LA COLUMNA DONDE ES CLAVE PRIMARIA. 
*/

-- Entendemos que una asignatura puede ser impartida por varios profesores y que un profesor puede impartir varias asignaturas --
-- Por lo tanto, estaremos hablando de una relación N:M --
-- En caso de relaciones N:M creamos una tabla que contiene las FK de las tablas que une --

CREATE TABLE profesoresAsignaturas (
   idProfesor INT(2) NOT NULL,
   idAsignatura INT(2) NOT NULL,
   PRIMARY KEY (idProfesor, idAsignaturas)
);

-- El siguiente paso será definir las CONSTRAINT y las FOREIGN KEY --
ALTER TABLE profesoresAsignaturas
ADD CONSTRAINT idProfesorToProfesoresFK FOREIGN KEY(idProfesor) REFERENCES profesores(id), 
ADD CONSTRAINT idAsignaturasToProfesoresFK FOREIGN KEY(idAsignatura) REFERENCES asignaturas(id); 

-- INSERTAMOS LOS PROFESORES DE DAM --
INSERT INTO profesores (nombre, apellido1, apellido2, edad, correoelectronico, especialidad, idCentro)
VALUES ("Jesús", "Pérez", "Roca", 42, "jesusroca@gmail.com", "INFORMATICA",1 ),
("Eva", "Castro", "Pedreira", 40, "evacastro@gmail.com", "DERECHO",1);

-- INSERTAMOS LAS ASIGNATURAS DE DAM --
INSERT INTO asignaturas (nombre, acronimo, horas, dificultad)
VALUES("Programacion", "PROG", 90, "ALTA"),
("Entornos de Desarrollo", "ENTD", 76, "MEDIA"),
("Sistemas", "SIS", 80, "BAJA");
-- METEMOS FUNDAMENTOS HARDWARE --
INSERT INTO asignaturas (nombre, acronimo, horas, dificultad)
VALUES("Fundamentos Hardware", "FH", 66, "BAJA");
-- INSERTAMOS LA TABLA INTERMEDIA --
INSERT INTO profesoresAsignaturas (idProfesor, idAsignatura)
VALUES(1,1),
(2,7),
(3,4),
(4,5),
(4,11),
(5,12),
(5,10),
(6,3),
(9,9),
(9,4),
(10,3);