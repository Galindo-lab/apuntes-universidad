-- 4. Frecuencias de los Estados_Orden y su Porcentaje de Representación con
-- Respecto a Todas las Ordenes Generadas.

USE classicmodels;

SELECT
    orders.status AS Estado_Orden,
    count(orders.status) AS Total_Orden_Estado,
    100 * ((count(orders.status) / (
            SELECT
                count(*)
            FROM orders))) AS Proc_Rep_Estado
FROM
    orders
GROUP BY
    Estado_Orden;

