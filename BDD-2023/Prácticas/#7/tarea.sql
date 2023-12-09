-- --------------------------------------------------------------------------
--          Actividad 1: Función para Calcular Años Transcurridos
-- --------------------------------------------------------------------------

DELIMITER $ 
CREATE FUNCTION fn_anios_transcurridos (fecha_inicial date)
RETURNS int deterministic
BEGIN
    DECLARE days_diff int;
    DECLARE anios_diff int;
    SET days_diff = datediff(now(), fecha_inicial);

    IF (
        month(fecha_inicial) > month(now())
        OR (
            month(fecha_inicial) = month(now()) 
            AND day(fecha_inicial) > day(now())
        )
       )
    THEN
      SET anios_diff = days_diff / 365 - 1;
    ELSE
       SET anios_diff = days_diff / 365;
    END IF;

    RETURN anios_diff;
END
$

-- --------------------------------------------------------------------------
-- Actividad 2: Procedimiento Almacenado para Calcular Edad y Años de Anti...
-- --------------------------------------------------------------------------

DELIMITER $ 
CREATE PROCEDURE sp_edad_y_anios_trabajados ()
BEGIN
    SELECT
        emp_no AS Numero_Empleado,
        concat(first_name, ",", last_name) AS Nombre_Empleado,
        gender AS Genero,
        fn_anios_transcurridos (birth_date) AS Edad,
        fn_anios_transcurridos (hire_date) AS Antiguedad,
        (CASE
            WHEN fn_anios_transcurridos (birth_date) BETWEEN 60 AND 64 THEN
                "Puede iniciar su proceso de pensión"
            WHEN fn_anios_transcurridos (birth_date) > 64 THEN
                "Debe iniciar su proceso de pensión"
            ELSE
                -- Antiguedad < 60
                "No es candidato para pensionarse"
            END) AS Observacion
    FROM
        employees;

END 
$

-- --------------------------------------------------------------------------
-- Actividad 3: Procedimiento Almacenado para Estadísticas de Edad y Pensión
-- --------------------------------------------------------------------------

DELIMITER $
CREATE PROCEDURE sp_estadistica_pension ()
BEGIN
    DECLARE per_fac int;
    -- factor que convierte una cantidad de empleados a porcentaje
    SET per_fac = 100 / (SELECT count(*) FROM employees);

    -- Calcular el número de empleados
    CREATE TEMPORARY TABLE IF NOT EXISTS Freq_Pension AS
    SELECT
        -- Nombre completo del genero
        (
            CASE WHEN gender = "M" THEN
                "MASCULINO"
            WHEN gender = "F" THEN
                "FEMENINO"
            ELSE
                "INDEFINIDO"
            END) AS Genero,


        sum(fn_anios_transcurridos (birth_date) < 60)
                                   AS NO_Son_Candidatos,

        sum(fn_anios_transcurridos (birth_date) BETWEEN 60 AND 65)
                                   AS PUEDEN_Iniciar_Proceso_Pension,

        sum(fn_anios_transcurridos (birth_date) > 65)
                                   AS DEBEN_Iniciar_Proceso_Pension
    FROM
        employees
    GROUP BY
        gender;

    -- Calcular porcentajes
    SELECT
        Genero,
        NO_Son_Candidatos,
        (NO_Son_Candidatos * per_fac)
                                   AS Per_NO_Son_Candidatos,

        PUEDEN_Iniciar_Proceso_Pension,
        (PUEDEN_Iniciar_Proceso_Pension * per_fac)
                                   AS PER_PUEDEN_Iniciar_Proceso_Pension,

        DEBEN_Iniciar_Proceso_Pension,
        (DEBEN_Iniciar_Proceso_Pension * per_fac)
                                   AS PER_DEBEN_Iniciar_Proceso_Pension
    FROM
        Freq_Pension;

    -- Eliminar la tabla temporal
    DROP TABLE Freq_Pension;
END
$

-- --------------------------------------------------------------------------
--         Actividad 4: Trigger BEFORE INSERT para asignar categoría
-- --------------------------------------------------------------------------

ALTER TABLE employees   
ADD category INT CHECK (category >= 1 AND category <= 8);

DELIMITER %
CREATE TRIGGER before_set_category
    BEFORE INSERT ON employees
    FOR EACH ROW
BEGIN
    SET new.category = 1;
END
%

-- --------------------------------------------------------------------------
--    Actividad 5: Trigger AFTER INSERT para Generar Registro en Salaries
-- --------------------------------------------------------------------------

ALTER TABLE salaries MODIFY to_date DATE NULL;

DELIMITER %
CREATE TRIGGER after_add_salary
    AFTER INSERT ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO salaries
    (emp_no, salary, from_date, to_date)
VALUES
    (new.emp_no, 5000, now(), null);
END
%

INSERT INTO employees
    (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES 
    (20000, "2001-08-30", "Luis", "Galindo", "M", now());

SELECT * FROM salaries WHERE emp_no=20000;

-- --------------------------------------------------------------------------
--  Actividad 6: Trigger BEFORE UPDATE con Auditoría de Cambios en Categoría
-- --------------------------------------------------------------------------

CREATE TABLE if not exists employee_category_audit (
    emp_no int not null,
    change_date date,
    old_category int,
    new_Category int,

    CONSTRAINT FK_emp_no FOREIGN KEY (emp_no) 
    references employees(emp_no)
);

DELIMITER %
CREATE TRIGGER after_category_update
    BEFORE UPDATE ON employees
    FOR EACH ROW
BEGIN
    IF old.category <> new.category THEN
        INSERT INTO employee_category_audit
        (emp_no, change_date, old_category, new_Category)
    VALUES
        (new.emp_no, now(), old.category, new.category);
    END IF;
END
%

UPDATE employees SET category=2 WHERE emp_no=20000;
SELECT * FROM employee_category_audit;

-- --------------------------------------------------------------------------
--    Actividad 7: Trigger AFTER UPDATE para Incrementar Salario y Fecha
-- --------------------------------------------------------------------------

ALTER TABLE salaries DROP CONSTRAINT salaries_ibfk_1;
ALTER TABLE salaries DROP CONSTRAINT `PRIMARY`;

DELIMITER %
CREATE TRIGGER after_set_category
    AFTER UPDATE ON employees
    FOR EACH ROW
BEGIN
    DECLARE old_salary INT;
    DECLARE salary_fac FLOAT;
    DECLARE aplication_date date;

    -- ultimo salario
    SET old_salary = (SELECT salary FROM salaries
        WHERE old.emp_no AND to_date IS NULL);

    -- factor de porcentaje
    SET salary_fac = (old_salary / 100);

    -- si es sabado o domingo
    SET aplication_date = (CASE
        WHEN DAYOFWEEK (now()) = 1 THEN
             date_add (now(), interval 1 day) -- domingo
        WHEN DAYOFWEEK (now()) = 7 THEN
             date_add (now(), interval 2 day) -- sabado
        ELSE
            now()
    END);

IF old.category <> new.category THEN
    -- Actualizar fecha del salario
    UPDATE salaries SET to_date = now()
    WHERE emp_no = old.emp_no AND to_date IS NULL;

    -- insertar el nuevo saliario
    INSERT INTO salaries (emp_no, from_date, to_date, salary)
           VALUES (new.emp_no, aplication_date, NULL, (
            -- calcular nuevo salario
            CASE WHEN new.category = 1 THEN
                old_salary + salary_fac * 5  -- + 5%
            WHEN new.category BETWEEN 2 AND 4 THEN
                old_salary + salary_fac * 10 -- +10%
            WHEN new.category BETWEEN 5 AND 7 THEN
                old_salary + salary_fac * 30 -- +30%
            WHEN new.category = 8 THEN
                old_salary + salary_fac * 60 -- +60%
            END));
    END IF;
END
%
