/*
  Luis Carlos Mora Fonseca 2017197955
 */
CREATE TABLE IF NOT EXISTS Especie
(
    IdEspecie        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    NombreEspañol    TEXT    NOT NULL,
    NombreCientifico TEXT    NOT NULL,
    DescripGeneral   TEXT    NOT NULL,
    IdZona           INTEGER NOT NULL,
    FOREIGN KEY (IdZona) REFERENCES Zona (IdZona)
);

INSERT INTO Especie (NombreEspañol, NombreCientifico, DescripGeneral, IdZona)
VALUES ('Rana', 'Ranitis', 'Esta es la descripcion de una rana', 1),
       ('Perro', 'Perritis', 'Esta es la descripcion de un perro', 2),
       ('Gato', 'Gatistis', 'Esta es la descripcion de un gato', 2);

CREATE TABLE IF NOT EXISTS Habitat
(
    IdHabitat  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre     TEXT    NOT NULL,
    Clima      TEXT    NOT NULL,
    Vegetacion TEXT    NOT NULL
);

INSERT INTO Habitat (Nombre, Clima, Vegetacion)
VALUES ('Sabana', 'Seca', 'Poca'),
       ('Antartica', 'Frio', 'Nula'),
       ('Bosque', 'Humedo', 'Mucha');


CREATE TABLE IF NOT EXISTS Continente
(
    IdContinente INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre       TEXT    NOT NULL
);

INSERT INTO Continente(Nombre)
VALUES ('America'),
       ('Oceania'),
       ('Antartida');

CREATE TABLE IF NOT EXISTS Habitat_Continente
(
    IdHabitatContinente INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdHabitat           INTEGER NOT NULL,
    IdContinente        INTEGER NOT NULL,
    FOREIGN KEY (IdHabitat) REFERENCES Habitat (IdHabitat),
    FOREIGN KEY (IdContinente) REFERENCES Continente (IdContinente)
);
INSERT INTO Habitat_Continente (IdHabitat, IdContinente)
VALUES (1, 1),
       (2, 2),
       (1, 3);

CREATE TABLE IF NOT EXISTS Habitat_Zona
(
    IdHabitatZona INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdZona        INTEGER NOT NULL,
    IdHabitat     INTEGER NOT NULL,
    FOREIGN KEY (IdZona) REFERENCES Zona (IdZona),
    FOREIGN KEY (IdHabitat) REFERENCES Habitat (IdHabitat)

);

INSERT INTO Habitat_Zona(IdZona, IdHabitat)
VALUES (1, 3),
       (2, 1),
       (3, 2);

CREATE TABLE IF NOT EXISTS Zona
(
    IdZona        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre        TEXT    NOT NULL,
    ExtensionAREA INTEGER NOT NULL
);

INSERT INTO Zona (Nombre, ExtensionAREA)
VALUES ('Rural', 100),
       ('Tierrosa', 150),
       ('Tropical', 200);



CREATE TABLE IF NOT EXISTS Itinerario
(
    IdItinerario  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Codigo        TEXT    NOT NULL,
    Duracion      TIME    NOT NULL,
    Longitud      INTEGER NOT NULL,
    MaxVisitantes INTEGER NOT NULL,
    NumEspecies   INTEGER NOT NULL,
    FechaPaseo    TIME    NOT NULL
);

INSERT INTO Itinerario(Codigo, Duracion, Longitud, MaxVisitantes, NumEspecies, FechaPaseo)
VALUES ('ABC', '12:00:42', 10, 300, 45, '2019-09-12'),
       ('CBD', '11:32:21', 100, 400, 500, '2015-09-10'),
       ('ZZZ', '02:30:14', 40, 500, 400, '2005-04-08');


CREATE TABLE IF NOT EXISTS Itinerario_Zona
(
    IdItinerarioZona INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdItinerario     INTEGER NOT NULL,
    IdZona           INTEGER NOT NULL,
    FOREIGN KEY (IdItinerario) REFERENCES Itinerario (IdItinerario),
    FOREIGN KEY (IdZona) REFERENCES Zona (IdZona)

);

INSERT INTO Itinerario_Zona (IdItinerario, IdZona)
VALUES (1, 1),
       (2, 2),
       (3, 3);

INSERT INTO Empleado (Nombre, Apellido1, Apellido2, Direccion, Telefono, FechaInicio, Cargo, Salario)
VALUES ('Joseph', 'Gonzalez', 'Pastora', 'Alajuelita', '8888444888', '13:55:88', 'Cuidador', 10000),
       ('Carlos', 'Leahy', 'Vasquez', 'Cartago', '8601525512', '16:31:83', 'Cuidador', 15482),
       ('Eduardo', 'Jimenez', 'Campos', 'Limon', '44555165', '06:33:83', 'Cuidador', 500),
       ('Luis', 'Mora', 'Benavides', 'Puntarenas', '4245761', '16:33:83', 'Guia', 14524),
       ('Isaac', 'Fausto', 'Brenes', 'Cartago', '5125626', '16:23:83', 'Guia', 586252),
       ('Valeria', 'Campos', 'Carrillo', 'San Jose', '85858468', '15:32:98', 'Guia', 56165);

CREATE TABLE IF NOT EXISTS EmpleadoTest
(
    IdEmpleado  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Nombre      TEXT    NOT NULL,
    Apellido1   TEXT    NOT NULL,
    Apellido2   TEXT    NOT NULL,
    Direccion   TEXT    NOT NULL,
    Telefono    TEXT    NOT NULL,
    FechaInicio DATE    NOT NULL,
    Cargo       TEXT,
    Salario     INTEGER NOT NULL
);

INSERT INTO EmpleadoTest
WITH RECURSIVE cnt(id, a, b, c, d, e, x, y, z) AS (
    VALUES (1, 'Nombre' || 1, 'Ap1' || 1, 'Ap2' || 1, 'Direccion' || 1, random(), '20' || random(), 'cargo' || 1,
            random())
    UNION ALL
    SELECT id + 1,
           'Nombre' || (id + 1),
           'Ap1' || (id + 1),
           'Ap2' || (id + 1),
           'Direccion' || random(),
           random(),
           '-' || random(),
           'cargo' || random(),
           random()
    FROM cnt
    WHERE id < 2000)
SELECT *
FROM cnt;

SELECT *
FROM EmpleadoTest;

CREATE TABLE IF NOT EXISTS Guia
(
    IdGuia       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdEmpleado   TEXT    NOT NULL,
    FechaIngreso DATE,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado)
);

INSERT INTO Guia (IdEmpleado, FechaIngreso)
VALUES (1, '2019-09-09'),
       (2, '2019-09-08'),
       (3, '2019-09-07');

CREATE TABLE IF NOT EXISTS Cuidador
(
    IdCuidador   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdEmpleado   TEXT    NOT NULL,
    FechaIngreso DATE,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado)
);
INSERT INTO Cuidador(IdEmpleado, FechaIngreso)
VALUES (4, '2011-03-03'),
       (5, '2007-05-05'),
       (6, '2018-06-07');



CREATE TABLE IF NOT EXISTS Itinerario_Guia
(
    IdItinerarioGuia INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdItinerario     INTEGER NOT NULL,
    IdGuia           INTEGER NOT NULL,
    FOREIGN KEY (IdItinerario) REFERENCES Itinerario (IdItinerario),
    FOREIGN KEY (IdGuia) REFERENCES Guia (IdGuia)

);

INSERT INTO Itinerario_Guia (IdItinerario, IdGuia)
VALUES (1, 1),
       (2, 2),
       (3, 3);

CREATE TABLE IF NOT EXISTS Especie_Cuidador
(
    IdEspecieCuidador INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    IdEspecie         INTEGER NOT NULL,
    IdCuidador        INTEGER NOT NULL,
    FechaCuido        DATE,
    FOREIGN KEY (IdEspecie) REFERENCES Especie (IdEspecie),
    FOREIGN KEY (IdCuidador) REFERENCES Cuidador (IdCuidador)
);


INSERT INTO Especie_Cuidador(IdEspecie, IdCuidador, FechaCuido)
VALUES (1, 1, '01-01-19'),
       (2, 2, '05-05-19'),
       (3, 3, '08-04-19');

/*--------------------------------------------------------------------------------------*/
--1
SELECT *
FROM Empleado;

--2
SELECT *
FROM Especie;

--3
SELECT Nombre, Apellido1, Apellido2, main.Empleado.Cargo
FROM Empleado
ORDER BY Cargo AND Salario;

--4
SELECT Nombre, Apellido1, Apellido2
FROM Empleado
         INNER JOIN Cuidador C ON Empleado.IdEmpleado = C.IdEmpleado
WHERE C.FechaIngreso BETWEEN '2005-01-01' AND '2015-12-31';

--5
SELECT Nombre, Apellido1, Apellido2
FROM Empleado
WHERE Salario < 100000;

--6
SELECT Nombre, COUNT(Nombre) AS MasFrecuente
FROM Habitat
         INNER JOIN Habitat_Continente HC ON
    Habitat.IdHabitat = HC.IdHabitat
GROUP BY Nombre
ORDER BY MasFrecuente DESC
LIMIT 1;

--7
SELECT Nombre, COUNT(Nombre) AS MasEspecies
FROM Zona
         INNER JOIN Especie E ON Zona.IdZona = E.IdZona
GROUP BY Nombre
ORDER BY MasEspecies DESC;

--8
SELECT Empleado.Nombre, Codigo, MaxVisitantes, Z.Nombre
FROM Empleado
         INNER JOIN Guia G ON Empleado.IdEmpleado = G.IdEmpleado
         INNER JOIN Itinerario_Guia IG ON G.IdGuia = IG.IdGuia
         INNER JOIN Itinerario I ON IG.IdItinerario = I.IdItinerario
         INNER JOIN Itinerario_Zona IZ ON I.IdItinerario = IZ.IdItinerario
         INNER JOIN Zona Z ON IZ.IdZona = Z.IdZona
WHERE I.FechaPaseo = '2019-09-12';