prompt ____________
prompt EJERCICIO 2
create table historicos
(
    dorsal NUMBER(38,0),
    nombre VARCHAR2(35 BYTE),
    NOMEQUIPO VARCHAR2(20 BYTE),
    fecha date
)

CREATE OR REPLACE TRIGGER bajas
AFTER DELETE ON ciclista 
FOR EACH ROW 
BEGIN 
    INSERT INTO historicos
    VALUES(:old.dorsal,:old.nombre,:old.nomequipo,SYSDATE);
END;
/

prompt ____________
prompt EJERCICIO 3
delete from ciclista where edad >= 30;

select *
from historicos;

prompt ____________
prompt EJERCICIO 4
CREATE OR REPLACE TRIGGER borraEquipo
AFTER DELETE ON equipo 
FOR EACH ROW 
BEGIN 
    update ciclista set nomequipo = 'SIN EQUIPO' where :old.nomequipo = ciclista.nomequipo;
END;
/

prompt ____________
prompt EJERCICIO 5 
--no se puede hacer el update porque es una tabla mutante
alter table ciclista drop constraint FK_CICL_EQUIPO;
alter table ciclista add (constraint FK_CICL_EQUIPO foreign key (nomequipo) references equipo (nomequipo));
insert into equipo values ('SIN EQUIPO', 'Pepe');

delete from equipo where nomequipo = 'TVM';

prompt ____________
prompt EJERCICIO 6
CREATE OR REPLACE TRIGGER actualizaEquipo
AFTER update ON equipo 
FOR EACH ROW 
BEGIN 
    update ciclista set nomequipo = :new.nomequipo where :old.nomequipo = ciclista.nomequipo;
END;
/

prompt ____________
prompt EJERCICIO 7
update equipo
set nomequipo = 'loquesea'
where nomequipo = 'SIN EQUIPO';

select *
from equipo;

prompt ____________
prompt EJERCICIO 8
--da problema de foreign key porque no existe un equipo 'sin equipo'
insert into equipo values ('SIN EQUIPO', 'Pepe');
delete from equipo where nomequipo = 'Kelme';