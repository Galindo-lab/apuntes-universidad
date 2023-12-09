-- --------------------------------------------------------------------------
--                  Video 1: Creacion de funciones en SQL
-- --------------------------------------------------------------------------

DELIMITER %
CREATE FUNCTION fn_existencia_pelicula_tienda (
       p_film_id smallint,
       p_store_id tinyint
    )
    RETURNS varchar (
        13) deterministic
BEGIN
DECLARE
    existencia varchar(13);
    SELECT
        (
            CASE WHEN count(*) > 0 THEN
                'Disponible'
            ELSE
                'No Disponible'
            END) INTO existencia
    FROM
        inventory
    WHERE
        film_id = p_film_id
        AND store_id = p_store_id;
    RETURN existencia;
END %

-- No Disponible
select fn_existencia_pelicula_tienda(839,1) existencia;

-- Disponible
select fn_existencia_pelicula_tienda(839,2) existencia;

-- --------------------------------------------------------------------------
--                  Video 2: Trigger before insert
-- --------------------------------------------------------------------------

DELIMITER %
CREATE TRIGGER before_asignaractivocliente_insert
    BEFORE INSERT ON customer
    FOR EACH ROW
BEGIN
    SET new.active = 1;

END
%

-- Insercion de prueba
INSERT INTO customer (store_id, first_name, last_name, address_id)
    VALUES (1, 'sukey', 'nakasima', 1);

-- Verificar salida
SELECT * FROM customer 
ORDER BY customer_id 
DESC LIMIT 1;

-- --------------------------------------------------------------------------
--                  Video 2: Trigger after insert
-- --------------------------------------------------------------------------

-- buscar la película de rocky
SELECT * FROM film
WHERE title LIKE "%rock%";

-- agregar la película al inventario
DELIMITER % 
CREATE TRIGGER after_agregarinventariopelicula_insert
    AFTER INSERT ON film
    FOR EACH ROW
BEGIN
    INSERT INTO inventory (film_id, store_id)
VALUES 
    (new.film_id, 1),
    (new.film_id, 2);
END
%

-- Informacion del film 1
SELECT * FROM film
ORDER BY film_id DESC
LIMIT 1;

-- informacion del inventario
SELECT * FROM inventory
ORDER BY inventory_id DESC
LIMIT 2;

-- --------------------------------------------------------------------------
--                  Video 3: Trigger before update
-- --------------------------------------------------------------------------

UPDATE staff SET PASSWORD = 'admin'
WHERE staff_id = 1;

DELIMITER $$
CREATE TRIGGER before_verificarcambiospassword_update
    BEFORE UPDATE ON staff FOR EACH ROW
BEGIN
    IF EXISTS
    (
       SELECT 1
       FROM staff
       WHERE staff_id = OLD.staff_id
       AND OLD.password = NEW.password
    )
    THEN
        signal sqlstate '45000'
        SET message_text = 'El password es igual al anterior... Cambialo!';
    END IF;
END
$$

-- --------------------------------------------------------------------------
--                  Video 3: Trigger after update
-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER after_actualizaramountpayment_update
    AFTER UPDATE ON film
    FOR EACH ROW UPDATE payment AS p
    INNER JOIN rental AS r ON p.rental_id = r.rental_id
    INNER JOIN inventory AS inv ON r.inventory_id = inv.inventory_id
    SET amount = new.rental_rate
WHERE
    inv.film_id = old.film_id;
END
$$

-- actualixar el rate
UPDATE film SET rental_rate = 5.00
WHERE film_id = 80;


-- Mostrar pagos
SELECT p.*
FROM rental r
    INNER JOIN inventory inv
    ON r.inventory_id = inv.inventory_id

    INNER JOIN payment p
    ON p.rental_id = r.rental_id
WHERE inv.film_id = 80;

-- --------------------------------------------------------------------------
--                  Video 4: Trigger before delete
-- --------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS logeliminarcliente (
    fecha_eliminar timestamp DEFAULT CURRENT_TIMESTAMP,
    usuario_elimino varchar(100),
    customer_id smallint,
    first_name varchar(45),
    last_name varchar(45),
    store_id tinyint,
    active tinyint
);

DELIMITER $$
CREATE TRIGGER before_eliminarcliente_delete
    BEFORE DELETE ON customer
    FOR EACH ROW
BEGIN
    DECLARE usuario varchar(100);
SELECT
    current_user() INTO usuario;

INSERT INTO logeliminarcliente
       (usuario_elimino, customer_id, first_name, last_name, store_id, active)
VALUES
    (usuario, old.customer_id, old.first_name, old.last_name, old.store_id, old.active);
END $$

-- Prueba
DELETE FROM customer
WHERE customer_id = 600;

SELECT * FROM customer
WHERE customer_id = 600;

SELECT * FROM logeliminarcliente;

-- --------------------------------------------------------------------------
--                  Trigger creado por nosotros 
-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER delete_logeliminarcliente
    AFTER DELETE ON logeliminarcliente
    FOR EACH ROW
BEGIN
    signal sqlstate '45000'
    SET message_text = 'Se ha eliminado los logs';

END;
$$

-- mostrar logs 
SELECT * FROM logeliminarcliente;

-- Eliminar el log
DELETE FROM logeliminarcliente
WHERE customer_id = 600;
