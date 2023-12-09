-- 3. Frecuencias de los Estados_Orden por Año y Mes.

-- Usar la base de datos classicmodels
USE classicmodels;

SELECT
    Año,
    Mes,
    Estado_Orden,
    count(Estado_Orden) AS Total_Orden_Estado
FROM (
    SELECT
        year (orders.orderDate) AS Año,
        MONTHNAME (orders.orderDate) AS Mes,
        orders.status AS Estado_Orden
    FROM
        orders) estados_orden
GROUP BY
    Año,
    Mes,
    Estado_Orden;

