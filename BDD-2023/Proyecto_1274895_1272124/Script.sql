use mydb;

/**
 * @autor Hector Miguel Macias Baltazar
 * Obtener el costo total del proyecto
 */
DELIMITER %%
CREATE PROCEDURE costo_total_proyecto()
BEGIN
    SELECT 
        sum(pago_total(
            horas_trabajadas(id_integrante),
            integrante_salario
        )) as "Costo total proyecto"
    FROM integrante;
END
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Obtener el numero de horas trabajadas del integrante
 * @param p_id_integrante 
 */
DELIMITER %%
CREATE FUNCTION horas_trabajadas(p_id_integrante INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total_horas INT;

    SELECT SUM(TIMESTAMPDIFF(hour, control_horario_entrada, control_horario_salida))
    INTO total_horas
    FROM control_horario
    WHERE control_horario_salida IS NOT NULL
    AND id_integrante = p_id_integrante;

    RETURN total_horas;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * salario mas alto en el equipo
 * @param p_id_equipo
 **/
DELIMITER %%
CREATE PROCEDURE salario_mas_alto_equipo(
	IN p_id_equipo INT
)
BEGIN
    SELECT 
		MAX(integrante_salario) 
    FROM integrante
	WHERE equipo_id_equipo = p_id_equipo;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * salario mas bajo en el equipo
 * @param p_id_equipo
 **/
DELIMITER %%
CREATE PROCEDURE salario_mas_bajo_equipo(
	IN p_id_equipo INT
)
BEGIN
    SELECT 
		MIN(integrante_salario) 
    FROM integrante
	WHERE equipo_id_equipo = p_id_equipo;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Calcular el promedio de salario usando la función AVG
 **/
DELIMITER %%
CREATE PROCEDURE calcular_promedio_salario()
BEGIN
    SELECT AVG(integrante_salario) 
    FROM integrante;
END 
%%


/**
 * @autor Hector Miguel Macias Baltazar
 * Calcular pago total (salario * horas)
 * @param horas
 * @param salario
**/
DELIMITER %%
CREATE FUNCTION pago_total(
    horas INT, 
    salario INT
)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE pago INT;
    SET pago = horas*salario;
    RETURN pago;
END 
%%


/**
 * @autor Hector Miguel Macias Baltazar
 * Connvertir segundos a horas
 * @param segundos
**/
DELIMITER %%
CREATE FUNCTION convertir_segundos_horas(
    segundos INT
)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    SET resultado = FLOOR(segundos/3600);
    RETURN resultado;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Marca una tarea como terminada 
 * @param p_id_tarea
 * @param 
 */
DELIMITER %%
CREATE PROCEDURE marcar_tarea_completada(
    IN p_id_tarea INT
)
BEGIN
    -- Actualizar el estado de la tarea a 'completado'
    UPDATE tarea
    SET tarea_status = 'COMPLETADO'
    WHERE id_tarea = p_id_tarea;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Marca una tarea como terminada 
 * @param p_id_tarea
 * @param 
 */
DELIMITER %%
CREATE PROCEDURE marcar_tarea_cancelada(
    IN p_id_tarea INT
)
BEGIN
    -- Actualizar el estado de la tarea a 'completado'
    UPDATE tarea
    SET tarea_status = 'CANCELADO'
    WHERE id_tarea = p_id_tarea;
END 
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Agregar dias extras a la duracion de una tarea 
 * @param p_integrante_id
 * @param p_duracion_prorroga
 */
DELIMITER %%
CREATE PROCEDURE agregar_prorroga(
	IN p_id_tarea INT,
    IN p_duracion_prorroga INT
)
BEGIN
    DECLARE v_tarea_duracion_actual INT;

    -- Obtener la duración actual de la tarea
    SELECT tarea_duracion 
    INTO v_tarea_duracion_actual
    FROM tarea
    WHERE id_tarea = p_id_tarea;

    -- Actualizar la duración de la tarea
    UPDATE tarea
    SET tarea_duracion = v_tarea_duracion_actual + p_duracion_prorroga
    WHERE id_tarea = p_id_tarea;
END 
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * llamar a este metodo para marcar la entrada o salida de un integrante
 * @param p_integrante_id
 */
DELIMITER %%
CREATE PROCEDURE control_integrante(
    IN p_integrante_id INT
)
BEGIN
    DECLARE v_id_control INT;
    
    -- guardar la utima entrada
	SELECT id_control_horario
    INTO v_id_control 
    FROM control_horario
    WHERE p_integrante_id = id_integrante
    AND control_horario_salida IS NULL;
    
    IF v_id_control IS NULL THEN
		INSERT INTO control_horario(
            id_integrante
        ) 
        VALUES (
            p_integrante_id
        );
        
        SELECT 'creado' AS mensaje;     
    ELSE
		UPDATE control_horario 
        SET 
            control_horario_salida = CURRENT_TIMESTAMP, 
            id_integrante = p_integrante_id
		WHERE id_control_horario = v_id_control;
        
        SELECT 'actualizado' AS mensaje;     
    END IF;
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea un nuevo integrante en el equipo.
 * 
 * @param p_nombre      Nombre del nuevo integrante.
 * @param p_email       Email del nuevo integrante.
 * @param p_salario     Salario del nuevo integrante.
 * @param p_equipo_id   ID del equipo al que pertenece.
 */
DELIMITER %%
CREATE PROCEDURE crear_integrante(
	IN p_nombre VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_salario INT,
    IN p_equipo_id INT
)
BEGIN
	INSERT INTO integrante(
		integrante_nombre,
		integrante_email,
        integrante_salario,
        equipo_id_equipo
    )
	VALUES (
		p_nombre,
		p_email,
        p_salario,
        p_equipo_id
	);
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea un nuevo equipo.
 *
 * @param p_nombre Nombre del nuevo equipo.
 */
DELIMITER %%
CREATE PROCEDURE crear_equipo(
	IN p_nombre VARCHAR(45)
)
BEGIN
	INSERT INTO equipo (
        equipo_nombre, 
        equipo_estatus
    ) 
    VALUES (
        p_nombre, 
        "activo"
    );
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea una nueva tarea.
 *
 * @param p_inicio       Fecha de inicio de la tarea.
 * @param p_nombre       Nombre de la tarea.
 * @param p_descripcion  Descripción de la tarea.
 * @param p_duracion     Duración estimada de la tarea.
 */
DELIMITER %%
CREATE PROCEDURE crear_tarea(
    IN p_inicio DATETIME,
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(255),
    IN p_duracion INT
)
BEGIN
    INSERT INTO tarea (
        tarea_inicio,
        tarea_nombre,
        tarea_descripcion,
        tarea_duracion
    )
    VALUES (
        p_inicio,
        p_nombre,
        p_descripcion,
        p_duracion
	);
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Asigna un equipo a una tarea existente.
 *
 * @param p_id_equipo ID del equipo a asignar.
 * @param p_id_tarea  ID de la tarea a la que se asignará el equipo.
 */
DELIMITER %%
CREATE PROCEDURE asignar_equipo_tarea(
    IN p_id_equipo INT,
    IN p_id_tarea INT
)
BEGIN
    UPDATE tarea
    SET equipo_id_equipo = p_id_equipo
    WHERE id_tarea = p_id_tarea;
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Asigna un integrante a una tarea existente.
 *
 * @param p_id_integrante ID del integrante.
 * @param p_id_tarea      ID de la tarea a la que se asignará.
 * @return Mensaje indicando si la asignación fue exitosa o no.
 */
DELIMITER %%    
CREATE PROCEDURE asignar_integrante_tarea(
    IN p_id_integrante INT,
    IN p_id_tarea INT
)
BEGIN
    DECLARE v_id_equipo INT;
    DECLARE v_id_equipo_integrante INT;
    
    -- equipo al que pertenece la tarea
    SELECT equipo_id_equipo INTO v_id_equipo
    FROM tarea
    WHERE id_tarea = p_id_tarea;
    
    -- equipo al que pertenece el integrante
    SELECT equipo_id_equipo INTO v_id_equipo_integrante
    FROM integrante
    WHERE id_integrante = p_id_integrante;
    
    -- Verificar si el integrante pertenece al equipo de la tarea
    IF v_id_equipo = v_id_equipo_integrante THEN
        -- Asignar la tarea al integrante
        UPDATE 
            tarea
        SET 
            integrante_id_integrante = p_id_integrante,
            tarea_status = 'PENDIENTE'
        WHERE 
            id_tarea = p_id_tarea;
        
        SELECT 'Tarea asignada correctamente' AS mensaje;        
    ELSE
        SELECT 'El integrante no pertenece al equipo de la tarea' AS mensaje;
    END IF;
END
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Obtener el costo total del proyecto
 */
DELIMITER %%
CREATE PROCEDURE costo_total_proyecto()
BEGIN
    SELECT 
        sum(pago_total(
            horas_trabajadas(id_integrante),
            integrante_salario
        )) as "Costo total proyecto"
    FROM integrante;
END
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Obtener el numero de horas trabajadas del integrante
 * @param p_id_integrante 
 */
DELIMITER %%
CREATE FUNCTION horas_trabajadas(p_id_integrante INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total_horas INT;

    SELECT SUM(TIMESTAMPDIFF(hour, control_horario_entrada, control_horario_salida))
    INTO total_horas
    FROM control_horario
    WHERE control_horario_salida IS NOT NULL
    AND id_integrante = p_id_integrante;

    RETURN total_horas;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * salario mas alto en el equipo
 * @param p_id_equipo
 **/
DELIMITER %%
CREATE PROCEDURE salario_mas_alto_equipo(
	IN p_id_equipo INT
)
BEGIN
    SELECT 
		MAX(integrante_salario) 
    FROM integrante
	WHERE equipo_id_equipo = p_id_equipo;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * salario mas bajo en el equipo
 * @param p_id_equipo
 **/
DELIMITER %%
CREATE PROCEDURE salario_mas_bajo_equipo(
	IN p_id_equipo INT
)
BEGIN
    SELECT 
		MIN(integrante_salario) 
    FROM integrante
	WHERE equipo_id_equipo = p_id_equipo;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Calcular el promedio de salario usando la función AVG
 **/
DELIMITER %%
CREATE PROCEDURE calcular_promedio_salario()
BEGIN
    SELECT AVG(integrante_salario) 
    FROM integrante;
END 
%%


/**
 * @autor Hector Miguel Macias Baltazar
 * Calcular pago total (salario * horas)
 * @param horas
 * @param salario
**/
DELIMITER %%
CREATE FUNCTION pago_total(
    horas INT, 
    salario INT
)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE pago INT;
    SET pago = horas*salario;
    RETURN pago;
END 
%%


/**
 * @autor Hector Miguel Macias Baltazar
 * Connvertir segundos a horas
 * @param segundos
**/
DELIMITER %%
CREATE FUNCTION convertir_segundos_horas(
    segundos INT
)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    SET resultado = FLOOR(segundos/3600);
    RETURN resultado;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Marca una tarea como terminada 
 * @param p_id_tarea
 * @param 
 */
DELIMITER %%
CREATE PROCEDURE marcar_tarea_completada(
    IN p_id_tarea INT
)
BEGIN
    -- Actualizar el estado de la tarea a 'completado'
    UPDATE tarea
    SET tarea_status = 'COMPLETADO'
    WHERE id_tarea = p_id_tarea;
END 
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Marca una tarea como terminada 
 * @param p_id_tarea
 * @param 
 */
DELIMITER %%
CREATE PROCEDURE marcar_tarea_cancelada(
    IN p_id_tarea INT
)
BEGIN
    -- Actualizar el estado de la tarea a 'completado'
    UPDATE tarea
    SET tarea_status = 'CANCELADO'
    WHERE id_tarea = p_id_tarea;
END 
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Agregar dias extras a la duracion de una tarea 
 * @param p_integrante_id
 * @param p_duracion_prorroga
 */
DELIMITER %%
CREATE PROCEDURE agregar_prorroga(
	IN p_id_tarea INT,
    IN p_duracion_prorroga INT
)
BEGIN
    DECLARE v_tarea_duracion_actual INT;

    -- Obtener la duración actual de la tarea
    SELECT tarea_duracion 
    INTO v_tarea_duracion_actual
    FROM tarea
    WHERE id_tarea = p_id_tarea;

    -- Actualizar la duración de la tarea
    UPDATE tarea
    SET tarea_duracion = v_tarea_duracion_actual + p_duracion_prorroga
    WHERE id_tarea = p_id_tarea;
END 
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * llamar a este metodo para marcar la entrada o salida de un integrante
 * @param p_integrante_id
 */
DELIMITER %%
CREATE PROCEDURE control_integrante(
    IN p_integrante_id INT
)
BEGIN
    DECLARE v_id_control INT;
    
    -- guardar la utima entrada
	SELECT id_control_horario
    INTO v_id_control 
    FROM control_horario
    WHERE p_integrante_id = id_integrante
    AND control_horario_salida IS NULL;
    
    IF v_id_control IS NULL THEN
		INSERT INTO control_horario(
            id_integrante
        ) 
        VALUES (
            p_integrante_id
        );
        
        SELECT 'creado' AS mensaje;     
    ELSE
		UPDATE control_horario 
        SET 
            control_horario_salida = CURRENT_TIMESTAMP, 
            id_integrante = p_integrante_id
		WHERE id_control_horario = v_id_control;
        
        SELECT 'actualizado' AS mensaje;     
    END IF;
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea un nuevo integrante en el equipo.
 * 
 * @param p_nombre      Nombre del nuevo integrante.
 * @param p_email       Email del nuevo integrante.
 * @param p_salario     Salario del nuevo integrante.
 * @param p_equipo_id   ID del equipo al que pertenece.
 */
DELIMITER %%
CREATE PROCEDURE crear_integrante(
	IN p_nombre VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_salario INT,
    IN p_equipo_id INT
)
BEGIN
	INSERT INTO integrante(
		integrante_nombre,
		integrante_email,
        integrante_salario,
        equipo_id_equipo
    )
	VALUES (
		p_nombre,
		p_email,
        p_salario,
        p_equipo_id
	);
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea un nuevo equipo.
 *
 * @param p_nombre Nombre del nuevo equipo.
 */
DELIMITER %%
CREATE PROCEDURE crear_equipo(
	IN p_nombre VARCHAR(45)
)
BEGIN
	INSERT INTO equipo (
        equipo_nombre, 
        equipo_estatus
    ) 
    VALUES (
        p_nombre, 
        "activo"
    );
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea una nueva tarea.
 *
 * @param p_inicio       Fecha de inicio de la tarea.
 * @param p_nombre       Nombre de la tarea.
 * @param p_descripcion  Descripción de la tarea.
 * @param p_duracion     Duración estimada de la tarea.
 */
DELIMITER %%
CREATE PROCEDURE crear_tarea(
    IN p_inicio DATETIME,
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(255),
    IN p_duracion INT
)
BEGIN
    INSERT INTO tarea (
        tarea_inicio,
        tarea_nombre,
        tarea_descripcion,
        tarea_duracion
    )
    VALUES (
        p_inicio,
        p_nombre,
        p_descripcion,
        p_duracion
	);
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Asigna un equipo a una tarea existente.
 *
 * @param p_id_equipo ID del equipo a asignar.
 * @param p_id_tarea  ID de la tarea a la que se asignará el equipo.
 */
DELIMITER %%
CREATE PROCEDURE asignar_equipo_tarea(
    IN p_id_equipo INT,
    IN p_id_tarea INT
)
BEGIN
    UPDATE tarea
    SET equipo_id_equipo = p_id_equipo
    WHERE id_tarea = p_id_tarea;
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Asigna un integrante a una tarea existente.
 *
 * @param p_id_integrante ID del integrante.
 * @param p_id_tarea      ID de la tarea a la que se asignará.
 * @return Mensaje indicando si la asignación fue exitosa o no.
 */
DELIMITER %%    
CREATE PROCEDURE asignar_integrante_tarea(
    IN p_id_integrante INT,
    IN p_id_tarea INT
)
BEGIN
    DECLARE v_id_equipo INT;
    DECLARE v_id_equipo_integrante INT;
    
    -- equipo al que pertenece la tarea
    SELECT equipo_id_equipo INTO v_id_equipo
    FROM tarea
    WHERE id_tarea = p_id_tarea;
    
    -- equipo al que pertenece el integrante
    SELECT equipo_id_equipo INTO v_id_equipo_integrante
    FROM integrante
    WHERE id_integrante = p_id_integrante;
    
    -- Verificar si el integrante pertenece al equipo de la tarea
    IF v_id_equipo = v_id_equipo_integrante THEN
        -- Asignar la tarea al integrante
        UPDATE 
            tarea
        SET 
            integrante_id_integrante = p_id_integrante,
            tarea_status = 'PENDIENTE'
        WHERE 
            id_tarea = p_id_tarea;
        
        SELECT 'Tarea asignada correctamente' AS mensaje;        
    ELSE
        SELECT 'El integrante no pertenece al equipo de la tarea' AS mensaje;
    END IF;
END
%%

/*
 * reunion natural, muetra las tareas pendientes
 * @autor Luis Eduardo Galindo Amaya
 */
CREATE OR REPLACE VIEW vista_tareas_pendientes AS
SELECT
    id_tarea,
    tarea_inicio,
    tarea_nombre,
    tarea_descripcion,
    tarea_duracion,
    tarea_status,
    integrante_nombre
FROM
    tarea
    INNER JOIN integrante
    ON integrante_id_integrante = id_integrante
WHERE
	tarea_status = 'PENDIENTE';

/*
 * reunion derecha, tareas canceladas
 * @autor Luis Eduardo Galindo Amaya
 */
CREATE OR REPLACE VIEW vista_tareas_canceladas AS
SELECT
    id_tarea,
    tarea_inicio,
    tarea_nombre,
    tarea_descripcion,
    tarea_duracion,
    tarea_status,
    integrante_nombre
FROM
    integrante 
    RIGHT JOIN tarea 
    ON integrante_id_integrante = id_integrante
WHERE 
    tarea_status = 'CANCELADO';
    

/**
 * left join, estados de las tarea
 * @autor Hector Miguel Macias Baltazar
 */
CREATE OR REPLACE VIEW vista_tareas_status AS
SELECT
	*
FROM 
	tarea 
    RIGHT JOIN tarea_completada
    ON id_tarea_completa=id_tarea;

/*
 * reunion completa (union de ambos joins)
 * @autor Hector Miguel Macias Baltazar
 */
CREATE VIEW equipos_tareas_view AS
SELECT
    e.id_equipo,
    e.equipo_nombre,
    t.id_tarea,
    t.tarea_nombre,
    t.tarea_descripcion,
    t.tarea_duracion,
    t.tarea_status
FROM equipo e
	LEFT JOIN tarea t 
    ON e.id_equipo = t.equipo_id_equipo
	
UNION

SELECT
    e.id_equipo,
    e.equipo_nombre,
    t.id_tarea,
    t.tarea_nombre,
    t.tarea_descripcion,
    t.tarea_duracion,
    t.tarea_status
FROM tarea t
	RIGHT JOIN equipo e 
    ON e.id_equipo = t.equipo_id_equipo
ORDER BY id_equipo;