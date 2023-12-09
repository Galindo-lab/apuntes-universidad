use sakila;

delimiter $$
CREATE PROCEDURE sp_Insertar_Actor(
	IN p_first_name varchar(45),
    IN p_last_name varchar(45))
begin
	DECLARE actor_existe INT;
    -- Verifica si el actor con el nombre y apellido proporcionados existen
	select COUNT(*) INTO actor_existe
    FROM actor
    WHERE first_name = p_first_name and last_name = p_last_name;

    -- Si el cliente no existe, aniadirlo a la tabla de actores
    IF actor_existe = 0 THEN
		insert into actor(first_name, last_name) values(p_first_name, p_last_name);
	ELSE
		-- Si el actor existe
        signal sqlstate '45000'
        SET message_text = 'El actor ya esta registrado.';
	END IF;
End
$$