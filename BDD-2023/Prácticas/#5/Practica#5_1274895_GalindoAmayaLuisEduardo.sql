-- Ejercicio #5. Crea las TABLAS y sus RESTRICCIONES de INTEGRIDAD y RELACIÓN

-- Con base al Diagrama del ESQUEMA de “Control Escolar”, construye las TABLAS que faltan,
-- identifica qué campos son LLAVE PRIMARIA y/o FORÁNEA, y establece susRESTRICCIONES.

CREATE DATABASE IF NOT EXISTS ControlEscolar;

Use ControlEscolar;

CREATE TABLE IF NOT EXISTS Estudiante (
    NumEstudiante varchar(10) NOT NULL,
    Nombre varchar(25),
    Grado int,
    Carrera varchar(25),
    PRIMARY KEY (NumEstudiante)
);

CREATE TABLE IF NOT EXISTS Curso (
    NumCurso int NOT NULL AUTO_INCREMENT,
    NombreCurso varchar(10),
    HorasCreditos double,
    Departamento varchar(25),
    PRIMARY KEY (NumCurso)
);

CREATE TABLE IF NOT EXISTS Requisitos (
    NumCurso int NOT NULL,
    NumRequisito int NOT NULL,
    PRIMARY KEY (NumCurso, NumRequisito),
    CONSTRAINT FK_Requisito_NumCurso 
    FOREIGN KEY (NumCurso) 
    REFERENCES Curso (NumCurso) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);


create table if not exists Seccion(
	IdentSeccion int not null auto_increment,
    NumCurso int,
    Semestre int,
    Anio int,
    Profesor varchar(30),
    NumEstudiante varchar(10),
    Notas float,
    PRIMARY KEY (IdentSeccion)
);

create table if not exists InformeNotas(
	NumEstudiante varchar(10) NOT NULL,
    IdentSeccion int not null,
    Notas float,
    PRIMARY KEY (NumEstudiante, IdentSeccion),
    FOREIGN KEY (NumEstudiante) 
    REFERENCES Estudiante (NumEstudiante) 
);

-- Deberán subir su script con extensión sql, el cual contenga las instrucciones completas y correctas delo solicitado en este ejercicio.
-- La entrega de esta actividad contará como tu ASISTENCIA a la clase de HOY martes 10 de octubredel 2023, deberás entregarlo a más tardar hoy a las 18:00.
