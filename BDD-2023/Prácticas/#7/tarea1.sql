use employees;

-- Parte 1
-- ---------------------------
DROP FUNCTION IF EXISTS fn_anios_transcurridos;

DELIMITER $ CREATE FUNCTION fn_anios_transcurridos (fecha_inicial date)
    RETURNS int deterministic
BEGIN
DECLARE
    anios_diff int;
    DECLARE days_diff int;
    DECLARE anios date;
    -- Calcular la diferencia de años utilizando DATEDIFF
    SET days_diff = datediff (now(), fecha_inicial);
    SET anios_diff = days_diff / 365;
    
    IF (
        month (fecha_inicial) > month (now()))
        OR (
           month (fecha_inicial) = month (now())
           AND
           day (fecha_inicial) > day (now())) THEN
        SET anios_diff = anios_diff - 1;
    ELSE
        SET anios_diff = anios_diff;
    END IF;
    RETURN anios_diff;
END $
-- SELECT fn_anios_transcurridos('2024-10-25');
-- parte 2
-- ---------------
/* DROP PROCEDURE sp_edad_y_anios_trabajados;

delimiter $
create procedure sp_edad_y_anios_trabajados()
begin 
 select 
 emp_no as Numero_Empleado,
 concat(first_name,",",last_name) as Nombre_Empleado,
 gender as Genero,
 fn_anios_transcurridos(birth_date) as Edad,
 fn_anios_transcurridos(hire_date) as Antiguedad
 from employees;
end
$ */
CALL sp_edad_y_anios_trabajados;
