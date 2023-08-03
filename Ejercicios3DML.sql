CREATE TABLE almacenes (
    Codigo INT PRIMARY KEY,
    lugar VARCHAR(100),
    capacidad INT
);

CREATE TABLE cajas (
    NumReferencia CHAR(7) PRIMARY KEY,
    contenido VARCHAR(100),
    valor INT,
    almacen INT,
    FOREIGN KEY (almacen) REFERENCES almacenes(Codigo)
);


INSERT INTO almacenes (Codigo, lugar, capacidad) VALUES
	(1, 'Madrid', 1000),
	(2, 'Bilbao', 800),
	(3, 'Barcelona', 1200),
	(4, 'Sevilla', 1500),
	(5, 'Porto', 600),
	(6, 'Tarragona', 900),
	(7, 'Zaragoza', 500),
	(8, 'Toledo', 300),
	(9, 'Valencia', 700),
	(10, 'Malaga', 2000);

INSERT INTO cajas (NumReferencia, contenido, valor, almacen) VALUES
	('CAJA1', 'Ropa de Verano', 50, 1),
	('CAJA2', 'Juguetes', 30, 4),
	('CAJA3', 'Electrodomésticos', 200, 3),
	('CAJA4', 'Libros y Revistas', 20, 7),
	('CAJA5', 'Productos Electrónicos', 300, 2),
	('CAJA6', 'Herramientas', 80, 6),
	('CAJA7', 'Cosméticos', 40, 5),
	('CAJA8', 'Artículos Deportivos', 70, 9),
	('CAJA9', 'Alimentos No Perecederos', 60, 8),
	('CAJA10', 'Materiales de Construcción', 250, 10);

-- Ex 3.1
SELECT * FROM almacenes;

-- Ex 3.2
SELECT * FROM cajas WHERE Valor > 150;

-- Ex 3.3
SELECT DISTINCT Contenido FROM cajas;

-- Ex 3.4
SELECT AVG(Valor) FROM cajas;

-- Ex 3.5
SELECT Almacen, AVG(Valor) FROM cajas GROUP BY Almacen;

-- Ex 3.6
SELECT Almacen, AVG(Valor)
FROM cajas
GROUP BY Almacen
HAVING AVG(Valor) > 150;

-- Ex 3.7
SELECT NumReferencia, Lugar
FROM almacenes, cajas
WHERE almacenes.Codigo = cajas.Almacen;

-- Ex 3.8
SELECT Almacen, COUNT(*)
FROM cajas
GROUP BY Almacen;

-- Ex 3.9
SELECT Codigo
FROM almacenes
WHERE Capacidad < (SELECT COUNT(*) FROM cajas WHERE Almacen = Codigo);

-- Ex 3.10
SELECT NumReferencia
FROM cajas WHERE Almacen IN (SELECT Codigo FROM almacenes WHERE Lugar = 'Bilbao');

-- Ex 3.11
INSERT INTO almacenes (Codigo,Lugar, Capacidad) VALUES (11,'Barcelona Almacen 2', 3);

-- Ex 3.12
INSERT INTO cajas VALUES('H5RT', 'Papel', 200, 2);

-- Ex 3.13
UPDATE cajas SET Valor = Valor * 0.85;

-- Ex 3.14
UPDATE cajas SET Valor = Valor * 0.80 WHERE Valor > (SELECT AVG(Valor) FROM cajas);

-- Ex 3.15
DELETE FROM cajas WHERE Valor < 100;

-- Ex 3.16

