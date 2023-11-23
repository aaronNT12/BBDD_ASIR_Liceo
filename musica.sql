--Ejercicio para practicar SQL--

--1º CREAMOS LA BASE DE DATOS DE MÚSICA--

CREATE DATABASE musica;

USE  musica;

--2º CREAMOS LAS TABLAS DE LA BASE DE DATOS --

    --CREAMOS LA TABLA DISCOS--

    CREATE TABLE discos(
        idDisco INT(2) PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(55) NOT NULL,
        genero ENUM("Rock","Metal","Jazz","Rap") NOT NULL,
        idArtista INT,
        FOREIGN KEY (idArtista) REFERENCES artistas(id)
    );

  CREATE TABLE artistas(
    idArtista INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(55),
    pais VARCHAR(55),
    activo TINYINT(1)
);

    --REALIZAMOS LOS INSERTS EN LA TABLA ARTISTAS--

    INSERT INTO artistas(nombre,pais,activo)
    VALUES("Eminem","Estados Unidos",1),
    ("Iron Maiden","Reino Unido",1),
    ("2Pac","Estados Unidos",0),
    ("Motley Crue","Estados Unidos",1),
    ("Fernado Costa","España",1),
    ("Natos y Waor","España",1),
    ("Foo Fighters","Estados Unidos",1),
    ("Hard GZ","España",1);

--REALIZAMOS LOS INSERTS EN LA TABLA DISCOS--

    INSERT INTO discos(nombre,genero,idArtista)
    ("All Eyez On Me","Rap",3),
    ("Me Agaist The World","Rap",3),
    ("Dr.Feelgood","Rock",4),
    ("To Fast To Love","Rock",4),
    ("Aces High","Rock",2),
    ("Kamikaze","Rap",1),
    ("Encore","Rap",1),
    ("Tirititando","Rap",5),
    ("In Your Honor","Rock",7),
    ("Luna Llena","Rap",6),
    ("Cicatrices","Rap",6),
    ("Kaos Nomada","Rap",8),
    ("Lacosta","Rap",8);

