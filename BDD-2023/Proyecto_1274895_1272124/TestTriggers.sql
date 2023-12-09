use mydb;

/*----------------Prorroga--------------------------------*/
call agregar_prorroga(1, 10);

SELECT historial_prorroga.`id_historial_prorroga`,
    historial_prorroga.`historial_prorroga_duracion`,
    historial_prorroga.`tarea_id_tarea`
FROM mydb.`historial_prorroga`;


/*--------------Control horario---------------------------------*/
CALL control_integrante(1);

SELECT * FROM control_horario;

CALL control_integrante(1);

SELECT * FROM control_horario;



/*--------------actualizar salario-----------------------------------*/
CALL crear_integrante(
    "Integrante Prueba",
    "prueba.prueba@example.com", 
    10, 
    8
);

UPDATE integrante SET integrante_salario = 400 WHERE id_integrante = 1;


SELECT * FROM historial_salario;