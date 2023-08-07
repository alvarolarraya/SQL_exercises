create table departamento
(
    cod_dep varchar2(100),
    nom_dep varchar2(100) unique,
    jefe varchar2(100),
    fecha_jefe date,
    constraint pk_departamento primary key (cod_dep)
);
create table empleado
(
    cod_emp varchar2(100),
    supervisor varchar2(100),
    nombre varchar2(100),
    apellido varchar2(100),
    fecha_ncto date,
    genero varchar2(100),
    salario number,
    cod_dep varchar2(100),
    constraint pk_empleado primary key (cod_emp),
    constraint fk_empleado_departamento foreign key (cod_dep) references departamento (cod_dep),
    constraint genero_v_m check (genero in ('V','M'))
);
create table dependiente
(
    nombre varchar2(100),
    cod_emp varchar2(100),
    fecha_ncto date,
    parentesco varchar2(100),
    genero varchar2(100),
    constraint pk_dependiente primary key (nombre,cod_emp),
    constraint fk_dependiente_empleado foreign key (cod_emp) references empleado (cod_emp) on delete cascade
);
create table proyecto
(
    num_proy number,
    nom_proy varchar2(100) unique,
    cod_dep varchar2(100),
    localiza varchar2(100),
    constraint pk_proyecto primary key (num_proy),
    constraint fk_proyecto_departamento foreign key (cod_dep) references departamento (cod_dep)
);
create table trabaja
(
    cod_emp varchar2(100),
    num_proy number,
    horas number,
    constraint pk_trabaja primary key (num_proy,cod_emp),
    constraint fk_trabaja_empleado foreign key (cod_emp) references empleado (cod_emp) on delete cascade,
    constraint fk_trabaja_proyecto foreign key (num_proy) references proyecto (num_proy)
);
create table localizaciones
(
    cod_dep varchar2(100),
    localiza varchar2(100),
    constraint pk_localizaciones primary key (cod_dep,localiza),
    constraint fk_localizaciones_departamento foreign key (cod_dep) references departamento (cod_dep)
);

alter table departamento add (constraint fk_departamento_empleado foreign key (jefe) references empleado (cod_emp) on delete set null);