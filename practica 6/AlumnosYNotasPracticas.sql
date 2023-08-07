/* Supuesto: Alumnos y notas de prácticas */

create table Alumno
( DNI    	varchar2(8),
  Nombre  	varchar2(45) not null,
  Apellido1   varchar2(45) not null,
  Apellido2 varchar2(45),
constraint pk_Alumnoe primary key (DNI)
);

create table Practica
( idPractica number(1),
  Descripcion  	 varchar2(45) not null,
  constraint pk_Practica primary key (idPractica)
);

create table Nota
( DNI    	varchar2(8),
  idPractica number(1),
  Notas number(2) not null,
constraint pk_Nota primary key (DNI,idPractica),
constraint fk_Alumno foreign key (DNI) references Alumno (DNI),
constraint fk_Practica foreign key (idPractica) references Practica (idPractica)
);

INSERT INTO Alumno VALUES(59366717, 'Pepe', 'GARCIA', 'JIMENEZ');
INSERT INTO Alumno VALUES(23166344, 'Juan', 'GONZALEZ', 'RUIZ');
INSERT INTO Alumno VALUES(85555114, 'Francisco', 'RODRIGUEZ', 'HERNANDEZ');

INSERT INTO Practica VALUES(1, 'Lenguaje de Modelado de Datos I');
INSERT INTO Practica VALUES(2, 'Lenguaje de Definición de Datos I');
INSERT INTO Practica VALUES(3, 'Lenguaje de Modelado de Datos II');
INSERT INTO Practica VALUES(4, 'Lenguaje de Definición de Datos II');
INSERT INTO Practica VALUES(5, 'Práctica Final');

INSERT INTO Nota VALUES(59366717, 1, 7);
INSERT INTO Nota VALUES(23166344, 1, 10);
INSERT INTO Nota VALUES(85555114, 1, 3);
INSERT INTO Nota VALUES(59366717, 2, 4);
INSERT INTO Nota VALUES(23166344, 2, 9);
INSERT INTO Nota VALUES(85555114, 2, 4);
INSERT INTO Nota VALUES(59366717, 3, 7);
INSERT INTO Nota VALUES(23166344, 3, 7);
INSERT INTO Nota VALUES(85555114, 3, 9);
INSERT INTO Nota VALUES(59366717, 4, 7);
INSERT INTO Nota VALUES(23166344, 4, 8);
INSERT INTO Nota VALUES(85555114, 4, 8);
INSERT INTO Nota VALUES(59366717, 5, 3);
INSERT INTO Nota VALUES(23166344, 5, 7);
INSERT INTO Nota VALUES(85555114, 5, 5);