-- 1. ¿Cuál es el producto más ordenado en el año?

-- Usar la base de datos classicmodels
USE classicmodels;

-- Crear una tabla temporal para productos y líneas de producto
CREATE TEMPORARY TABLE IF NOT EXISTS product_details AS
SELECT
    productlines.productLine AS Categoria,
    products.productCode AS Codigo_Producto,
    products.productName AS Nombre_Producto
FROM
    products
    INNER JOIN productlines ON products.productLine = productlines.productLine;

-- Crear una tabla temporal para productos y cantidades de pedido
CREATE TEMPORARY TABLE IF NOT EXISTS product_quantity AS
SELECT
    orderdetails.productCode AS Codigo_Producto,
    sum(orderdetails.quantityOrdered) AS Total_Producto_Ordenado
FROM
    products
    CROSS JOIN orderdetails
WHERE
    products.productCode = orderdetails.productCode
GROUP BY
    Codigo_Producto;

-- maximo valor de la tabla
CREATE TEMPORARY TABLE IF NOT EXISTS max_product_quantity AS
SELECT
    max(Total_Producto_Ordenado) AS Total_Producto_Ordenado
FROM
    product_quantity;

-- maximo valor de la tabla con codigo
CREATE TEMPORARY TABLE IF NOT EXISTS max_product AS
SELECT
    pq.Codigo_Producto AS Codigo_Producto,
    mq.Total_Producto_Ordenado AS Total_Producto_Ordenado
FROM
    product_quantity AS pq
    CROSS JOIN max_product_quantity AS mq
WHERE
    pq.Total_Producto_Ordenado = mq.Total_Producto_Ordenado;

-- detalles del articulo mas vendido
CREATE TEMPORARY TABLE IF NOT EXISTS max_product_details AS
SELECT
    *
FROM
    product_details
WHERE
    product_details.Codigo_Producto IN (
        SELECT
            Codigo_Producto
        FROM
            max_product);

-- salida
SELECT
    max_product_details.Categoria,
    max_product_details.Codigo_Producto,
    max_product_details.Nombre_Producto,
    max_product.Total_Producto_Ordenado
FROM
    max_product_details
    CROSS JOIN max_product;


-- eliminar las tablas
DROP TABLE IF EXISTS product_details;
DROP TABLE IF EXISTS max_product_quantity;
DROP TABLE IF EXISTS product_quantity;
DROP TABLE IF EXISTS max_product;
DROP TABLE IF EXISTS max_product_details;

