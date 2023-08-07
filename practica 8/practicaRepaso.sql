prompt EJERCICIO 1  
prompt ciclistas que han llevado algun maillot
select distinct c.dorsal
from ciclista c
    join lleva l on (c.dorsal = l.dorsal);
    
prompt ciclistas que han ganado alguna etapa
select distinct c.dorsal
from ciclista c
    join etapa e on (e.dorsal = c.dorsal);
    
prompt ciclistas que han ganado alguna etapa y no han llevado maillot
select distinct c.dorsal
from ciclista c
    join etapa e on (e.dorsal = c.dorsal)
minus
select distinct c.dorsal
from ciclista c
    join lleva l on (c.dorsal = l.dorsal);
    
prompt han coronado algun puerto
select distinct c.dorsal
from ciclista c
    join puerto p on (p.dorsal = c.dorsal);
    
prompt solucion
select distinct c.nombre, c.nomequipo
from ciclista c
    join puerto p on (p.dorsal = c.dorsal)
union
(select distinct c.nombre, c.nomequipo
from ciclista c
    join etapa e on (e.dorsal = c.dorsal)
minus
select distinct c.nombre, c.nomequipo
from ciclista c
    join lleva l on (c.dorsal = l.dorsal));
    
prompt EJERCICIO 2
prompt REPASAR
--ciclistas que han ganado mas de 3 etapas
select dorsal,count(distinct numetapa) etapas
from etapa
group by dorsal
having count(distinct numetapa) > 3;

prompt EJERCICIO 3
select (count(distinct c.nomequipo)/ count(distinct e.nomequipo))
from equipo e, ciclista c
    join etapa e on (e.dorsal = c.dorsal);
    
select dorsal
from etapa
group by dorsal
having count(numetapa) > (select (count(distinct c.nomequipo)/ count(distinct e.nomequipo))
                            from equipo e, ciclista c
                                join etapa e on (e.dorsal = c.dorsal));
                        
prompt EJERCICIO 4
alter table ciclista add (categoria number default 5);

update ciclista
set categoria = categoria - 1
where dorsal in (select distinct dorsal
                from etapa);
                
update ciclista
set categoria = categoria - 1
where dorsal in (select distinct dorsal
                from puerto);       
                
update ciclista
set categoria = categoria - 1
where dorsal in (select distinct dorsal
                from lleva);
                
create table categoria1 as (select *
                            from ciclista
                            where categoria = 1);
                            
prompt EJERCICIO 5  
create sequence etapa_seq
start with 21
increment by 1;

select etapa_seq.nextval
from dual;

insert into etapa values (etapa_seq.nextval, 93, 'Pamplona', 'Pamplona', 69);

select etapa_seq.currval
from dual;

insert into puerto values ('Erro',801,3,4.5,etapa_seq.currval,81);
insert into puerto values ('Mezkiritz',922,4,5.4,etapa_seq.currval,51);

prompt EJERCICIO 6
create or replace view ciclistasMasDeUnMaillot
as (select c.dorsal, c.nombre, c.edad, c.nomequipo
    from ciclista c 
        join lleva l on (l.dorsal = c.dorsal)
    group by c.dorsal, c.nombre, c.edad, c.nomequipo
    having count(distinct l.codigo) > 1);

