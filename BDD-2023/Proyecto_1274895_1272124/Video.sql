use mydb;

select * from integrante;
select * from tarea;
select * from equipo;
select * from historial_salario;
select * from control_horario;
select * from historial_prorroga;

UPDATE integrante SET integrante_salario = 400 WHERE id_integrante = 1;


call horas_trabajadas(1);


select * from control_horario where id_integrante = 1;

call crear_equipo("Equipo de prueba");
SELECT * FROM equipo;

call costo_total_proyecto();
call salario_mas_alto_equipo(1);
call salario_mas_bajo_equipo(2);
call calcular_promedio_salario();
call marcar_tarea_completada(1);
call marcar_tarea_cancelada(1);
call agregar_prorroga(1, 10);
SELECT * FROM historial_prorroga;
call control_integrante(2);
call crear_integrante("pepe", "pepe@12", 100, 1);
CALL crear_tarea('2023-11-28 09:00:00', 'Tarea de Prueba', 'Descripción de la tarea 1', 1);
call asignar_equipo_tarea(1, 1);
call asignar_integrante_tarea(1, 1);


select * from vista_tareas_pendientes;
select * from vista_tareas_canceladas;
select * from vista_tareas_status;
select * from equipos_tareas_view;