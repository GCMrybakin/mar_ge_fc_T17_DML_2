CREATE TABLE Departamentos (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    presupuesto DECIMAL(12, 2)
);

CREATE TABLE empleados (
    DNI VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    departamento INT,
    FOREIGN KEY (departamento) REFERENCES Departamentos(codigo)
);


INSERT INTO Departamentos (codigo, nombre, presupuesto) VALUES
	(1, 'Ventas', 100000.00),
	(2, 'Marketing', 80000.00),
	(3, 'Recursos Humanos', 120000.00),
	(4, 'Producción', 200000.00),
	(5, 'Contabilidad', 90000.00),
	(6, 'Desarrollo', 150000.00),
	(7, 'Investigación', 85000.00),
	(8, 'Logística', 110000.00),
	(9, 'Calidad', 75000.00),
	(10, 'Servicio al Cliente', 95000.00);

INSERT INTO empleados (DNI, nombre, apellidos, departamento) VALUES
	('12345678', 'Eric', 'Oliveras', 1),
	('87654321', 'Imogene', 'Willis', 2),
	('54321678', 'Josephine', 'Smith', 3),
	('87654312', 'Michelle', 'Alvarez', 4),
	('65432187', 'Vickie', 'Wolff', 5),
	('87651234', 'Kevin', 'Stauffer', 6),
	('56781234', 'Leah', 'Rogers', 7),
	('98761234', 'Loni', 'Davis', 8),
	('12783645', 'James', 'Andujar', 9),
	('90871234', 'Karie', 'Copley', 10);

-- Ex 2.1
SELECT Apellidos FROM empleados;

-- Ex 2.2
SELECT DISTINCT Apellidos FROM empleados;

-- Ex 2.3
SELECT * FROM empleados WHERE Apellidos = 'Smith';

-- Ex 2.4
SELECT *
FROM empleados
WHERE Apellidos = 'Smith' OR Apellidos = 'Rogers';

-- Ex 2.5
SELECT * FROM empleados WHERE Departamento = 10;

-- Ex 2.6
SELECT *
FROM empleados
WHERE Departamento = 3 OR Departamento = 7;

-- Ex 2.7
SELECT * FROM empleados WHERE Apellidos LIKE 'P%';

-- Ex 2.8
SELECT SUM(Presupuesto) FROM Departamentos;

-- Ex 2.9
SELECT Departamento, COUNT(*)
FROM empleados
GROUP BY Departamento;

-- Ex 2.10
SELECT *
FROM empleados, Departamentos
WHERE empleados.Departamento = Departamentos.Codigo;

-- Ex 2.11
SELECT Emp.Nombre, Apellidos, Dep.Nombre, Presupuesto
FROM empleados Emp, Departamentos Dep
WHERE Emp.Departamento = Dep.Codigo;

-- Ex 2.12
SELECT empleados.Nombre, Apellidos
FROM empleados, Departamentos
WHERE empleados.Departamento = Departamentos.Codigo
AND Departamentos.Presupuesto > 60000;

-- Ex 2.13
SELECT *
FROM Departamentos
WHERE Presupuesto > (SELECT AVG(Presupuesto) FROM Departamentos);

-- Ex 2.14


-- Ex 2.15
INSERT INTO Departamentos
VALUES ( 11 , 'Calidad' , 40000);

INSERT INTO empleados
VALUES ('89267109', 'Esther', 'Vázquez', 11);

-- Ex 2.16
UPDATE Departamentos SET Presupuesto = Presupuesto * 0.9;

-- Ex 2.17
UPDATE empleados SET Departamento = 4 WHERE Departamento = 7;

-- Ex 2.18
DELETE FROM empleados WHERE Departamento = 4;

-- Ex 2.19
DELETE FROM empleados
WHERE Departamento IN (SELECT Codigo FROM Departamentos WHERE Presupuesto >= 60000);

-- Ex 2.20
DELETE FROM EMPLEADOS;