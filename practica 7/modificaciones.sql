rem ejer 1
alter table dependiente add(constraint parentesco_dentro_valores check (parentesco in ('CONYUGE','DESCENDIENTE','ASCENDIENTE')));

rem ejer 2 y 3
alter table dependiente modify constraint fk_dependiente_empleado disable;

update dependiente
set cod_emp = '0013'
where cod_emp = (select cod_emp from empleado where nombre = 'PEDRO' and apellido = 'PEREZ');

alter table trabaja modify constraint FK_TRABAJA_EMPLEADO disable;

update trabaja
set cod_emp = '0013'
where cod_emp = (select cod_emp from empleado where nombre = 'PEDRO' and apellido = 'PEREZ');

alter table departamento modify constraint FK_DEPARTAMENTO_EMPLEADO disable;

update departamento
set jefe = '0013'
where jefe = (select cod_emp from empleado where nombre = 'PEDRO' and apellido = 'PEREZ');

update empleado
set cod_emp = '0013'
where nombre = 'PEDRO' AND APELLIDO = 'PEREZ';

alter table trabaja modify constraint FK_TRABAJA_EMPLEADO enable;

alter table departamento modify constraint FK_DEPARTAMENTO_EMPLEADO enable;

alter table dependiente modify constraint fk_dependiente_empleado enable;

rem ejer 4
rem he eliminado las tablas y añadido un on delete cascade y set null, pero se podria hacer mejor un drop de las constraint y un add
delete from empleado where cod_emp = '1001';

rem ejer 5
alter table localizaciones rename to espacios;

rem ejer 6
alter table empleado modify constraint fk_empleado_departamento disable;
alter table departamento modify constraint FK_DEPARTAMENTO_EMPLEADO disable;
insert into departamento (cod_dep,jefe) values ('013','0013');
update empleado
set cod_dep = '013'
where cod_emp = '0013';
alter table empleado modify constraint fk_empleado_departamento enable;
alter table departamento modify constraint FK_DEPARTAMENTO_EMPLEADO enable;

rem ejer 7
update departamento
set fecha_jefe = sysdate
where fecha_jefe is null;
alter table departamento modify (fecha_jefe not null);

rem ejer 8
rem añado parentesco a la primary key para que se cumpla el principio de unicidad
alter table dependiente drop constraint pk_dependiente;
alter table dependiente add (constraint pk_dependiente primary key (nombre,cod_emp,parentesco));

rem ejer 9
rem repasar esto

rem ejer 10
alter table departamento add (num_emp number default 0);

update departamento
set num_emp = 
            (select count(e.cod_emp) numero_empleados
            from empleado e 
            where e.cod_dep = departamento.cod_dep group by departamento.cod_dep)
            
rem ejer 11
alter table dependiente drop constraint PARENTESCO_DENTRO_VALORES;

update dependiente
set parentesco = 'C'
where parentesco = 'CONYUGE';

update dependiente
set parentesco = 'D'
where parentesco = 'DESCENDIENTE';

update dependiente
set parentesco = 'A'
where parentesco = 'ASCENDIENTE';

alter table dependiente add (constraint parentesco_dentro_valores check (parentesco in ('A','D','C')));

rem ejer 12
update empleado
set salario = salario * 1.15
where cod_emp =
            (select jefe
            from departamento d
            where d.num_emp>2 and empleado.cod_emp = d.jefe);