-- Inserciones para la tabla `equipo`
INSERT INTO `mydb`.`equipo` (`equipo_nombre`, `equipo_estatus`) VALUES ('Equipo1', 'activo');

-- Inserciones para la tabla `integrante`
INSERT INTO `mydb`.`integrante` (`integrante_nombre`, `integrante_email`, `equipo_id_equipo`) VALUES ('Juan Pérez', 'juan@example.com', 1);
INSERT INTO `mydb`.`integrante` (`integrante_nombre`, `integrante_email`, `equipo_id_equipo`) VALUES ('María Rodríguez', 'maria@example.com', 1);

-- Inserciones para la tabla `tarea`
INSERT INTO `mydb`.`tarea` (`tarea_inicio`, `tarea_nombre`, `tarea_descripcion`, `tarea_duracion`, `tarea_status`, `integrante_id_integrante`, `equipo_id_equipo`) VALUES ('2023-11-22 12:00:00', 'Tarea1', 'Descripción de Tarea1', 5, 'pendiente', integrante_id_integrante, equipo_id_equipo);

/*
-- Inserciones para la tabla `historial_salario`
INSERT INTO `mydb`.`historial_salario` (`historial_salario_anterior`, `historial_salario_siguiente`, `id_integrante`) VALUES (50000, 55000, id_integrante);

-- Inserciones para la tabla `control_horario`
INSERT INTO `mydb`.`control_horario` (`control_horario_salida`, `id_integrante`) VALUES (NULL, id_integrante);

-- Inserciones para la tabla `historial_activo`
INSERT INTO `mydb`.`historial_activo` (`historial_activo_anterior`, `historial_activo_siguiente`, `id_integrante`) VALUES (1, 0, id_integrante);

-- Inserciones para la tabla `historal_prorroga`
INSERT INTO `mydb`.`historal_prorroga` (`historal_prorroga_duracion`, `tarea_id_tarea`) VALUES (2, tarea_id_tarea);

-- Inserciones para la tabla `tarea_completada`
INSERT INTO `mydb`.`tarea_completada` (`tarea_id_tarea`) VALUES (tarea_id_tarea);
*/