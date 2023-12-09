use mydb;

select * from integrante;
select * from tarea;
select * from equipo;
select * from historial_salario;
select * from control_horario;
select * from historial_prorroga;

UPDATE integrante SET integrante_salario = 400 WHERE id_integrante = 1;


call horas_trabajadas(1);
call agregar_prorroga(1, 10);
call control_integrante(2);
call asignar_equipo_tarea(3,2);
call asignar_integrante_tarea(2, 3);
call marcar_tarea_completada(1);
call marcar_tarea_cancelada(1);
-- call equipo_integrante(2);
call crear_integrante("pepe", "pepe@12", 100, 1);
call crear_integrante("jose", "la@12", -1, 1);
CALL crear_tarea('2023-11-28 09:00:00', 'Tarea 1', 'Descripción de la tarea 1', 3);
CALL crear_tarea('2023-11-28 13:00:00', 'Tarea 2', 'Descripción de la tarea 2', 5);
call calcular_promedio_salario();
call salario_mas_bajo_equipo(2);
call salario_mas_alto_equipo(1);
call costo_total_proyecto();

call crear_tarea(
    '2023-11-22 12:00:00',
    'Tarea1',
    'Descripcion de Tarea1',
    5
);

select pago_total(10,4) integrante;

select * from vista_tareas_pendientes;
select * from vista_tareas_canceladas;
select * from vista_tareas_status;
