-- 5. Imprimir el Total de Ordenes Registradas y su Importe por cada Empleado

USE classicmodels;

-- clientes del empleado
CREATE TEMPORARY TABLE IF NOT EXISTS Employee_Customer AS
SELECT
    t1.employeeNumber AS Numero_Empleado,
    concat(t1.firstName, " ", t1.lastName) AS Nombre_Empleado,
    t2.customerNumber AS Numero_Cliente
FROM
    employees AS t1
    INNER JOIN customers AS t2 ON t1.employeeNumber = t2.salesRepEmployeeNumber;

-- Unidades y precio de la orden
CREATE TEMPORARY TABLE IF NOT EXISTS Customer_Order AS
SELECT
    t1.customerNumber AS Numero_Cliente,
    t2.quantityOrdered AS Cantidad_Ordenada,
    t2.priceEach AS Precio_Unitario
FROM
    orders AS t1
    INNER JOIN orderdetails AS t2 ON t1.orderNumber = t2.orderNumber;

-- Ordenes empleado
CREATE TEMPORARY TABLE IF NOT EXISTS Ordenes_Empleado AS
SELECT
    t1.Numero_Empleado AS Numero_Empleado,
    t1.Nombre_Empleado AS Nombre_Empleado,
    t2.Cantidad_Ordenada AS Cantidad_Ordenada,
    t2.Precio_Unitario AS Precio_Unitario
FROM
    Employee_Customer AS t1
    INNER JOIN Customer_Order AS t2 ON t1.Numero_Cliente = t2.Numero_Cliente;

-- mostar los datos
SELECT
    Numero_Empleado AS Numero_Empleado,
    Nombre_Empleado AS Nombre_Empleado,
    sum(Cantidad_Ordenada) AS Total_Ordenes_Registradas,
    sum(Cantidad_Ordenada * Precio_Unitario) AS Importe_Total_Ordenes
FROM
    Ordenes_Empleado
GROUP BY
    Numero_Empleado,
    Nombre_Empleado
ORDER BY
    Importe_Total_Ordenes DESC;

DROP TABLE IF EXISTS Employee_Customer, Customer_Order, Ordenes_Empleado;

