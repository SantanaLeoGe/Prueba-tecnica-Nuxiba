create database Prueba
use Prueba

create table usuarios(
	userId int AUTO_INCREMENT,
	Login varchar(100),
	Nombre varchar(100),
	Paterno varchar(100),
	Materno varchar(100),
	PRIMARY KEY (userId)
); 

create table empleados(
userId int AUTO_INCREMENT,
Sueldo double,
FechaIngreso date,
CONSTRAINT us_usuarios
FOREIGN KEY (userId) REFERENCES usuarios(userId)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

select * from usuarios;

select * from empleados;

-- Depurar solo los ID diferentes de 6,7,9 y 10 de la tabla usuarios
DELETE FROM usuarios
WHERE userId NOT IN (6, 7, 9, 10);

-- Actualizar el dato Sueldo en un 10 porciento a los empleados que tienen fechas entre el año 2000 y 2001
UPDATE empleados
SET Sueldo = Sueldo * 1.10
WHERE FechaIngreso BETWEEN '2000-01-01' AND '2001-12-31';

-- Realiza una consulta para traer el nombre de usuario y fecha de ingreso de los usuarios que gananen mas de 10000 y su apellido comience con T ordernado del mas reciente al mas antiguo
SELECT u.Nombre, e.FechaIngreso
FROM empleados e
INNER JOIN usuarios u ON e.userId = u.userId
WHERE e.Sueldo > 10000
  AND u.Paterno LIKE 'T%'
ORDER BY e.FechaIngreso DESC;

-- Realiza una consulta donde agrupes a los empleados por sueldo, un grupo con los que ganan menos de 1200 y uno mayor o igual a 1200, cuantos hay en cada grupo
SELECT 
    CASE 
        WHEN Sueldo < 1200 THEN 'Menos de 1200'
        ELSE '1200 o más'
    END AS GrupoSueldo,
    COUNT(*) AS Cantidad
FROM empleados
GROUP BY GrupoSueldo;
