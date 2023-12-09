create database if not exists Practica3;

use Practica3;

create table if not exists clientes(
	codcli int primary key not null,
    nombre varchar(25) not null,
    direccion varchar(26),
    codpostal int,
    codpue int
);

create table if not exists pueblos(
	codpue int primary key not null,
    nombre varchar(25),
    codpro tinyint
);

/* restriccion de integridad referecial
alter table clientes 
add constraint fk_codpue_clientes_pueblos
foreign key (codpue)
references pueblos(codpue);
 */

/*insert into pueblos 
values(7766, 'Burriana',12),
      (12309, 'Castellón', 12),
	  (17859, 'Enramona', 12),
	  (46332, 'Soneja', 12),
	  (53596, 'Vila-real', 12);


insert into clientes
values 
(333,'Sos Carretero, Jesús', 'Monsen Compte, 14', 12964, 53596),
(336,'Miguel Archilés, Ramón', 'Bernardo Mundina, 132-5', 12652, 7766),
(342,'Pinel Huerta, Vicente', 'Fransisco Sempere, 37-10', 12112, 7766),
(345,'López Botella, Mauro', 'Avenida del Puerto, 20-1', 12010, 12309),
(348,'Palau Martínez, Jorge', 'Raval de Sant Josep, 97-2', 12003, 12309),
(354,'Murría Vinaiza, José', 'Ciudadela, 90-18', 12003, 12309),
(357,'Huget Peris, Juan Ángel', 'Calle Mestre Rodrigo, 7', 12100, 12309);
*/

create temporary table if not exists temp1 as
select codcli, nombre
from clientes;

create temporary table if not exists temp2 as
select codpue, nombre
from pueblos;

create temporary table if not exists temp3 as
select * 
from temp1
union
select *
from temp2;


drop table temp1;
drop table temp2;
drop table temp3;

create temporary table if not exists temp1 as
select codpue 
from clientes;

create temporary table if not exists temp2 as 
select codpue
from pueblos;

create temporary table if not exists temp3 as 
select *
from temp1
where codpue in (select * from temp2);

select distinct * from temp3;

drop table temp1;
drop table temp2;
drop table temp3;


/* inciso 1.2 */
create temporary table if not exists temp1 as
select codpue
from pueblos;

create temporary table if not exists temp2 as
select codpue 
from clientes;

/* inciso 1.3 */
create temporary table if not exists temp3 as 
select * 
from temp1 
where codpue not in (select * from temp2);

select * from temp3;

drop table temp1;
drop table temp2;
drop table temp3;


/*Ahora relizamos el inciso 1.4 de la practica #3*/
create temporary table if not exists temp1 as 
select codpue from clientes;

create temporary table if not exists temp2 as 
select temp1.codpue, pueblos.codpue as codpueblos, nombre, codpro
from temp1 cross join pueblos;

select * from temp2;

create temporary table if not exists temp3 as
select * 
from temp2 
where codpue=codpueblos;

select nombre from temp3;


drop table temp1;
drop table temp2;
drop table temp3;
