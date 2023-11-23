--1º Crear la base de datos--

CREATE DATABASE concesionarios;

USE DATABASE concesionarios;

--2º Crear las diferentes tablas de la BBDD--

    --Tabla vehiculos--

CREATE TABLE vehiculos(
    id_vehiculo INT(3) PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(25) NOT NULL,
    tipo ENUM("Coche","Moto","Furgoneta","Patinete") NOT NULL,
    modelo VARCHAR(55) NOT NULL,
    cilindrada INT(4),
    motor INT(3),
    TipoCombustible ENUM("Gasolina","Diesel","Eléctrico","Híbrido"),
    );


ALTER TABLE vehiculos
ADD COLUMN id_concesionario INT(3),
ADD CONSTRAINT fk_vehiculoConcesionario
FOREIGN KEY(id_concesionario) REFERENCES vehiculosConcesionarios(id_vehiculoConcesionario);
    --Tabla concesioshownarios--

CREATE TABLE concesionarios(
    id_concesionario INT(3) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    calle VARCHAR(255) NOT NULL
    );
    --Tabla intermedia VehiculosConcesionarios--

CREATE TABLE vehiculosConcesionarios(
    id_vehiculoConcesionario INT(3) PRIMARY KEY AUTO_INCREMENT,
    id_vehiculo INT(3) NOT NULL,
    id_concesionario INT(3) NOT NULL,

    CONSTRAINT id_vehiculo FOREIGN KEY(id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    CONSTRAINT id_concesionario FOREIGN KEY(id_concesionario) REFERENCES concesionarios(id_concesionario)
);
--2º Hacer inserts en las tablas--

INSERT INTO concesionarios(nombre,calle)
VALUES("Novomovil","Polígono de Iñás, Rua O Morrazo, 9"),
("Amiocar","Pl Costa vella, Rúa de Malta, 3"),
("Marineda Motor","Av. Alcalde Alfonso Molina"),
("Sanchez Movil","Rúa Galileo Galilei, 44");

INSERT INTO vehiculos (marca,tipo,modelo,cilindrada,motor,TipoCombustible,id_vehiculoConcesionario)
VALUES("BMW","coche","iX",NULL,523,"Electrico",1),
("BMW","coche","X7 M60",2800,530,"Gasolina",1),
("BMW","coche","XM",3300,653,"Hibrido",1),
("BMW","moto","S RR",1000,210,"Gasolina",2),
("BMW","moto","C 400 X",NULL,34,"Electrico",2),
("Seat","coche","Leon FR",2200,150,"Diesel",3),
("Seat","moto","MO 50",NULL,24,"Electrico",4);



    -- 2º Muestra la información de los vehículos que tienen más de 300 CV de potencia.--
        
        SELECT *
         FROM vehiculos
         WHERE motor > 300;

    --3º Muestra la información de los vehículos que tienen entre 250 y 505 CV de potencia.--
        SELECT *
             FROM vehiculos
            WHERE motor BETWEEN(250,505);


    --4º Muestra la información de los vehículos cuyo motor no tiene cilindrada.--
   
        SELECT *
         FROM vehiculos
         WHERE cilindrada IS NULL;

    --5º Muestra la información de los vehículos que tienen 150, 210, 205, 523, 530 y más de 600 CV de potencia.--
   
         SELECT *
             FROM vehiculos
            WHERE motor IN (150,210,205,523,530) OR motor > 600;

    --6º Muestra la información de los vehículos que tienen más de 600 CV de potencia teniendo también más de 3000 CC ó cuyo nombre de modelo empiece por “B”.--
   
         SELECT * 
            FROM vehiculos
            WHERE (motor > 600 AND cilindrada > 3000) OR modelo LIKE 'B%';  

    --7º Muestra la información de los vehículos cuyo nombre contiene una letra “X”.--
   
         SELECT *
            FROM vehiculos
            WHERE modelo LIKE '%X%';

    --8º Muestra la información de los vehículos cuyo nombre contiene una “X” y a su vez, como penúltimo caracter tiene un “6” ó la información de aquellos vehículos cuyos CV sean menores o iguales a 400.--
   
        SELECT *
        FROM vehiculos
        WHERE (modelo LIKE '%X%' AND  modelo LIKE '%6_') OR motor <= 400;

    --9º Muestra la información de los vehículos que tengan más de 50CV y ordena los resultados según la potencia de estos poniendo arriba los que tienen más CV.--
        SELECT *
            FROM vehiculos
            WHERE motor > 50
            ORDER BY motor DESC;


    --10º Muestra el modelo del vehículo y los CC que tiene siguiendo un orden alfabético.--
            SELECT modelo, cilindrada
                FROM vehiculos
                ORDER BY modelo DESC;


    --11º Muestra el modelo del vehículo, los CC y los CV del motor en caso de que el vehículo tenga cilindrada (CC NO SEA NULO).--
            SELECT modelo, cilindrada, motor
                FROM vehiculos
                 WHERE cilindrada IS NULL;


    --12º Muestra la información de los vehículos que NO tienen 150, 210, 205, 523, 530 y más de 600 CV de potencia.--
             SELECT *
             FROM vehiculos
            WHERE motor  NOT IN (150,210,205,523,530) OR motor > 600;


    --13º Muestra la información de los vehículos por orden alfabético, que tengan más de 1000 CC y más o igual de 150 CV.--
            SELECT *
                FROM vehiculos
                WHERE cilindrada > 1000 AND motor >= 150
                ORDER BY modelo ASC;


    --14º Muestra la información de los vehículos por orden alfabético, que tengan más de 1000 CC y más o igual de 150 CV ó muestra también aquellos cuyo CC sea NULL.--

        SELECT *
            FROM vehiculos
            WHERE cilindrada > 1000 AND motor >=150 OR cilindrada IS NULL;



