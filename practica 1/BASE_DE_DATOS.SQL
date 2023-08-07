REM Crea la tabla departamentos
create table departamentos 
  (
    codigo char(3) not null,
    nombre varchar(40) not null,
    constraint PK_DEP primary key(codigo)	
  );
REM Crea la tabla areas 
create table areas 
  (
    codigo char(3) not null,
    nombre varchar(55) not null,
    departamento char(3) not null,
    constraint PK_AREAS primary key(codigo),
    constraint FK_AREAS foreign key(departamento) references departamentos(codigo)
   on delete cascade	
  );

REM Crea la tabla profesores 
create table profesores 
  (
    codigo smallint not null,
    apellido1 varchar(25) not null,
    apellido2 varchar(25) not null,
    nombre_pila varchar(20) not null,
    activo char(1) not null,
    categoria char(4) not null,
    dedicacion char(3) not null,
    area char(3) not null,
    constraint PK_PROF primary key(codigo),
     constraint FK_PROF foreign key(area) references areas(codigo)
	on delete cascade	
  );



REM Crea la tabla asignaturas 
create table asignaturas 
  (
    siglas char(6) not null,
    nombre varchar(40) not null,
    creditos smallint,
    curso smallint,
    anualidad char(1),
    clase char(1),
    horas_teoria decimal(3,1),
    horas_practica decimal(3,1),
    grupos_teoria smallint,
    grupos_practica smallint,
    alumnos integer,
    constraint PK_ASIG primary key(siglas)
  );

REM Crea la tabla locales 
create table locales 
  (
    codigo char(5) not null,
    nombre varchar(40) not null,
    docente char(1),
    capacidad integer,
    edificio varchar(10),
    situacion varchar(40),
    constraint PK_LOCAL primary key (codigo)
  );

REM Crea la tabla grupos 
create table grupos 
  (
    curso char(1) not null,
    clase char(1) not null,
    codigo char(3) not null,
    nombre varchar(30),
    constraint PK_GRUPOS primary key (curso,clase,codigo)
   );

REM Crea la tabla docencia 
create table docencia 
  (
    id number(3) not null,
    curso char(1) not null,
    clase char(1) not null,
    grupo char(3) not null,
    siglas char(6) not null,
    profesor smallint not null,
    local char(5) not null,
    dia char(1),
    hora decimal(4,1),
    periodicidad smallint,
    constraint PK_DOCENCIA primary key (id),
     constraint FK_DOCENCIAGR foreign key (curso,clase,grupo) references  grupos(curso,clase,codigo)
	on delete cascade ,
    constraint FK_DOCENCIAPROF foreign key(profesor) references profesores(codigo)
	on delete cascade ,
    constraint FK_DOCENCIALOCAL foreign key(local) references locales(codigo)
	on delete cascade ,
    constraint FK_DOCENCIAASIG foreign key(siglas) references asignaturas(siglas)
	on delete cascade 	
  );

REM FINALIZADO PROCESO DE CREACIÓN
REM PROCESO DE INSERCIÓN
REM INSERTANDO EN DEPARTAMENTOS

INSERT INTO DEPARTAMENTOS VALUES ('DER','Ciencia Jurídica');
INSERT INTO DEPARTAMENTOS VALUES ('Eco','Economía y Empresa');
INSERT INTO DEPARTAMENTOS VALUES ('ELE','Ingeniería Eléctrica y Electrónica');
INSERT INTO DEPARTAMENTOS VALUES ('FIL','FIlología Moderna');
INSERT INTO DEPARTAMENTOS VALUES ('FIS','Física Aplicada');
INSERT INTO DEPARTAMENTOS VALUES ('INF','Informática');
INSERT INTO DEPARTAMENTOS VALUES ('MAT','Matemáticas');

REM INSERTANDO EN AREAS
insert into areas values ('ATC','Arquitectura y Tecnología de Computadores','INF');
insert into areas values('CIA','Ciencia de la Computación e Inteligencia Artificial','INF');
insert into areas values('DER','Derecho Administrativo','DER');
insert into areas values('EIO','Estadística e Investigación Operativa','INF');
insert into areas values('ELE','Tecnología Electrónica','ELE');
insert into areas values('FIL','Filología Inglesa','FIL');
insert into areas values('FIS','Física Aplicada','FIS');
insert into areas values('LSI','Lenguajes y Sistemas Inform ticos','INF');
insert into areas values('MAT','Matem tica Aplicada','MAT');
insert into areas values('OEM','Organización de Empresas','Eco');

REM INSERTANDO EN PROFESORES
INSERT INTO PROFESORES VALUES (1,'Adan','Oliver','Antonio',1,'TEU','TC','ATC');
INSERT INTO PROFESORES VALUES (2,'Antequera','Giner','Jose Antonio',0,'AsN1','6 h','OEM');
INSERT INTO PROFESORES VALUES (3,'Avilero','Nieto','Concepción',1,'TEU','TC','FIL');
INSERT INTO PROFESORES VALUES (4,'Benito','Santos','Serafin',1,'TEU','TC','ATC');
INSERT INTO PROFESORES VALUES (5,'Calero','Munoz','Coral',1,'AEU','TC','LSI');
INSERT INTO PROFESORES VALUES (6,'Ca¤adas','Garcia','Andres',1,'AsN1','6 h','OEM');
INSERT INTO PROFESORES VALUES (7,'Carrero','Rodriguez','Victar',1,'TEU','TC','FIL');
INSERT INTO PROFESORES VALUES (8,'Castillo','Herrera','Ester del',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (9,'Genero','Bocco','Marcela',0,'As','TC','LSI');
INSERT INTO PROFESORES VALUES (10,'Domínguez','Parra','Eduardo',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (11,'Fern ndez','Guerrero','Mercedes',1,'TEU','TC','MAT');
INSERT INTO PROFESORES VALUES (12,'Flores','Gómez','Jos‚',1,'TU','TC','FIS');
INSERT INTO PROFESORES VALUES (13,'Fernánez','Valdivia','Manuel',1,'TEU','TC','MAT');
INSERT INTO PROFESORES VALUES (14,'Giralt','Muiña','Juan',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (15,'Gómez','Aparicio','Juan Miguel',1,'AsN1','6 h','OEM');
INSERT INTO PROFESORES VALUES (16,'Guerrero','Amado','Isabel',1,'AsN1','6 h','LSI');
INSERT INTO PROFESORES VALUES (17,'Jim‚nez','Linares','Luis',1,'TEU','TC','CIA');
INSERT INTO PROFESORES VALUES (18,'Julian','Iranzo','Pascual',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (19,'Lacave','Rodero','Carmen',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (20,'López','Villaverde','Luis Alberto',1,'AsN1','6 h','FIS');
INSERT INTO PROFESORES VALUES (21,'Martinez','Hernandez','Antonio',1,'AsN1','6 h','ATC');
INSERT INTO PROFESORES VALUES (23,'Moraga','Alcazar','Jose Luis',1,'AsN1','6 h','LSI');
INSERT INTO PROFESORES VALUES (24,'Moreno','Valencia','Carmen',1,'TEU','TC','MAT');
INSERT INTO PROFESORES VALUES (25,'Mu¤oz','Caro','Camelia',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (26,'Ni¤o','Ramos','Alfonso',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (27,'Ortega','Cantero','Manuel',1,'TEU','TC','CIA');
INSERT INTO PROFESORES VALUES (28,'Ortega','Triguero','Jesus',1,'CEU','TC','MAT');
INSERT INTO PROFESORES VALUES (29,'Perea','Membibre','Francisca',1,'AsN1','6 h','EIO');
INSERT INTO PROFESORES VALUES (30,'P‚rez','Bencecrí','Cristobal',1,'TEU','TC','MAT');
INSERT INTO PROFESORES VALUES (31,'Polo','Usaola','Macario',1,'AF','TC','LSI');
INSERT INTO PROFESORES VALUES (32,'Rincón','Codes','Jose Joaquin',1,'AEU','TC','LSI');
INSERT INTO PROFESORES VALUES (33,'Rozas','Quintanilla','Juan Pablo',1,'TEU','TC','ATC');
INSERT INTO PROFESORES VALUES (34,'Ruiz','de la Calle','Teresa',0,'AsN1','6 h','LSI');
INSERT INTO PROFESORES VALUES (35,'Ruiz','Fern ndez','Julian',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (36,'Ruiz','Gonz lez','Francisco',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (37,'Sanz','Alcolea','Jorge',1,'TEU','TC','ELE');
INSERT INTO PROFESORES VALUES (38,'Soto','Vicente','Fernando',1,'AsN1','6 h','ATC');
INSERT INTO PROFESORES VALUES (39,'Ter n','Sierra','Fernando',1,'TEU','TC','FIS');
INSERT INTO PROFESORES VALUES (40,'Villarrubia','Jiménez','Carlos',1,'TEU','TC','LSI');
INSERT INTO PROFESORES VALUES (41,'Viñuela','Conejo','Urbano',1,'TEU','TC','FIS');
INSERT INTO PROFESORES VALUES (42,'Sanchez','Ciudad','Inocente',1,'TEU','TC','ATC');
INSERT INTO PROFESORES VALUES (43,'Holgado','Torquemada','Jose Manuel',1,'AsN1','3 h','ATC');
INSERT INTO PROFESORES VALUES (44,'Bravo','Rodríguez','Jos‚',1,'AsN1','TC','LSI');
INSERT INTO PROFESORES VALUES (45,'Vizcaino','Barcelo','Aurora',0,'AEU','TC','LSI');
INSERT INTO PROFESORES VALUES (46,'Montoli','Moratalla','Román',0,'TEUi','TC','ATC');
INSERT INTO PROFESORES VALUES (47,'Gavira','Tom s','Ignacio',0,'AsN1','6 h','DER');
INSERT INTO PROFESORES VALUES (48,'Gómez','Cantos','Brígida',1,'AsN1','TC','OEM');
INSERT INTO PROFESORES VALUES (49,'Gallud','L zaro','Jose Antonio',0,'AsN1','3 h','LSI');
INSERT INTO PROFESORES VALUES (50,'Gallego','Caro','Jose María',1,'AsN1','6 h','LSI');
INSERT INTO PROFESORES VALUES (51,'Rodriguez','Moreno','Maria Arantzazu',1,'AsN1','6 h','LSI');
INSERT INTO PROFESORES VALUES (52,'Moya','Gargantiel','Jesus de Moya',1,'AsN1','3 h','LSI');
INSERT INTO PROFESORES VALUES (53,'Mateo','Fraile','Jorge',1,'TEU','3 h','LSI');
INSERT INTO PROFESORES VALUES (54,'Pérez','Moreno','Ramón',1,'TEUi','TC','ATC');

REM INSERTANDO EN ASIGNATURAS

INSERT INTO ASIGNATURAS VALUES ('TCo-G','Tecnologia de Computadores Gestion)',6,1, '1','T',2.0,0.0,2,0,160);

INSERT INTO ASIGNATURAS VALUES ('CEm','Contabilidad Empresarial',9,1,'A','T',3.0,0.0,2,0,183);

INSERT INTO ASIGNATURAS VALUES ('Fis-G','Fisica (Gestion)',6,1,'1','O',2.0,0.0,2,0,191);

INSERT INTO ASIGNATURAS VALUES ('IGe','Informatica de Gestion',12,2,'A','T',3.0,1.0,2,4,128);

INSERT INTO ASIGNATURAS VALUES ('EEm','Economia de la Empresa',9,2,'A','T',3.0,0.0,2,0,182);

INSERT INTO ASIGNATURAS VALUES ('AGE','Administracion y Gestion de Empresas',9,3,'A','T',2.0,1.0,1,3,108);

INSERT INTO ASIGNATURAS VALUES ('DIE','Derecho Informatico y Empresarial',9,2,'A','P',3.0,0.0,1,0,63);

INSERT INTO ASIGNATURAS VALUES ('TCo-S','Tecnologia de Computadores (Sistemas)',9,1,'1','T',2.0,1.0,2,5,142);

INSERT INTO ASIGNATURAS VALUES ('Eco','Estructura de Computadores',9,1,'2','T',2.0,1.0,3,10,366);

INSERT INTO ASIGNATURAS VALUES ('Fis-S','Fisica (Sistemas)',12,1,'A','T',3.0,1.0,2,6,189);

INSERT INTO ASIGNATURAS VALUES ('Alg','Algebra',12,1,'A','T',4.0,0.0,3,0,321);

INSERT INTO ASIGNATURAS VALUES ('Cal','Calculo',12,1,'A','T',4.0,0.0,3,0,362);

INSERT INTO ASIGNATURAS VALUES ('IPr','Introduccion a la Programacion',15,1,'A','T',3.5,1.5,3,8,360);

INSERT INTO ASIGNATURAS VALUES ('Est','Estadistica',9,2,'A','T',2.5,0.5,2,5,245);

INSERT INTO ASIGNATURAS VALUES ('EDa','Estructuras de Datos',9,2,'1','T',2.0,1.0,2,6,303);

INSERT INTO ASIGNATURAS VALUES ('MPr','Metodologia de la Programacion',9,2,'2','T',2.0,1.0,2,6,327);

INSERT INTO ASIGNATURAS VALUES ('ACo','Arquitectura de Computadores',12,2,'A','T',3.0,1.0,1,5,157);

INSERT INTO ASIGNATURAS VALUES ('ANu','Analisis Numerico',6,2,'A','T',2,0,2,0,229);

INSERT INTO ASIGNATURAS VALUES ('ALF','Automatas y Lenguajes Formales',9,2,'A','T',2,1,1,3,171);

INSERT INTO ASIGNATURAS VALUES ('BDa','Bases de Datos',12,3,'A','T',3,1,2,5,187);

INSERT INTO ASIGNATURAS VALUES ('Red','Redes',9,3,'A','T',2,1,1,6,113);

INSERT INTO ASIGNATURAS VALUES ('SOp','Sistemas Operativos',12,3,'A','T',3,1,2,4,228);

INSERT INTO ASIGNATURAS VALUES ('DES','Diseño y Explotacion de Sistemas',9,3,'A','O',2,1,2,5,187);

INSERT INTO ASIGNATURAS VALUES ('Ing','Ingles',9,2,'A','P',3,0,2,0,68);

INSERT INTO ASIGNATURAS VALUES ('Ele','Electronica',9,2,'1','P',2,1,1,1,43);

INSERT INTO ASIGNATURAS VALUES ('PDe','Programacion Declarativa',9,2,'A','P',2,1,1,2,29);

INSERT INTO ASIGNATURAS VALUES ('IPe','Interfaces y Perifericos',9,2,'A','P',2,1,1,2,61);

INSERT INTO ASIGNATURAS VALUES ('Ofi','Ofimatica',9,2,'A','P',2,1,2,7,190);

INSERT INTO ASIGNATURAS VALUES ('IOp','Investigacion Operativa',9,2,'A','P',3,0,1,0,88);

INSERT INTO ASIGNATURAS VALUES ('Aut','Automatica',9,2,'A','P',2,1,1,1,25);

INSERT INTO ASIGNATURAS VALUES ('TCo-2','Tecnologia de Computadores II',9,2,'2','P',2,1,1,1,41);

INSERT INTO ASIGNATURAS VALUES ('PSi','Programacion de Sistemas',9,2,'','P',2,1,4,0,2);

INSERT INTO ASIGNATURAS VALUES ('ITe','Ingles Tecnico',9,3,'A','P',3,0,1,0,43);

INSERT INTO ASIGNATURAS VALUES ('InP','Ingenieria de la Programacion',9,3,'A','P',2,1,2,5,163);

INSERT INTO ASIGNATURAS VALUES ('IAr','Inteligencia Artificial',9,3,'2','P',2,1,1,2,33);

INSERT INTO ASIGNATURAS VALUES ('PLe','Procesadores de Lenguajes',9,3,'1','P',2,1,1,2,50);

INSERT INTO ASIGNATURAS VALUES ('FTS','Fiabilidad y Test de Sistemas',9,3,'A','P',2,1,1,1,22);

INSERT INTO ASIGNATURAS VALUES ('ANC','Arquitecturas No Clasicas',9,3,'A','P',3,0,1,0,46);

INSERT INTO ASIGNATURAS VALUES ('DFC','Diseño y Fabricacion por Computador',9,3,'A','P',2,1,1,5,101);

INSERT INTO ASIGNATURAS VALUES ('Rob','Robotica',9,3,'A','P',2,1,1,2,46);

INSERT INTO ASIGNATURAS VALUES ('SDi','Sistemas Distribuidos',9,3,'A','P',2,1,1,2,125);

INSERT INTO ASIGNATURAS VALUES ('DSM','Diseño de Sistemas con Microprocesador',9,3,'','P',2,1,0,0,0);

INSERT INTO ASIGNATURAS VALUES ('PSe','Procesamiento de la Señal',9,3,'A','P',2,1,1,1,53);



REM INSERTANDO EN LOCALES
INSERT INTO LOCALES VALUES ('A11','Aula A11','1',117,'EUI','Planta Primera, fondo');
INSERT INTO LOCALES VALUES ('A21','Aula A21','1',117,'EUI','Planta Segunda, fondo');
INSERT INTO LOCALES VALUES ('AC1','Aula de Computadores I','1',48,'EUI','Planta Segunda, derecha');
INSERT INTO LOCALES VALUES ('AC2','Aula de Computadores II','1',32,'ITA','Planta Baja, izquierda');
INSERT INTO LOCALES VALUES ('AC3','Aula de Computadores III','1',32,'ITA','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('AC4','Aula de Computadores IV','1',32,'EUI','Planta Segunda, izquierda');
INSERT INTO LOCALES VALUES ('ACLU','Aula de Computadores de Libre Uso','0',20,'EUI','Planta Primera, derecha');
INSERT INTO LOCALES VALUES ('B01','Aula B01','1',150,'EGB','Planta Baja, derecha');
INSERT INTO LOCALES VALUES ('B02','Aula B02','1',56,'EGB','Planta Baja, enfrente');
INSERT INTO LOCALES VALUES ('B11','Aula B11','1',130,'EGB','Planta Primera, derecha');
INSERT INTO LOCALES VALUES ('LFIS','Laboratorio de Física','1',40,'ITA','Planta Primera, izquierda');
INSERT INTO LOCALES VALUES ('LS1','Laboratorio de Sistemas 1','1',32,'ITA','Planta Baja, izquierda exterior');
INSERT INTO LOCALES VALUES ('LS2','Laboratorio de Sistemas 2','1',32,'EUI','Planta Primera, izquierda');
INSERT INTO LOCALES VALUES ('SCAD','Seminario de CAD/CAM','0',6,'ITA','Planta Baja, izquierda');
INSERT INTO LOCALES VALUES ('SHARD','Seminario de Hardware','0',10,'EUI','Planta Primera, izquierda');
INSERT INTO LOCALES VALUES ('SJUN','Sala de Juntas','0',48,'EUI','Planta Baja, izquierda');
INSERT INTO LOCALES VALUES ('SPRO','Seminario de Profesores','0',12,'EUI','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('SSOFT','Seminario de Software','0',10,'EUI','Planta Segunda, izquierda');
INSERT INTO LOCALES VALUES ('I11','Despacho I11','0',3,'ITA','Planta Primera, izquierda');
INSERT INTO LOCALES VALUES ('I12','Despacho I12','0',1,'ITA','Planta Primera, derecha');
INSERT INTO LOCALES VALUES ('I31','Despacho I31','0',2,'ITA','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('301','Despacho 301','0',3,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('302','Despacho 302','0',3,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('303','Despacho 303','0',3,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('304','Despacho 304','0',3,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('305','Despacho 305','0',3,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('306','Despacho 306','0',4,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('307','Despacho 307','0',4,'EUI','Planta Tercera, derecha');
INSERT INTO LOCALES VALUES ('308','Despacho 308','0',4,'EUI','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('310','Despacho 310','0',3,'EUI','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('311','Despacho 311','0',3,'EUI','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('312','Despacho 312','0',3,'EUI','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('313','Despacho 313','0',3,'EUI','Planta Tercera, izquierda');
INSERT INTO LOCALES VALUES ('A01','Aula A01','1',80,'EUI','Planta Baja, derecha (exbiblioteca)');





REM INSERTANDO EN GRUPOS


INSERT INTO GRUPOS VALUES ('1','T','A','1 Teoria Sistemas - Mananas');                      
INSERT INTO GRUPOS VALUES ('1','T','B','1 Teoria Gestion - Mananas');                      
INSERT INTO GRUPOS VALUES ('1','T','C','1 Teoria Sistemas - Tardes');                  
INSERT INTO GRUPOS VALUES ('1','T','D','1 Teoria Gestion - Tardes');                      
INSERT INTO GRUPOS VALUES ('1','T','CD','1 Teoria Comun - Tardes');                     
INSERT INTO GRUPOS VALUES ('2','T','A','2 Teoria Sistemas');                                                     
INSERT INTO GRUPOS VALUES ('2','T','B','2 Teoria Gestion');                            
INSERT INTO GRUPOS VALUES ('3','T','A','3 Teoria Sistemas');                               
INSERT INTO GRUPOS VALUES ('3','T','B','3 Teoria Gestion');                                 
INSERT INTO GRUPOS VALUES ('1','P','G01','1 Practicas 1');                            
INSERT INTO GRUPOS VALUES ('1','P','G02','1 Practicas 2');                               
INSERT INTO GRUPOS VALUES ('1','P','G03','1 Practicas 3');                            
INSERT INTO GRUPOS VALUES ('1','P','G04','1 Practicas 4');                            
INSERT INTO GRUPOS VALUES ('1','P','G05','1 Practicas 5');                          
INSERT INTO GRUPOS VALUES ('1','P','G06','1 Practicas 6');
INSERT INTO GRUPOS VALUES ('1','P','G07','1 Practicas 7');
INSERT INTO GRUPOS VALUES ('1','P','G08','1 Practicas 8');
INSERT INTO GRUPOS VALUES ('1','P','G09','1 Practicas 9');
INSERT INTO GRUPOS VALUES ('1','P','G10','1 Practicas 10');
INSERT INTO GRUPOS VALUES ('2','P','G01','2 Practicas 1');
INSERT INTO GRUPOS VALUES ('2','P','G02','2 Practicas 2');
INSERT INTO GRUPOS VALUES ('2','P','G03','2 Practicas 3');
INSERT INTO GRUPOS VALUES ('2','P','G04','2 Practicas 4');
INSERT INTO GRUPOS VALUES ('2','P','G05','2 Practicas 5');
INSERT INTO GRUPOS VALUES ('2','P','G06','2 Practicas 6');
INSERT INTO GRUPOS VALUES ('3','P','G01','3 Practicas 1');
INSERT INTO GRUPOS VALUES ('3','P','G02','3 Practicas 2');
INSERT INTO GRUPOS VALUES ('3','P','G03','3 Practicas 3');
INSERT INTO GRUPOS VALUES ('3','P','G04','3 Practicas 4');
INSERT INTO GRUPOS VALUES ('2','T','-','2 Teoria Comun');
INSERT INTO GRUPOS VALUES ('3','T','-','3 Teoria Comun');
INSERT INTO GRUPOS VALUES ('2','T','B1','2 Teoria Gestion 1');
INSERT INTO GRUPOS VALUES ('2','T','B2','2 Teoria Gestion 2');
INSERT INTO GRUPOS VALUES ('2','P','G07','2 Practicas 7');
INSERT INTO GRUPOS VALUES ('3','P','G05','3 Practicas 5');
INSERT INTO GRUPOS VALUES ('3','P','G06','3 Practicas 6');

REM INSERTANDO EN docencia
INSERT INTO DOCENCIA VALUES (414,'1','T','A','Alg',24,'B01',2,11.3,1);
INSERT INTO DOCENCIA VALUES (415,'1','T','A','Alg',24,'B01',3,12.3,1);
INSERT INTO DOCENCIA VALUES (416,'1','T','A','Alg',24,'B01',4,11.3,1);
INSERT INTO DOCENCIA VALUES (417,'1','T','A','Alg',24,'B01',5,9.3,1);
INSERT INTO DOCENCIA VALUES (418,'1','T','A','Cal',11,'B01',3,10.3,1);
INSERT INTO DOCENCIA VALUES (419,'1','T','A','Cal',11,'B01',3,11.3,1);
INSERT INTO DOCENCIA VALUES (420,'1','T','A','Cal',11,'B01',4,10.3,1);
INSERT INTO DOCENCIA VALUES (421,'1','T','A','Cal',11,'B01',5,10.3,1);
INSERT INTO DOCENCIA VALUES (422,'1','T','A','Eco',31,'B01',1,9.3,1);
INSERT INTO DOCENCIA VALUES (423,'1','T','A','Eco',31,'B01',2,9.3,1);
INSERT INTO DOCENCIA VALUES (424,'1','T','A','Eco',31,'B01',2,10.3,1);
INSERT INTO DOCENCIA VALUES (425,'1','T','A','Eco',31,'B01',4,12.3,1);
INSERT INTO DOCENCIA VALUES (426,'1','T','A','Fis-S',39,'B01',1,12.3,1);
INSERT INTO DOCENCIA VALUES (427,'1','T','A','Fis-S',39,'B01',2,13.3,1);
INSERT INTO DOCENCIA VALUES (428,'1','T','A','Fis-S',39,'B01',3,13.3,1);
INSERT INTO DOCENCIA VALUES (429,'1','T','A','IPr',35,'B01',1,10.3,1);
INSERT INTO DOCENCIA VALUES (430,'1','T','A','IPr',35,'B01',1,11.3,2);
INSERT INTO DOCENCIA VALUES (431,'1','T','A','IPr',35,'B01',2,12.3,1);
INSERT INTO DOCENCIA VALUES (432,'1','T','A','IPr',35,'B01',3,9.3,1);
INSERT INTO DOCENCIA VALUES (433,'1','T','A','TCo-S',1,'B01',1,9.3,1);
INSERT INTO DOCENCIA VALUES (434,'1','T','A','TCo-S',1,'B01',2,9.3,1);
INSERT INTO DOCENCIA VALUES (435,'1','T','A','TCo-S',1,'B01',2,10.3,1);
INSERT INTO DOCENCIA VALUES (436,'1','T','A','TCo-S',1,'B01',4,12.3,1);
INSERT INTO DOCENCIA VALUES (437,'1','T','B','Alg',24,'A11',2,8.3,1);
INSERT INTO DOCENCIA VALUES (438,'1','T','B','Alg',24,'A11',3,10.3,1);
INSERT INTO DOCENCIA VALUES (439,'1','T','B','Alg',24,'A11',4,9.3,1);
INSERT INTO DOCENCIA VALUES (440,'1','T','B','Alg',24,'A11',5,11.3,1);
INSERT INTO DOCENCIA VALUES (441,'1','T','B','Cal',28,'A11',1,12.3,1);
INSERT INTO DOCENCIA VALUES (442,'1','T','B','Cal',28,'A11',4,10.3,1);
INSERT INTO DOCENCIA VALUES (443,'1','T','B','Cal',28,'A11',5,9.3,1);
INSERT INTO DOCENCIA VALUES (444,'1','T','B','Cal',28,'A11',5,10.3,1);
INSERT INTO DOCENCIA VALUES (445,'1','T','B','CEm',48,'A11',3,13.3,1);
INSERT INTO DOCENCIA VALUES (446,'1','T','B','CEm',48,'A11',4,11.3,1);
INSERT INTO DOCENCIA VALUES (447,'1','T','B','CEm',48,'A11',4,12.3,1);
INSERT INTO DOCENCIA VALUES (448,'1','T','B','Eco',31,'A11',1,10.3,1);
INSERT INTO DOCENCIA VALUES (449,'1','T','B','Eco',31,'A11',1,11.3,1);
INSERT INTO DOCENCIA VALUES (450,'1','T','B','Eco',31,'A11',2,11.3,1);
INSERT INTO DOCENCIA VALUES (451,'1','T','B','Eco',31,'A11',4,13.3,1);

INSERT INTO DOCENCIA VALUES (452,'1','T','B','Fis-G',39,'A11',1,13.3,1);
INSERT INTO DOCENCIA VALUES (453,'1','T','B','Fis-G',39,'A11',2,12.3,1);
INSERT INTO DOCENCIA VALUES (454,'1','T','B','Fis-G',39,'A11',3,11.3,1);
INSERT INTO DOCENCIA VALUES (455,'1','T','B','Fis-G',39,'A11',3,12.3,1);

INSERT INTO DOCENCIA VALUES (456,'1','T','B','IPr',19,'A11',1,9.3,1);
INSERT INTO DOCENCIA VALUES (457,'1','T','B','IPr',19,'A11',2,9.3,1);
INSERT INTO DOCENCIA VALUES (458,'1','T','B','IPr',19,'A11',2,10.3,2);
INSERT INTO DOCENCIA VALUES (459,'1','T','B','IPr',19,'A11',3,9.3,1);

INSERT INTO DOCENCIA VALUES (460,'1','T','B','TCo-G',1,'A11',1,10.3,1);
INSERT INTO DOCENCIA VALUES (461,'1','T','B','TCo-G',1,'A11',1,11.3,1);
INSERT INTO DOCENCIA VALUES (462,'1','T','B','TCo-G',1,'A11',2,11.3,1);
INSERT INTO DOCENCIA VALUES (463,'1','T','B','TCo-G',1,'A11',4,13.3,1);

INSERT INTO DOCENCIA VALUES (464,'1','T','C','Fis-S',41,'B01',1,17.3,1);
INSERT INTO DOCENCIA VALUES (465,'1','T','C','Fis-S',41,'B01',1,18.3,1);
INSERT INTO DOCENCIA VALUES (466,'1','T','C','Fis-S',41,'B01',2,16.3,1);

INSERT INTO DOCENCIA VALUES (467,'1','T','CD','Alg',13,'B01',3,19.3,1);
INSERT INTO DOCENCIA VALUES (468,'1','T','CD','Alg',13,'B01',4,17.3,1);
INSERT INTO DOCENCIA VALUES (469,'1','T','CD','Alg',13,'B01',5,16.3,1);
INSERT INTO DOCENCIA VALUES (470,'1','T','CD','Alg',13,'B01',5,17.3,1);

INSERT INTO DOCENCIA VALUES (471,'1','T','CD','Cal',11,'B01',2,18.3,1);
INSERT INTO DOCENCIA VALUES (472,'1','T','CD','Cal',11,'B01',2,19.3,1);
INSERT INTO DOCENCIA VALUES (473,'1','T','CD','Cal',11,'B01',3,20.3,1);
INSERT INTO DOCENCIA VALUES (474,'1','T','CD','Cal',11,'B01',4,18.3,1);

INSERT INTO DOCENCIA VALUES (475,'1','T','CD','Eco',38,'B01',2,20.3,1);
INSERT INTO DOCENCIA VALUES (476,'1','T','CD','Eco',38,'B01',3,18.3,1);
INSERT INTO DOCENCIA VALUES (477,'1','T','CD','Eco',38,'B01',4,19.3,1);
INSERT INTO DOCENCIA VALUES (478,'1','T','CD','Eco',38,'B01',4,20.3,1);
INSERT INTO DOCENCIA VALUES (479,'1','T','CD','IPr',17,'B01',1,19.3,1);
INSERT INTO DOCENCIA VALUES (480,'1','T','CD','IPr',17,'B01',1,20.3,2);
INSERT INTO DOCENCIA VALUES (481,'1','T','CD','IPr',17,'B01',2,17.3,1);
INSERT INTO DOCENCIA VALUES (482,'1','T','CD','IPr',17,'B01',3,17.3,1);

INSERT INTO DOCENCIA VALUES (483,'1','T','CD','TCo-S',42,'B01',2,20.3,1);
INSERT INTO DOCENCIA VALUES (484,'1','T','CD','TCo-S',42,'B01',3,18.3,1);
INSERT INTO DOCENCIA VALUES (485,'1','T','CD','TCo-S',42,'B01',4,19.3,1);
INSERT INTO DOCENCIA VALUES (486,'1','T','CD','TCo-S',42,'B01',4,20.3,1);

INSERT INTO DOCENCIA VALUES (487,'1','T','D','CEm',15,'A11',1,17.3,1);
INSERT INTO DOCENCIA VALUES (488,'1','T','D','CEm',15,'A11',1,18.3,1);
INSERT INTO DOCENCIA VALUES (489,'1','T','D','CEm',15,'A11',2,16.3,1);

INSERT INTO DOCENCIA VALUES (490,'1','T','D','Fis-G',41,'A11',1,16.3,1);
INSERT INTO DOCENCIA VALUES (491,'1','T','D','Fis-G',41,'B01',3,16.3,1);
INSERT INTO DOCENCIA VALUES (492,'1','T','D','Fis-G',41,'B01',4,16.3,1);
INSERT INTO DOCENCIA VALUES (493,'1','T','D','Fis-G',41,'B11',2,15.3,1);

INSERT INTO DOCENCIA VALUES (494,'1','P','G01','Eco',31,'AC1',1,12.3,1);
INSERT INTO DOCENCIA VALUES (495,'1','P','G01','Eco',31,'AC1',1,13.3,1);

INSERT INTO DOCENCIA VALUES (496,'1','P','G01','Fis-S',39,'LFIS',1,10.3,2);
INSERT INTO DOCENCIA VALUES (497,'1','P','G01','Fis-S',39,'LFIS',1,11.3,2);

INSERT INTO DOCENCIA VALUES (498,'1','P','G01','IPr',50,'AC1',1,16.3,1);
INSERT INTO DOCENCIA VALUES (499,'1','P','G01','IPr',50,'AC1',1,17.3,2);

INSERT INTO DOCENCIA VALUES (502,'1','P','G02','Eco',43,'LS2',1,18.3,1);
INSERT INTO DOCENCIA VALUES (503,'1','P','G02','Eco',43,'LS2',1,19.3,1);

INSERT INTO DOCENCIA VALUES (504,'1','P','G02','Fis-S',41,'LFIS',1,10.3,2);
INSERT INTO DOCENCIA VALUES (505,'1','P','G02','Fis-S',41,'LFIS',1,11.3,2);

INSERT INTO DOCENCIA VALUES (506,'1','P','G02','IPr',50,'AC1',1,17.3,2);
INSERT INTO DOCENCIA VALUES (507,'1','P','G02','IPr',50,'AC1',1,18.3,1);

INSERT INTO DOCENCIA VALUES (508,'1','P','G02','TCo-S',42,'LS1',2,9.3,1);
INSERT INTO DOCENCIA VALUES (509,'1','P','G02','TCo-S',42,'LS1',2,10.3,1);

INSERT INTO DOCENCIA VALUES (510,'1','P','G03','Eco',31,'LS2',2,12.3,1);
INSERT INTO DOCENCIA VALUES (511,'1','P','G03','Eco',31,'LS2',2,13.3,1);

INSERT INTO DOCENCIA VALUES (512,'1','P','G03','Fis-S',20,'LFIS',1,16.3,2);
INSERT INTO DOCENCIA VALUES (513,'1','P','G03','Fis-S',20,'LFIS',1,17.3,2);
INSERT INTO DOCENCIA VALUES (514,'1','P','G03','IPr',50,'AC1',1,19.3,1);
INSERT INTO DOCENCIA VALUES (515,'1','P','G03','IPr',50,'AC1',1,20.3,2);
INSERT INTO DOCENCIA VALUES (518,'1','P','G04','Eco',31,'LS2',2,18.3,1);
INSERT INTO DOCENCIA VALUES (519,'1','P','G04','Eco',31,'LS2',2,19.3,1);
INSERT INTO DOCENCIA VALUES (520,'1','P','G04','Fis-S',20,'LFIS',1,16.3,2);
INSERT INTO DOCENCIA VALUES (521,'1','P','G04','Fis-S',20,'LFIS',1,17.3,2);
INSERT INTO DOCENCIA VALUES (522,'1','P','G04','IPr',35,'AC1',2,9.3,1);
INSERT INTO DOCENCIA VALUES (523,'1','P','G04','IPr',35,'AC1',2,10.3,2);
INSERT INTO DOCENCIA VALUES (524,'1','P','G04','TCo-S',42,'LS1',3,10.3,1);
INSERT INTO DOCENCIA VALUES (525,'1','P','G04','TCo-S',42,'LS1',3,11.3,1);
INSERT INTO DOCENCIA VALUES (526,'1','P','G05','Eco',31,'LS2',3,12.3,1);
INSERT INTO DOCENCIA VALUES (527,'1','P','G05','Eco',31,'LS2',3,13.3,1);
INSERT INTO DOCENCIA VALUES (528,'1','P','G05','Fis-S',20,'LFIS',2,16.3,2);
INSERT INTO DOCENCIA VALUES (529,'1','P','G05','Fis-S',20,'LFIS',2,17.3,2);
INSERT INTO DOCENCIA VALUES (530,'1','P','G05','IPr',19,'AC1',2,10.3,2);
INSERT INTO DOCENCIA VALUES (531,'1','P','G05','IPr',19,'AC1',2,11.3,1);
INSERT INTO DOCENCIA VALUES (532,'1','P','G05','TCo-S',42,'LS1',3,16.3,1);
INSERT INTO DOCENCIA VALUES (533,'1','P','G05','TCo-S',42,'LS1',3,17.3,1);
INSERT INTO DOCENCIA VALUES (534,'1','P','G06','Eco',31,'AC2',3,16.3,1);
INSERT INTO DOCENCIA VALUES (535,'1','P','G06','Eco',31,'AC2',3,17.3,1);
INSERT INTO DOCENCIA VALUES (536,'1','P','G06','Fis-S',20,'LFIS',2,16.3,2);
INSERT INTO DOCENCIA VALUES (537,'1','P','G06','Fis-S',20,'LFIS',2,17.3,2);
INSERT INTO DOCENCIA VALUES (538,'1','P','G06','IPr',35,'AC1',3,12.3,1);
INSERT INTO DOCENCIA VALUES (539,'1','P','G06','IPr',35,'AC1',3,13.3,2);
INSERT INTO DOCENCIA VALUES (540,'1','P','G07','Eco',38,'AC1',3,19.3,1);
INSERT INTO DOCENCIA VALUES (541,'1','P','G07','Eco',38,'AC1',3,20.3,1);
INSERT INTO DOCENCIA VALUES (542,'1','P','G07','IPr',35,'AC1',3,16.3,1);
INSERT INTO DOCENCIA VALUES (543,'1','P','G07','IPr',35,'AC1',3,17.3,2);
INSERT INTO DOCENCIA VALUES (544,'1','P','G08','Eco',31,'AC1',4,9.3,1);
INSERT INTO DOCENCIA VALUES (545,'1','P','G08','Eco',31,'AC1',4,10.3,1);
INSERT INTO DOCENCIA VALUES (548,'1','P','G09','Eco',38,'AC1',4,17.3,1);
INSERT INTO DOCENCIA VALUES (549,'1','P','G09','Eco',38,'AC1',4,18.3,1);
INSERT INTO DOCENCIA VALUES (550,'1','P','G10','Eco',43,'AC1',4,19.3,1);
INSERT INTO DOCENCIA VALUES (551,'1','P','G10','Eco',43,'AC1',4,20.3,1);

INSERT INTO DOCENCIA VALUES (552,'2','T','-','Ele',37,'B02',2,10.3,1);
INSERT INTO DOCENCIA VALUES (553,'2','T','-','Ele',37,'B02',2,11.3,1);
INSERT INTO DOCENCIA VALUES (554,'2','T','-','Ele',37,'B11',3,13.3,1);
INSERT INTO DOCENCIA VALUES (555,'2','T','-','Ele',37,'B11',4,13.3,1);
INSERT INTO DOCENCIA VALUES (556,'2','T','-','IOp',5,'B11',1,18.3,1);
INSERT INTO DOCENCIA VALUES (557,'2','T','-','IOp',5,'B11',1,19.3,1);
INSERT INTO DOCENCIA VALUES (558,'2','T','-','IOp',5,'B11',2,17.3,1);
INSERT INTO DOCENCIA VALUES (559,'2','T','-','IPe',33,'B11',5,10.3,1);
INSERT INTO DOCENCIA VALUES (560,'2','T','-','IPe',33,'B11',5,11.3,1);
INSERT INTO DOCENCIA VALUES (561,'2','T','-','PDe',8,'B11',3,9.3,1);
INSERT INTO DOCENCIA VALUES (562,'2','T','-','PDe',8,'B11',4,9.3,1);
INSERT INTO DOCENCIA VALUES (563,'2','T','-','TCo-2',37,'B02',2,10.3,1);
INSERT INTO DOCENCIA VALUES (564,'2','T','-','TCo-2',37,'B02',2,11.3,1);
INSERT INTO DOCENCIA VALUES (565,'2','T','-','TCo-2',37,'B11',3,13.3,1);
INSERT INTO DOCENCIA VALUES (566,'2','T','-','TCo-2',37,'B11',4,13.3,1);
INSERT INTO DOCENCIA VALUES (567,'2','T','A','ACo',4,'B11',2,12.3,1);
INSERT INTO DOCENCIA VALUES (568,'2','T','A','ACo',4,'B11',2,13.3,1);
INSERT INTO DOCENCIA VALUES (569,'2','T','A','ACo',4,'B11',5,12.3,1);
INSERT INTO DOCENCIA VALUES (570,'2','T','A','ALF',17,'B11',1,12.3,1);
INSERT INTO DOCENCIA VALUES (571,'2','T','A','ALF',17,'B11',2,9.3,1);
INSERT INTO DOCENCIA VALUES (572,'2','T','A','ANu',28,'B11',1,9.3,1);
INSERT INTO DOCENCIA VALUES (573,'2','T','A','ANu',28,'B11',4,12.3,1);
INSERT INTO DOCENCIA VALUES (574,'2','T','A','Aut',12,'B02',3,12.3,1);
INSERT INTO DOCENCIA VALUES (575,'2','T','A','Aut',12,'B11',4,10.3,1);
INSERT INTO DOCENCIA VALUES (576,'2','T','A','EDa',27,'B11',1,10.3,1);
INSERT INTO DOCENCIA VALUES (577,'2','T','A','EDa',27,'B11',1,11.3,1);
INSERT INTO DOCENCIA VALUES (578,'2','T','A','EDa',27,'B11',3,11.3,1);
INSERT INTO DOCENCIA VALUES (579,'2','T','A','EDa',27,'B11',4,11.3,1);
INSERT INTO DOCENCIA VALUES (580,'2','T','A','Est',5,'B11',1,13.3,1);
INSERT INTO DOCENCIA VALUES (581,'2','T','A','Est',5,'B11',5,9.3,1);
INSERT INTO DOCENCIA VALUES (582,'2','T','A','Ing',3,'B02',3,9.3,1);
INSERT INTO DOCENCIA VALUES (583,'2','T','A','Ing',3,'B02',3,10.3,1);
INSERT INTO DOCENCIA VALUES (584,'2','T','A','Ing',3,'B11',5,13.3,1);
INSERT INTO DOCENCIA VALUES (585,'2','T','A','MPr',27,'B11',1,10.3,1);
INSERT INTO DOCENCIA VALUES (586,'2','T','A','MPr',27,'B11',1,11.3,1);
INSERT INTO DOCENCIA VALUES (587,'2','T','A','MPr',27,'B11',3,11.3,1);
INSERT INTO DOCENCIA VALUES (588,'2','T','A','MPr',27,'B11',4,11.3,1);
INSERT INTO DOCENCIA VALUES (591,'2','T','B','ANu',13,'B11',5,18.3,1);

INSERT INTO DOCENCIA VALUES (592,'2','T','B','ANu',13,'B11',4,18.3,1);
INSERT INTO DOCENCIA VALUES (593,'2','T','B','DIE',32,'B11',1,20.3,1);
INSERT INTO DOCENCIA VALUES (594,'2','T','B','DIE',32,'B11',5,19.3,1);
INSERT INTO DOCENCIA VALUES (595,'2','T','B','DIE',32,'B11',5,20.3,1);
INSERT INTO DOCENCIA VALUES (596,'2','T','B','EDa',14,'B11',1,17.3,1);
INSERT INTO DOCENCIA VALUES (597,'2','T','B','EDa',14,'B11',2,19.3,1);
INSERT INTO DOCENCIA VALUES (598,'2','T','B','EDa',14,'B11',2,20.3,1);
INSERT INTO DOCENCIA VALUES (599,'2','T','B','EDa',14,'B11',3,18.3,1);
INSERT INTO DOCENCIA VALUES (600,'2','T','B','Est',5,'B11',1,16.3,1);
INSERT INTO DOCENCIA VALUES (601,'2','T','B','Est',5,'B11',2,16.3,1);
INSERT INTO DOCENCIA VALUES (602,'2','T','B','Ing',3,'A11',3,19.3,1);
INSERT INTO DOCENCIA VALUES (603,'2','T','B','Ing',3,'A11',3,20.3,1);
INSERT INTO DOCENCIA VALUES (604,'2','T','B','Ing',3,'A11',4,19.3,1);
INSERT INTO DOCENCIA VALUES (605,'2','T','B','MPr',14,'B11',1,17.3,1);
INSERT INTO DOCENCIA VALUES (606,'2','T','B','MPr',14,'B11',2,19.3,1);
INSERT INTO DOCENCIA VALUES (607,'2','T','B','MPr',14,'B11',2,20.3,1);
INSERT INTO DOCENCIA VALUES (608,'2','T','B','MPr',14,'B11',3,18.3,1);
INSERT INTO DOCENCIA VALUES (609,'2','T','B','Ofi',44,'A21',4,12.3,1);
INSERT INTO DOCENCIA VALUES (610,'2','T','B','Ofi',44,'B11',3,12.3,1);
INSERT INTO DOCENCIA VALUES (611,'2','T','B1','EEm',48,'B11',3,16.3,1);
INSERT INTO DOCENCIA VALUES (612,'2','T','B1','EEm',48,'B11',3,17.3,1);
INSERT INTO DOCENCIA VALUES (613,'2','T','B1','EEm',48,'B11',4,16.3,1);
INSERT INTO DOCENCIA VALUES (614,'2','T','B1','IGe',25,'B11',4,17.3,1);
INSERT INTO DOCENCIA VALUES (615,'2','T','B1','IGe',25,'B11',5,16.3,1);
INSERT INTO DOCENCIA VALUES (616,'2','T','B1','IGe',25,'B11',5,17.3,1);
INSERT INTO DOCENCIA VALUES (617,'2','T','B2','EEm',48,'A11',4,17.3,1);
INSERT INTO DOCENCIA VALUES (618,'2','T','B2','EEm',48,'A11',5,15.3,1);
INSERT INTO DOCENCIA VALUES (619,'2','T','B2','EEm',48,'A11',5,16.3,1);
INSERT INTO DOCENCIA VALUES (620,'2','T','B2','IGe',25,'A11',3,16.3,1);
INSERT INTO DOCENCIA VALUES (621,'2','T','B2','IGe',25,'A11',3,17.3,1);

INSERT INTO DOCENCIA VALUES (622,'2','T','B2','IGe',25,'A11',4,16.3,1);
INSERT INTO DOCENCIA VALUES (625,'2','P','G01','ALF',17,'LS2',1,16.3,2);
INSERT INTO DOCENCIA VALUES (626,'2','P','G01','ALF',17,'LS2',1,17.3,2);
INSERT INTO DOCENCIA VALUES (627,'2','P','G01','Aut',12,'LS2',3,16.3,2);
INSERT INTO DOCENCIA VALUES (628,'2','P','G01','Aut',12,'LS2',3,17.3,2);
INSERT INTO DOCENCIA VALUES (629,'2','P','G01','EDa',19,'AC2',1,10.3,1);
INSERT INTO DOCENCIA VALUES (630,'2','P','G01','EDa',19,'AC2',1,11.3,1);
INSERT INTO DOCENCIA VALUES (631,'2','P','G01','Ele',37,'LS1',4,19.3,1);
INSERT INTO DOCENCIA VALUES (632,'2','P','G01','Ele',37,'LS1',4,20.3,1);
INSERT INTO DOCENCIA VALUES (633,'2','P','G01','Est',29,'AC3',1,18.3,1);
INSERT INTO DOCENCIA VALUES (634,'2','P','G01','IGe',16,'AC2',4,19.3,1);
INSERT INTO DOCENCIA VALUES (635,'2','P','G01','IPe',33,'LS2',3,10.3,2);
INSERT INTO DOCENCIA VALUES (636,'2','P','G01','IPe',33,'LS2',3,11.3,2);
INSERT INTO DOCENCIA VALUES (637,'2','P','G01','MPr',14,'AC2',1,10.3,1);
INSERT INTO DOCENCIA VALUES (638,'2','P','G01','MPr',14,'AC2',1,11.3,1);
INSERT INTO DOCENCIA VALUES (639,'2','P','G01','Ofi',44,'AC4',2,10.3,2);
INSERT INTO DOCENCIA VALUES (640,'2','P','G01','Ofi',44,'AC4',2,11.3,2);
INSERT INTO DOCENCIA VALUES (641,'2','P','G01','PDe',8,'AC2',1,16.3,2);
INSERT INTO DOCENCIA VALUES (642,'2','P','G01','PDe',8,'AC2',1,17.3,2);
INSERT INTO DOCENCIA VALUES (643,'2','P','G01','TCo-2',37,'LS1',4,19.3,1);
INSERT INTO DOCENCIA VALUES (644,'2','P','G01','TCo-2',37,'LS1',4,20.3,1);
INSERT INTO DOCENCIA VALUES (647,'2','P','G02','ALF',17,'LS2',1,16.3,2);
INSERT INTO DOCENCIA VALUES (648,'2','P','G02','ALF',17,'LS2',1,17.3,2);
INSERT INTO DOCENCIA VALUES (649,'2','P','G02','EDa',19,'AC2',1,12.3,1);
INSERT INTO DOCENCIA VALUES (650,'2','P','G02','EDa',19,'AC2',1,13.3,1);
INSERT INTO DOCENCIA VALUES (651,'2','P','G02','Est',29,'AC3',1,19.3,1);
INSERT INTO DOCENCIA VALUES (652,'2','P','G02','IGe',16,'AC2',4,20.3,1);
INSERT INTO DOCENCIA VALUES (653,'2','P','G02','IPe',33,'LS2',3,16.3,2);

INSERT INTO DOCENCIA VALUES (654,'2','P','G02','IPe',33,'LS2',3,17.3,2);
INSERT INTO DOCENCIA VALUES (655,'2','P','G02','MPr',14,'AC2',1,12.3,1);
INSERT INTO DOCENCIA VALUES (656,'2','P','G02','MPr',14,'AC2',1,13.3,1);
INSERT INTO DOCENCIA VALUES (657,'2','P','G02','Ofi',44,'AC4',2,10.3,2);
INSERT INTO DOCENCIA VALUES (658,'2','P','G02','Ofi',44,'AC4',2,11.3,2);
INSERT INTO DOCENCIA VALUES (659,'2','P','G02','PDe',8,'AC2',2,12.3,2);
INSERT INTO DOCENCIA VALUES (660,'2','P','G02','PDe',8,'AC2',2,13.3,2);
INSERT INTO DOCENCIA VALUES (663,'2','P','G03','ALF',17,'LS2',2,19.3,2);
INSERT INTO DOCENCIA VALUES (664,'2','P','G03','ALF',17,'LS2',2,20.3,2);
INSERT INTO DOCENCIA VALUES (665,'2','P','G03','EDa',19,'AC2',2,16.3,1);
INSERT INTO DOCENCIA VALUES (666,'2','P','G03','EDa',19,'AC2',2,17.3,1);
INSERT INTO DOCENCIA VALUES (667,'2','P','G03','Est',29,'AC3',1,20.3,1);
INSERT INTO DOCENCIA VALUES (668,'2','P','G03','IGe',16,'AC2',5,12.3,1);
INSERT INTO DOCENCIA VALUES (669,'2','P','G03','MPr',27,'AC2',2,16.3,1);
INSERT INTO DOCENCIA VALUES (670,'2','P','G03','MPr',27,'AC2',2,17.3,1);
INSERT INTO DOCENCIA VALUES (671,'2','P','G03','Ofi',44,'AC4',3,10.3,2);
INSERT INTO DOCENCIA VALUES (672,'2','P','G03','Ofi',44,'AC4',3,11.3,2);
INSERT INTO DOCENCIA VALUES (675,'2','P','G04','EDa',51,'AC2',2,19.3,1);
INSERT INTO DOCENCIA VALUES (676,'2','P','G04','EDa',51,'AC2',2,20.3,1);
INSERT INTO DOCENCIA VALUES (677,'2','P','G04','Est',29,'AC3',3,19.3,1);
INSERT INTO DOCENCIA VALUES (678,'2','P','G04','IGe',16,'AC2',5,13.3,1);
INSERT INTO DOCENCIA VALUES (679,'2','P','G04','MPr',51,'AC2',2,19.3,1);
INSERT INTO DOCENCIA VALUES (680,'2','P','G04','MPr',51,'AC2',2,20.3,1);
INSERT INTO DOCENCIA VALUES (681,'2','P','G04','Ofi',44,'AC4',3,10.3,2);
INSERT INTO DOCENCIA VALUES (682,'2','P','G04','Ofi',44,'AC4',3,11.3,2);
INSERT INTO DOCENCIA VALUES (685,'2','P','G05','EDa',51,'AC2',3,12.3,1);
INSERT INTO DOCENCIA VALUES (686,'2','P','G05','EDa',51,'AC2',3,13.3,1);
INSERT INTO DOCENCIA VALUES (687,'2','P','G05','Est',29,'AC3',3,20.3,1);
INSERT INTO DOCENCIA VALUES (688,'2','P','G05','MPr',14,'AC2',3,12.3,1);
INSERT INTO DOCENCIA VALUES (689,'2','P','G05','MPr',14,'AC2',3,13.3,1);
INSERT INTO DOCENCIA VALUES (690,'2','P','G05','Ofi',25,'AC4',4,18.3,1);
INSERT INTO DOCENCIA VALUES (691,'2','P','G06','EDa',51,'AC2',3,18.3,1);
INSERT INTO DOCENCIA VALUES (692,'2','P','G06','EDa',51,'AC2',3,19.3,1);
INSERT INTO DOCENCIA VALUES (693,'2','P','G06','MPr',27,'AC2',3,18.3,1);
INSERT INTO DOCENCIA VALUES (694,'2','P','G06','MPr',27,'AC2',3,19.3,1);
INSERT INTO DOCENCIA VALUES (695,'2','P','G06','Ofi',25,'AC4',5,18.3,1);
INSERT INTO DOCENCIA VALUES (697,'3','T','-','DFC',30,'A21',1,9.3,1);

INSERT INTO DOCENCIA VALUES (698,'3','T','-','DFC',30,'A21',1,10.3,1);
INSERT INTO DOCENCIA VALUES (699,'3','T','-','IAr',40,'A21',1,11.3,1);
INSERT INTO DOCENCIA VALUES (700,'3','T','-','IAr',40,'A21',1,12.3,1);
INSERT INTO DOCENCIA VALUES (701,'3','T','-','IAr',40,'A21',2,11.3,1);
INSERT INTO DOCENCIA VALUES (702,'3','T','-','IAr',40,'A21',4,10.3,1);
INSERT INTO DOCENCIA VALUES (703,'3','T','-','ITe',7,'A21',2,19.3,1);
INSERT INTO DOCENCIA VALUES (704,'3','T','-','ITe',7,'A21',4,19.3,1);
INSERT INTO DOCENCIA VALUES (705,'3','T','-','ITe',7,'A21',4,20.3,1);
INSERT INTO DOCENCIA VALUES (706,'3','T','-','PLe',8,'A21',1,11.3,1);
INSERT INTO DOCENCIA VALUES (707,'3','T','-','PLe',8,'A21',1,12.3,1);
INSERT INTO DOCENCIA VALUES (708,'3','T','-','PLe',8,'A21',2,11.3,1);
INSERT INTO DOCENCIA VALUES (709,'3','T','-','PLe',8,'A21',4,10.3,1);
INSERT INTO DOCENCIA VALUES (710,'3','T','-','Red',33,'A21',3,12.3,1);
INSERT INTO DOCENCIA VALUES (711,'3','T','-','Red',33,'A21',4,13.3,1);
INSERT INTO DOCENCIA VALUES (712,'3','T','-','SDi',23,'A21',1,20.3,1);
INSERT INTO DOCENCIA VALUES (713,'3','T','-','SDi',23,'A21',2,18.3,1);
INSERT INTO DOCENCIA VALUES (714,'3','T','A','ANC',4,'A21',5,9.3,1);
INSERT INTO DOCENCIA VALUES (715,'3','T','A','ANC',4,'A21',5,10.3,1);
INSERT INTO DOCENCIA VALUES (716,'3','T','A','ANC',4,'B02',4,12.3,1);
INSERT INTO DOCENCIA VALUES (717,'3','T','A','BDa',44,'A21',2,12.3,1);
INSERT INTO DOCENCIA VALUES (718,'3','T','A','BDa',44,'A21',3,13.3,1);
INSERT INTO DOCENCIA VALUES (719,'3','T','A','BDa',44,'A21',4,11.3,1);
INSERT INTO DOCENCIA VALUES (720,'3','T','A','DES',10,'A21',2,10.3,1);
INSERT INTO DOCENCIA VALUES (721,'3','T','A','DES',10,'A21',3,10.3,1);
INSERT INTO DOCENCIA VALUES (722,'3','T','A','InP',26,'A11',3,18.3,1);
INSERT INTO DOCENCIA VALUES (723,'3','T','A','InP',26,'A11',5,18.3,1);
INSERT INTO DOCENCIA VALUES (724,'3','T','A','PSe',42,'A21',4,9.3,1);
INSERT INTO DOCENCIA VALUES (725,'3','T','A','PSe',42,'B02',2,13.3,1);
INSERT INTO DOCENCIA VALUES (726,'3','T','A','Rob',12,'A21',3,11.3,1);
INSERT INTO DOCENCIA VALUES (727,'3','T','A','Rob',12,'A21',5,11.3,1);
INSERT INTO DOCENCIA VALUES (728,'3','T','A','SOp',18,'A21',1,13.3,1);
INSERT INTO DOCENCIA VALUES (729,'3','T','A','SOp',18,'A21',2,9.3,1);
INSERT INTO DOCENCIA VALUES (730,'3','T','A','SOp',18,'A21',3,9.3,1);
INSERT INTO DOCENCIA VALUES (731,'3','T','B','AGE',6,'A21',4,18.3,1);
INSERT INTO DOCENCIA VALUES (732,'3','T','B','AGE',6,'A21',5,18.3,1);
INSERT INTO DOCENCIA VALUES (733,'3','T','B','BDa',36,'A21',1,17.3,1);

INSERT INTO DOCENCIA VALUES (734,'3','T','B','BDa',36,'A21',2,16.3,1);
INSERT INTO DOCENCIA VALUES (735,'3','T','B','BDa',36,'A21',2,17.3,1);
INSERT INTO DOCENCIA VALUES (736,'3','T','B','DES',10,'A21',3,18.3,1);
INSERT INTO DOCENCIA VALUES (737,'3','T','B','DES',10,'A21',4,17.3,1);
INSERT INTO DOCENCIA VALUES (738,'3','T','B','InP',26,'A21',4,16.3,1);
INSERT INTO DOCENCIA VALUES (739,'3','T','B','InP',26,'A21',5,17.3,1);
INSERT INTO DOCENCIA VALUES (740,'3','T','B','SOp',18,'A21',1,18.3,1);
INSERT INTO DOCENCIA VALUES (741,'3','T','B','SOp',18,'A21',3,16.3,1);
INSERT INTO DOCENCIA VALUES (742,'3','T','B','SOp',18,'A21',3,17.3,1);
INSERT INTO DOCENCIA VALUES (743,'3','P','G01','AGE',15,'AC2',3,9.3,1);
INSERT INTO DOCENCIA VALUES (744,'3','P','G01','BDa',36,'AC4',1,18.3,2);
INSERT INTO DOCENCIA VALUES (745,'3','P','G01','BDa',36,'AC4',1,19.3,2);
INSERT INTO DOCENCIA VALUES (746,'3','P','G01','DES',10,'AC4',2,12.3,2);
INSERT INTO DOCENCIA VALUES (747,'3','P','G01','DES',10,'AC4',2,13.3,2);
INSERT INTO DOCENCIA VALUES (748,'3','P','G01','DFC',30,'AC4',2,16.3,2);
INSERT INTO DOCENCIA VALUES (749,'3','P','G01','DFC',30,'AC4',2,17.3,2);
INSERT INTO DOCENCIA VALUES (750,'3','P','G01','IAr',40,'AC3',3,10.3,1);
INSERT INTO DOCENCIA VALUES (751,'3','P','G01','IAr',40,'AC3',3,11.3,1);
INSERT INTO DOCENCIA VALUES (752,'3','P','G01','InP',26,'AC4',3,13.3,1);
INSERT INTO DOCENCIA VALUES (753,'3','P','G01','PLe',8,'AC1',3,10.3,1);
INSERT INTO DOCENCIA VALUES (754,'3','P','G01','PLe',8,'AC1',3,11.3,1);
INSERT INTO DOCENCIA VALUES (755,'3','P','G01','PSe',42,'LS2',2,11.3,1);
INSERT INTO DOCENCIA VALUES (757,'3','P','G01','Red',21,'LS2',4,16.3,2);
INSERT INTO DOCENCIA VALUES (758,'3','P','G01','Red',21,'LS2',4,17.3,2);
INSERT INTO DOCENCIA VALUES (759,'3','P','G01','Rob',12,'LS2',4,18.3,2);
INSERT INTO DOCENCIA VALUES (760,'3','P','G01','Rob',12,'LS2',4,19.3,2);
INSERT INTO DOCENCIA VALUES (761,'3','P','G02','SDi',23,'AC3',2,19.3,2);
INSERT INTO DOCENCIA VALUES (762,'3','P','G02','SDi',23,'AC3',2,20.3,2);
INSERT INTO DOCENCIA VALUES (763,'3','P','G01','SOp',27,'AC4',1,16.3,2);
INSERT INTO DOCENCIA VALUES (764,'3','P','G01','SOp',27,'AC4',1,17.3,2);
INSERT INTO DOCENCIA VALUES (765,'3','P','G02','AGE',6,'AC2',3,10.3,1);
INSERT INTO DOCENCIA VALUES (766,'3','P','G02','BDa',36,'AC4',1,18.3,2);
INSERT INTO DOCENCIA VALUES (767,'3','P','G02','BDa',36,'AC4',1,19.3,2);
INSERT INTO DOCENCIA VALUES (768,'3','P','G02','DES',10,'AC4',2,12.3,2);
INSERT INTO DOCENCIA VALUES (769,'3','P','G02','DES',10,'AC4',2,13.3,2);
INSERT INTO DOCENCIA VALUES (770,'3','P','G02','DFC',30,'AC4',2,16.3,2);
INSERT INTO DOCENCIA VALUES (771,'3','P','G02','DFC',30,'AC4',2,17.3,2);

INSERT INTO DOCENCIA VALUES (772,'3','P','G02','IAr',40,'AC3',3,16.3,1);
INSERT INTO DOCENCIA VALUES (773,'3','P','G02','IAr',40,'AC3',3,17.3,1);
INSERT INTO DOCENCIA VALUES (774,'3','P','G02','InP',26,'AC4',4,10.3,1);
INSERT INTO DOCENCIA VALUES (775,'3','P','G02','PLe',8,'AC4',3,16.3,1);
INSERT INTO DOCENCIA VALUES (776,'3','P','G02','PLe',8,'AC4',3,17.3,1);
INSERT INTO DOCENCIA VALUES (777,'3','P','G02','Red',21,'LS2',4,16.3,2);
INSERT INTO DOCENCIA VALUES (778,'3','P','G02','Red',21,'LS2',4,17.3,2);
INSERT INTO DOCENCIA VALUES (779,'3','P','G02','Rob',12,'LS2',4,18.3,2);
INSERT INTO DOCENCIA VALUES (780,'3','P','G02','Rob',12,'LS2',4,19.3,2);
INSERT INTO DOCENCIA VALUES (781,'3','P','G03','SDi',23,'AC3',2,19.3,2);
INSERT INTO DOCENCIA VALUES (782,'3','P','G03','SDi',23,'AC3',2,20.3,2);
INSERT INTO DOCENCIA VALUES (783,'3','P','G02','SOp',27,'AC4',1,16.3,2);
INSERT INTO DOCENCIA VALUES (784,'3','P','G02','SOp',27,'AC4',1,17.3,2);
INSERT INTO DOCENCIA VALUES (785,'3','P','G03','AGE',6,'AC2',3,11.3,1);
INSERT INTO DOCENCIA VALUES (786,'3','P','G03','BDa',36,'AC4',4,11.3,2);
INSERT INTO DOCENCIA VALUES (787,'3','P','G03','BDa',36,'AC4',4,12.3,2);
INSERT INTO DOCENCIA VALUES (788,'3','P','G03','DES',10,'AC4',3,19.3,2);
INSERT INTO DOCENCIA VALUES (789,'3','P','G03','DES',10,'AC4',3,20.3,2);
INSERT INTO DOCENCIA VALUES (790,'3','P','G03','DFC',52,'AC4',5,9.3,2);
INSERT INTO DOCENCIA VALUES (791,'3','P','G03','DFC',52,'AC4',5,10.3,2);
INSERT INTO DOCENCIA VALUES (792,'3','P','G03','InP',26,'AC4',4,19.3,1);
INSERT INTO DOCENCIA VALUES (793,'3','P','G03','Red',33,'LS2',5,12.3,2);
INSERT INTO DOCENCIA VALUES (794,'3','P','G03','Red',33,'LS2',5,13.3,2);
INSERT INTO DOCENCIA VALUES (795,'3','P','G03','SOp',18,'AC1',2,12.3,2);
INSERT INTO DOCENCIA VALUES (796,'3','P','G03','SOp',18,'AC1',2,13.3,2);
INSERT INTO DOCENCIA VALUES (797,'3','P','G04','BDa',36,'AC4',4,11.3,2);
INSERT INTO DOCENCIA VALUES (798,'3','P','G04','BDa',36,'AC4',4,12.3,2);
INSERT INTO DOCENCIA VALUES (799,'3','P','G04','DES',10,'AC4',3,19.3,2);
INSERT INTO DOCENCIA VALUES (800,'3','P','G04','DES',10,'AC4',3,20.3,2);
INSERT INTO DOCENCIA VALUES (801,'3','P','G04','DFC',52,'AC4',5,9.3,2);
INSERT INTO DOCENCIA VALUES (802,'3','P','G04','DFC',52,'AC4',5,10.3,2);




INSERT INTO DOCENCIA VALUES (803,'3','P','G04','InP',26,'AC4',5,11.3,1);
INSERT INTO DOCENCIA VALUES (804,'3','P','G04','Red',33,'LS2',5,12.3,2);
INSERT INTO DOCENCIA VALUES (805,'3','P','G04','Red',33,'LS2',5,13.3,2);
INSERT INTO DOCENCIA VALUES (806,'3','P','G04','SOp',18,'AC1',2,12.3,2);
INSERT INTO DOCENCIA VALUES (807,'3','P','G04','SOp',18,'AC1',2,13.3,2);
INSERT INTO DOCENCIA VALUES (808,'3','P','G05','BDa',36,'AC4',4,16.3,2);
INSERT INTO DOCENCIA VALUES (809,'3','P','G05','BDa',36,'AC4',4,17.3,2);
INSERT INTO DOCENCIA VALUES (810,'3','P','G05','DES',10,'AC4',4,9.3,1);
INSERT INTO DOCENCIA VALUES (811,'3','P','G05','DFC',52,'AC4',5,12.3,2);
INSERT INTO DOCENCIA VALUES (812,'3','P','G05','DFC',52,'AC4',5,13.3,2);
INSERT INTO DOCENCIA VALUES (813,'3','P','G05','InP',26,'AC4',5,19.3,1);
INSERT INTO DOCENCIA VALUES (814,'3','P','G05','Red',21,'LS2',5,16.3,2);
INSERT INTO DOCENCIA VALUES (815,'3','P','G05','Red',21,'LS2',5,17.3,2);
INSERT INTO DOCENCIA VALUES (822,'3','P','G01','SDi',23,'AC3',1,19.3,1);
INSERT INTO DOCENCIA VALUES (823,'3','P','G02','PSe',42,'LS2',3,19.3,2);
INSERT INTO DOCENCIA VALUES (824,'3','P','G02','PSe',42,'LS2',3,20.3,2);
INSERT INTO DOCENCIA VALUES (826,'3','P','G05','SOp',40,'AC1',2,16.3,2);
INSERT INTO DOCENCIA VALUES (827,'3','P','G05','SOp',40,'AC1',2,17.3,2);

INSERT INTO DOCENCIA VALUES (829,'1','P','G01','TCo-S',53,'LS1',1,16.3,1);

INSERT INTO DOCENCIA VALUES (830,'1','P','G01','TCo-S',53,'LS1',1,17.3,1);
INSERT INTO DOCENCIA VALUES (831,'2','P','G01','ACo',53,'LS2',2,16.3,2);
INSERT INTO DOCENCIA VALUES (832,'2','P','G01','ACo',53,'LS2',2,17.3,2);
INSERT INTO DOCENCIA VALUES (833,'2','P','G02','ACo',53,'LS2',2,16.3,2);
INSERT INTO DOCENCIA VALUES (834,'2','P','G02','ACo',53,'LS2',2,17.3,2);
INSERT INTO DOCENCIA VALUES (835,'1','P','G03','TCo-S',53,'LS1',2,18.3,1);
INSERT INTO DOCENCIA VALUES (836,'1','P','G03','TCo-S',53,'LS1',2,19.3,1);
INSERT INTO DOCENCIA VALUES (837,'2','P','G03','ACo',53,'LS2',3,18.3,2);
INSERT INTO DOCENCIA VALUES (838,'2','P','G03','ACo',53,'LS2',3,19.3,2);
INSERT INTO DOCENCIA VALUES (839,'2','P','G04','ACo',4,'AC2',4,17.3,2);
INSERT INTO DOCENCIA VALUES (840,'2','P','G04','ACo',4,'AC2',4,18.3,2);
INSERT INTO DOCENCIA VALUES (841,'2','T','A','Ofi',54,'A21',5,16.3,1);
INSERT INTO DOCENCIA VALUES (842,'2','T','A','Ofi',54,'A21',5,17.3,1);

commit;


