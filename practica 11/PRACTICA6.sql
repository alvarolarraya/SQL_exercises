prompt ________________________
prompt EJERCICIO2
CREATE SYNONYM aux_equipo FOR ciclismo.aux_equipo;
CREATE SYNONYM aux_CICLISTA FOR ciclismo.aux_CICLISTA;
CREATE SYNONYM aux_ETAPA FOR ciclismo.aux_ETAPA;
CREATE SYNONYM aux_PUERTO FOR ciclismo.aux_PUERTO;
CREATE SYNONYM aux_MAILLOT FOR ciclismo.aux_MAILLOT;
CREATE SYNONYM aux_LLEVA FOR ciclismo.aux_LLEVA; 
                      
prompt ________________________
prompt EJERCICIO3
CREATE SEQUENCE dorsales_seq 
START WITH 50 
INCREMENT BY -2 
MINVALUE 0 
MAXVALUE 50 
NOCYCLE;

CREATE SEQUENCE etapas_seq 
START WITH 100 
INCREMENT BY 100 
MINVALUE 100 
MAXVALUE 10000 
NOCYCLE;

prompt ________________________
prompt EJERCICIO4
drop sequence dorsales_seq;
drop sequence etapas_seq;

CREATE SEQUENCE dorsales_seq 
START WITH 1 
INCREMENT BY 1 
NOCYCLE;

CREATE SEQUENCE etapas_seq 
START WITH 1 
INCREMENT BY 1 
NOCYCLE;

prompt INSERTANDO EQUIPOS
INSERT INTO equipo (select *
                   from aux_equipo);                                   
prompt INSERTANDO CICLISTA
INSERT INTO ciclista SELECT dorsales_seq.NEXTVAL dorsal, NOMBRE, EDAD, NOMEQUIPO 
                     FROM aux_ciclista;                
prompt INSERTANDO ETAPA
INSERT INTO ETAPA SELECT etapas_seq.NEXTVAL numetapa, kms, salida, llegada, dorsal 
                  FROM aux_etapa;                  
prompt INSERTANDO PUERTO
INSERT INTO PUERTO (select *
                      from aux_PUERTO);                        
prompt INSERTANDO MAILLOT
INSERT INTO MAILLOT (select *
                      from aux_MAILLOT);              
prompt INSERTANDO LLEVA
INSERT INTO LLEVA (select *
                      from aux_LLEVA);  

prompt ________________________
prompt EJERCICIO5
create or replace view vista_equipos
as (select *
    from equipo
    where nomequipo like '%a%');
    
select *
from vista_equipos;

prompt ________________________
prompt EJERCICIO6
alter table equipo add (presupuesto number default 5000000);
alter table equipo add (patrocinador varchar2(100) default 'Leia Organa');

prompt ________________________
prompt EJERCICIO7
select *
from vista_equipos;
--NO SE HAN ANADIDO LAS DOS COLUMNAS NUEVAS A LA VISTA

create or replace view vista_equipos
as (select *
    from equipo
    where nomequipo like '%a%' or nomequipo like '%A%');
    
select *
from vista_equipos;
--AHORA SI SALEN LAS DOS NUEVAS COLUMNAS
--LA VISTA NO LE IMPORTA QUE SE ANADEN FILAS, PERO SI COLUMNAS

prompt ________________________
prompt EJERCICIO8
create or replace view todoterrenos
as (select dorsal, count(distinct codigo) maillots
    from lleva
    group by dorsal 
    having count(distinct codigo) >= all (select count(distinct codigo)
                                        from lleva
                                        group by dorsal));

prompt ________________________
prompt EJERCICIO9
alter table equipo drop (presupuesto);
alter table equipo drop (patrocinador);

select *
from vista_equipos;
--la vista da error porque no se han actualizado las columnas

prompt ________________________
prompt EJERCICIO10
select avg(distinct c.edad)
from ciclista c join (select distinct dorsal
                        from etapa) dorsales on (c.dorsal = dorsales.dorsal);
                        
prompt ________________________
prompt EJERCICIO11
select e.llegada, e.salida
from etapa e
    join puerto p on (e.numetapa = p.numetapa)
where pendiente = (select max(pendiente)
                    from puerto);
                    
prompt ________________________
prompt EJERCICIO12
select e.*
from etapa e join (select numetapa
                    from puerto
                    where categoria = 'E' or categoria = '1'
                    group by numetapa
                    having count(categoria) > 1) puertos on (puertos.numetapa = e.numetapa)



