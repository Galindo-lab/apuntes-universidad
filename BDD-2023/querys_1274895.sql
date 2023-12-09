use ControlEscolar;

/************
Calentamiento
*************

-- Alter table Requisitos add Observacion varchar(30);
-- Alter table Requisitos modify Observacion varchar(50);
-- alter table Requisitos change Observacion Comentarios varchar(50);
-- alter table Requisitos drop Comentarios;
-- alter table Seccion change Profesor NumeroProfesor int;

create table if not exists Profesor(
	NumeroProfesor int not null auto_increment,
    NombreProfesor varchar(50),
    primary key (NumeroProfesor));
    
alter TABLE Seccion ADD Constraint FK_SeccionProfesor_NumeroProfesor 
	Foreign Key (NumeroProfesor)
	References Profesor(NumeroProfesor)
	ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Seccion DROP Foreign Key FK_SeccionProfesor_NumeroProfesor;
*/

insert into Curso (NombreCurso,HorasCreditos,Departamento)
values("Historia", 10, "Economía"),
      ("Psi. Geral", 10, "Psicología"),
      ("Psi. Desar", 10, "Psicología"),
      ("Psi. Clíni", 10, "Psicología"),
	  ("Contabilid",5,"Administración"),
      ("Emprendimi",6,"Administración"),
	  ("Psi. Empre", 10, "Psicología"),
      ("Psi. Cogni", 10, "Psicología"),
	  ("Psi. Indus", 10, "Psicología"),
      ("Psi. Foren", 10, "Psicología");

-- select * from Curso;
-- delete from Curso where 1=1;


insert into Profesor(NombreProfesor)
values("Bernardo"),
	("Emiliano"),
    ("Ignacio"),
    ("Lorenzo"),
    ("Dalia"),
    ("Marina"),
    ("Laura"),
    ("Alonso"),
    ("Astrid"),
    ("Carlos");
    
select * from Profesor;

insert into Seccion(NumCurso,Semestre,Anio,NumeroProfesor,NumEstudiante,Notas)
values(1,1,2018,1,"123456",9),
	  (4,3,2020,1,"123456",9),
	  (4,1,2018,1,"994864",9),
      (3,3,2019,2,"456789",4),
      (4,3,2019,2,"456789",4),
      (2,3,2019,1,"123456",9),
	  (5,5,2022,1,"123456",4),
	  (5,3,2023,1,"994864",5),
      (4,7,2013,2,"456789",6),
      (5,9,2014,2,"456789",4);
      
-- select * from Seccion;

insert into InformeNotas(NumEstudiante,IdentSeccion,Notas)
values("123456",1,1),
	  ("789123",2,2),
	  ("456789",3,3),
      ("991028",4,4),
	  ("992400",5,5),
      ("996248",6,6),
      ("996424",7,7),
      ("988941",8,8),
      ("983117",9,9),
      ("994864",10,10);
      
select * from InformeNotas;

INSERT INTO Estudiante (NumEstudiante,Nombre,Grado,Carrera)
VALUES("123456","Blanca",7,"Psicología"),
      ("789123","Héctor",9,"Economía"),
      ("456789","Blas",10,"Administración"),
      ("991028","Martin",7,"Psicología"),
      ("992400","Arely",8,"Economía"),
      ("996248","Jazmin",3,"Administración"),
      ("996424","Edgar",8,"Psicología"),
      ("988941","Raul",9,"Administración"),
      ("983117","Arely",6,"Economía"),
      ("994864","Damaris",7,"Administración");
      

Alter table Estudiante add Estatus ENUM ("A","B","EG");
UPDATE Estudiante SET Estatus="A";
select * from Estudiante;
-- delete from Estudiante where 1=1;


UPDATE Estudiante SET Estatus='B' WHERE NumEstudiante="988941";
UPDATE Estudiante SET Estatus='B' WHERE NumEstudiante="789123";
UPDATE Estudiante SET Estatus='B' WHERE NumEstudiante="991028";
UPDATE Estudiante SET Estatus='B' WHERE NumEstudiante="994864";
UPDATE Estudiante SET Estatus='B' WHERE NumEstudiante="983117";

select * from Estudiante;

select * from Profesor;
delete from Profesor where NumeroProfesor=4;
select * from Profesor;

