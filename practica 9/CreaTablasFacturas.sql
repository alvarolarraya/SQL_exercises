prompt **** Creando PROVINCIAS ****

create table  provincias
( codpro    varchar2(2),
  nombre    varchar2(30),
constraint pk_provincias primary key (codpro));


prompt **** Creando PUEBLOS ****

create table  pueblos
( codpue    varchar2(5),
  nombre    varchar2(40),
  codpro    varchar2(2),
constraint pk_pueblos primary key (codpue),
constraint fk_pue_pro foreign key (codpro) references provincias);

prompt **** Creando CLIENTES ****

create table  clientes
( codcli    number(5),
  nombre    varchar2(50) not null,
  direccion varchar2(50) not null,
  codpostal varchar2(5),
  codpue    varchar2(5),
constraint pk_clientes primary key (codcli),
constraint fk_cli_pue foreign key (codpue) references pueblos);

prompt **** Creando ARTICULOS ****

create table  articulos
( codart    varchar2(8),
  descrip   varchar2(40),
  precio    number(6,1) not null,
  stock     number(6),
  stock_min number(6) default '2',
constraint pk_articulos primary key (codart)
);

prompt **** Creando CABECERAS DE FACTURA ****

create table  facturas
( codfac    number(6),
  fecha     date,
  codcli    number(5),
  iva       number(2) not null,
  dto       number(2),
constraint pk_facturas primary key (codfac),
constraint fk_fac_cli foreign key (codcli) references clientes,
constraint ch_iva check (iva in(0,4,7,16)));

prompt **** Creando LINEAS DE FACTURA ****

create table  lineas_fac
( codfac    number(6),
  linea     number(2),
  cant      number(5) not null,
  codart    varchar2(8),
  precio    number(6,1) not null,
  dto       number(2),
constraint pk_lineas_fac primary key (codfac,linea),
constraint fk_lin_fac foreign key (codfac) references facturas,
constraint fk_lin_art foreign key (codart) references articulos);