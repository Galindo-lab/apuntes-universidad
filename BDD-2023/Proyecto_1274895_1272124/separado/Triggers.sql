use mydb;

/**
 * @autor Luis Eduardo Galindo Amaya
 * agrega el tiempo de prorroga que se agrego a la tarea
 */
DELIMITER %%
DROP TRIGGER IF EXISTS before_update_duracion_tarea %%
CREATE TRIGGER before_update_duracion_tarea
BEFORE UPDATE ON tarea
FOR EACH ROW
BEGIN
    IF NEW.tarea_duracion != OLD.tarea_duracion THEN
        INSERT INTO historial_prorroga (
			tarea_id_tarea,
            historial_prorroga_duracion
		)
        VALUES (
			NEW.id_tarea,
            NEW.tarea_duracion - OLD.tarea_duracion
		);
    END IF;
END 
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Agrega la marca de tiempo de la entrada de un integrante.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_update_tarea;
CREATE TRIGGER after_update_tarea
AFTER UPDATE ON mydb.tarea
FOR EACH ROW
BEGIN
    IF NEW.tarea_status = 'COMPLETADO' THEN
        INSERT INTO tarea_completada (
            tarea_completada_marca, 
            tarea_id_tarea
        )
        VALUES (
            CURRENT_TIMESTAMP(), 
            NEW.id_tarea
        );
    END IF;
END %%

/**
 * @autor Hector Miguel Macias Baltazar
 * aniade un registro a historial_activo si el estado de un integrante
 * cambio.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_update_integrante_activo;
CREATE TRIGGER after_update_integrante_activo
AFTER UPDATE ON integrante
FOR EACH ROW
BEGIN
    IF NEW.integrante_activo != OLD.integrante_activo THEN
        INSERT INTO historial_activo (
            historial_activo_marca,
            historial_activo_anterior,
            historial_activo_siguiente,
            integrante_id_integrante
        ) VALUES (
            CURRENT_TIMESTAMP,
            OLD.integrante_activo,
            NEW.integrante_activo,
            NEW.id_integrante
        );
    END IF;
END;
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Agrega el salario nuevo al historial.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_update_salario %%
CREATE TRIGGER after_update_salario
AFTER UPDATE ON integrante
FOR EACH ROW
BEGIN
    IF NEW.integrante_salario != OLD.integrante_salario THEN
        INSERT INTO historial_salario (
			historial_salario_anterior, 
            historial_salario_siguiente, 
            id_integrante
		)
        VALUES (
			OLD.integrante_salario,
            NEW.integrante_salario,
            NEW.id_integrante
		);
    END IF;
END;
%%


/**
 * @autor Hector Miguel Macias Baltazar
 * Evita que se inserten integrantes con salario negativo.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS before_insert_integrante %%
CREATE TRIGGER before_insert_integrante
BEFORE INSERT
ON integrante FOR EACH ROW
BEGIN
	IF NEW.integrante_salario < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El salario debe ser mayor a 0';
    END IF;
END;
%%



/**
 * @autor Luis Eduardo Galindo Amaya
 * Agrega el salario de un integrante al historial.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_insert_integrante %%
CREATE TRIGGER after_insert_integrante
AFTER INSERT
ON integrante FOR EACH ROW
BEGIN
    INSERT INTO historial_salario (
		historial_salario_anterior,
		historial_salario_siguiente,
		id_integrante
	)
	VALUES (
		0,
        new.integrante_salario,
		new.id_integrante
	);
END 
%%

/*before/after DELETE*/

/**
 * @autor Hector Miguel Macias Baltazar
 * Evita que se eliminen tareas que ya han sido completadas. 
 */
DELIMITER %%
DROP TRIGGER IF EXISTS before_delete_tarea %%
CREATE TRIGGER before_delete_tarea
BEFORE DELETE ON tarea
FOR EACH ROW
BEGIN
    IF OLD.tarea_status = 'COMPLETADO' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar una tarea completada';
    END IF;
END;
%%

/**
 * @autor Hector Miguel Macias Baltazar
 * Elimina las entradas del historial de prorrogas cuando se elimina 
 * su tarea asociada.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_delete_tarea %%
CREATE TRIGGER after_delete_tarea
AFTER DELETE 
ON tarea FOR EACH ROW
BEGIN
    DELETE FROM historial_prorroga
    WHERE tarea_id_tarea = old.id_tarea;
END;
%%

