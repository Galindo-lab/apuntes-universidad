-- 2. Imprimir como catálogo los distintos tipos de estados que puede tener
-- una ORDEN.

-- Usar la base de datos classicmodels
USE classicmodels;

SELECT DISTINCT orders.status
FROM orders;
