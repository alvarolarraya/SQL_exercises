CREATE TABLE Proveedores (
  codigpro	  CHAR(4)    NOT NULL    CONSTRAINT id_pro PRIMARY KEY,
  cifpro      CHAR(12)   NOT NULL    CONSTRAINT u_cif UNIQUE,
  nombrpro    CHAR(30)   NOT NULL,
  direcpro	  CHAR(30)   NOT NULL,
  cpostpro	  CHAR(5)	 NOT NULL,
  localpro	  CHAR(20)   NOT NULL,
  telefpro	  CHAR(17)   NOT NULL,
  faxpro	  CHAR(17),
  emailpro    CHAR(25),   
  procepro	  CHAR(5)  NOT NULL CHECK (procepro in ('UE', 'No UE')));


CREATE TABLE Articulos (
	codigart	CHAR(6)  NOT NULL    CONSTRAINT id_art PRIMARY KEY,
	descrart	CHAR(40) NOT NULL,
	preunart	NUMBER(9,2)	 NOT NULL,
	stockart	NUMBER(10)  NOT NULL check (stockart >=0),
	stockmin	NUMBER(10)  NOT NULL check (stockmin >=0),
    fecbaja     DATE);


CREATE TABLE Pedidos (
	numped 		NUMBER(5)   	 NOT NULL   CONSTRAINT id_ped PRIMARY KEY,
	fechaped	DATE	     DEFAULT SYSDATE NOT NULL,
	codigpro	CHAR(4)	  	 NOT NULL,
	ivaped		NUMBER(4,1) NOT NULL CHECK (ivaped>0 and ivaped<100),
	fentrped	DATE		 NOT NULL,
           CONSTRAINT f_pro FOREIGN KEY (codigpro) REFERENCES Proveedores (codigpro),
           CONSTRAINT c_fecha CHECK (fechaped<=fentrped));


CREATE INDEX FK_prop  ON Pedidos (codigpro);


CREATE TABLE Lineas (
	numped		NUMBER(5)		 NOT NULL,
	numlin		NUMBER(3)	 NOT NULL,
	codigart	CHAR(6)		 NOT NULL,
	unilin		NUMBER(6) NOT NULL,
	preunlin	NUMBER(9,2) NOT NULL,
	desculin	NUMBER(4,1) NOT NULL CHECK (desculin>=0 and desculin<=100),
          CONSTRAINT id_lin PRIMARY KEY (numped, numlin),
          CONSTRAINT f_ped FOREIGN KEY (numped) REFERENCES Pedidos (numped) on delete cascade,
          CONSTRAINT f_art FOREIGN KEY (codigart) REFERENCES Articulos (codigart));

CREATE INDEX FK_LineasArt  ON Lineas (codigart);

CREATE INDEX FK_LineasPed  ON Lineas (numped);


