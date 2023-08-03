CREATE DATABASE DML4Mrybakin;
USE DML4Mrybakin;

CREATE TABLE Peliculas (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    calificacionEdad INT
);

CREATE TABLE salas (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Pelicula INT,
    FOREIGN KEY (Pelicula) REFERENCES Peliculas(codigo)
);

INSERT INTO Peliculas (codigo, nombre, calificacionEdad) VALUES
	(1, 'El Secreto del Bosque', 7),
	(2, 'La Perla del Mar', 12),
	(3, 'El Misterio del Faro', 10),
	(4, 'El Encanto de la Luna', 12),
	(5, 'Aventuras en la Jungla', 7),
	(6, 'El Enigma del Tiempo', 10),
	(7, 'La Leyenda del Dragón', 12),
	(8, 'El Tesoro Perdido', 7),
	(9, 'Travesía Estelar', 12),
	(10, 'El Misterio de la Isla', 7);

INSERT INTO salas (Codigo, Nombre, Pelicula) VALUES
	(101, 'Sala 1', 1),
	(102, 'Sala 2', 2),
	(103, 'Sala 3', 3),
	(104, 'Sala 4', 4),
	(105, 'Sala 5', 5),
	(106, 'Sala 6', 6),
	(107, 'Sala 7', 7),
	(108, 'Sala 8', 8),
	(109, 'Sala 9', 9),
	(110, 'Sala 10', 10);

-- Ex 4.1
SELECT nombre FROM Peliculas;

-- Ex 4.2
SELECT DISTINCT calificacionEdad FROM Peliculas;

-- Ex 4.3
SELECT * FROM Peliculas WHERE calificacionEdad IS NULL;

-- Ex 4.4
SELECT salas.Codigo, salas.Nombre
FROM salas
LEFT JOIN Peliculas ON salas.Pelicula = Peliculas.codigo
WHERE Peliculas.codigo IS NULL;

-- Ex 4.5
SELECT * FROM salas LEFT JOIN Peliculas ON salas.Pelicula = Peliculas.Codigo;

-- Ex 4.6


-- Ex 4.7
SELECT Peliculas.Nombre FROM salas RIGHT JOIN Peliculas ON salas.Pelicula = Peliculas.Codigo WHERE salas.Pelicula IS NULL;

-- Ex 4.8
INSERT INTO Peliculas(Codigo,Nombre,CalificacionEdad) VALUES(11,'Uno, Dos, Tres', 7);

-- Ex 4.9
UPDATE PELICULAS SET CalificacionEdad=13 WHERE CalificacionEdad IS NULL;

-- Ex 4.10
DELETE FROM salas WHERE Pelicula IN (SELECT Codigo FROM Peliculas WHERE CalificacionEdad = 0)
