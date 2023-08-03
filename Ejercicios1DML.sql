-- Ejercicios DML II Mrybakin
CREATE TABLE fabricantes (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100)
);
CREATE TABLE articulos (
     Codigo INT PRIMARY KEY auto_increment,
     Nombre VARCHAR(100),
     Precio DECIMAL(10, 2),
     Fabricante INT,
     CONSTRAINT fk_fabricante_articulos FOREIGN KEY (Fabricante) REFERENCES Fabricantes(Codigo)
);

INSERT INTO fabricantes (Codigo, Nombre)
VALUES
    (1, 'Samsung'),
    (2, 'Apple'),
    (3, 'Sony Corporation'),
    (4, 'LG Electronics'),
    (5, 'Panasonic Corporation'),
    (6, 'Microsoft'),
    (7, 'Intel'),
    (8, 'ASUS Tek Computer'),
    (9, 'Lenovo Group Limited'),
    (10, 'Dell Technologies');

INSERT INTO articulos (Codigo, Nombre, Precio, Fabricante)
VALUES
    (1, 'Samsung Galaxy S21', 799.99, 1),
    (2, 'iPhone 13 Pro', 1099.00, 2),
    (3, 'Sony Bravia 4K TV', 1299.50, 3),
    (4, 'LG OLED CX Series', 1899.00, 4),
    (5, 'Panasonic Lumix Camera', 699.99, 5),
    (6, 'Microsoft Surface Laptop', 1299.00, 6),
    (7, 'Intel Core i9 Processor', 499.99, 7),
    (8, 'ASUS ROG Gaming Monitor', 699.00, 8),
    (9, 'Lenovo ThinkPad X1 Carbon', 1699.50, 9),
    (10, 'Dell XPS 15', 1499.95, 10);

-- Ex 1.1
SELECT nombre
FROM articulos;

-- Ex 1.2
SELECT nombre,precio
FROM articulos;

-- Ex 1.3
SELECT nombre, precio
FROM articulos
WHERE precio <= 200;

-- Ex 1.4
SELECT nombre, precio
FROM articulos
WHERE precio > 59 and precio < 121;

-- Ex 1.5
SELECT nombre, precio * 166386 AS Precio_Peseta
FROM articulos;

-- Ex 1.6
SELECT AVG(Precio)
FROM articulos;

-- Ex 1.7
SELECT AVG(Precio) 
FROM articulos 
WHERE Fabricante = 2;

-- Ex 1.8
SELECT COUNT(*) 
FROM articulos 
WHERE Precio >= 180;

-- Ex 1.9
SELECT Nombre, Precio
FROM articulos
WHERE Precio >= 180
ORDER BY Precio DESC, Nombre;

-- Ex 1.10
SELECT *
FROM articulos
JOIN fabricantes ON articulos.Fabricante = fabricantes.Codigo;

-- Ex 1.11
SELECT articulos.Nombre, Precio, fabricantes.Nombre
FROM articulos, fabricantes
WHERE articulos.Fabricante = fabricantes.Codigo;

-- Ex 1.12
SELECT AVG(Precio), fabricante
FROM articulos
GROUP BY Fabricante;

-- Ex 1.13
SELECT AVG(Precio), fabricantes.Nombre
FROM articulos, fabricantes
WHERE articulos.Fabricante = fabricantes.Codigo
GROUP BY fabricantes.Nombre;

-- Ex 1.14
SELECT AVG(Precio), fabricantes.Nombre
FROM articulos, fabricantes
WHERE articulos.Fabricante = fabricantes.Codigo
GROUP BY fabricantes.Nombre
HAVING AVG(Precio) >= 150;

-- Ex 1.15
SELECT Nombre, Precio
FROM articulos
WHERE Precio = (SELECT MIN(Precio) FROM articulos);

-- Ex 1.16


-- Ex 1.17
INSERT INTO articulos (Codigo,Nombre, Precio ,Fabricante) VALUES (11,'Altavoces', 70, 2);

-- Ex 1.18
UPDATE articulos SET Nombre = 'Impresora Laser' WHERE Codigo = 8;

-- Ex 1.19
UPDATE articulos SET Precio = Precio * 0.9;

-- Ex 1.20
UPDATE ARTICULOS SET Precio = Precio - 10 WHERE Precio >= 120;