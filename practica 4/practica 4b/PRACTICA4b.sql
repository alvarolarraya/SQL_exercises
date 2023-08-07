CREATE TABLE CLIENTE 
(
    CODCLI NUMBER(10),
    NOMBRE VARCHAR(100) NOT NULL,
    DIRECCION VARCHAR(100) NOT NULL,
    TELEFONO NUMBER(9) NOT NULL,
    TIPOCLI VARCHAR(1) NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (CODCLI),
    CONSTRAINT TIPOCLI_ENTRE_TERMINOS CHECK (TIPOCLI IN ('E','B','N')),
)
CREATE TABLE ORDEN
(
    COD NUMBER(10),
    FORMA_PAGO DATE NOT NULL,
    FECHA_PETICION DATE NOT NULL,
    FECHA_ENV VARCHAR(1),
    CONSTRAINT PK_ORDEN PRIMARY KEY (COD),
    CONSTRAINT FORMA_PAGO_TERMINOS FORMA_PAGO IN ('A','C','G'),
    CONSTRAINT FECHA_ENV_MAYOR_PETICION CHECK (FECHA_ENV > FECHA_PETICION)
)
CREATE TABLE PETICION_ORDEN
(
    CODCLI NUMBER(10),
    COD_ORDEN NUMBER(10),
    CONSTRAINT FK_CODCLI_PETICION_ORDEN FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI),
    CONSTRAINT FK_COD_ORDEN_PETICION_ORDEN FOREIGN KEY (COD_ORDEN) REFERENCES ORDEN (COD),
    CONSTRAINT PK_PETICION_ORDEN PRIMARY KEY (COD_ORDEN,CODCLI)
)
CREATE TABLE COLOR
(
    RAL NUMBER(5),
    RED NUMBER(5),
    GREEN NUMBER(5),
    BLUE NUMBER(5),
    CONSTRAINT PK_COLOR_RAL PRIMARY KEY (RAL)
)
CREATE TABLE CONTIENE
(
    FECH_ENV DATE,
    UNIDADES NUMBER(3),
    UNIDADES_MANDADAS(4),
    COD_ORDEN NUMBER(10),
    RAL NUMBER(5),
    CODART VARCHAR(100),
    CONSTRAINT PK_CONTIENE PRIMARY KEY (CODART,RAL,COD_ORDEN),
    CONSTRAINT FK_CONTIENE_ORDEN FOREIGN KEY (COD_ORDEN) REFERENCES ORDEN (COD),
    CONSTRAINT FK_CONTIENE_ARTICULO FOREIGN KEY (CODART) REFERENCES ARTICULO (CODART),
    CONSTRAINT FK_CONTIENE_COLOR FOREIGN KEY (RAL) REFERENCES COLOR (RAL)
)
CREATE TABLE ARTICULO
(
    CODART VARCHAR(100),
    DESCRIP VARCHAR(100),
    STOCK NUMBER(5),
    CONSTRAINT PK_ARTICULO PRIMARY KEY (CODART)
)
CREATE TABLE PRODUCE
(
    FECHA DATE,
    UNIDADES_OK NUMBER(5),
    UNIDADES_NOK NUMBER(5),
    TIEMPO NUMBER(5),
    CODART VARCHAR(100),
    COD_MAQUINA NUMBER(10),
    CONSTRAINT PK_PRODUCE PRIMARY KEY (FECHA,CODART,COD_MAQUINA),
    CONSTRAINT FK_PRODUCE_ARTICULO FOREIGN KEY (CODART) REFERENCES ARTICULO (CODART),
    CONSTRAINT FK_PRODUCE_MAQUINA FOREIGN KEY (COD_MAQUINA) REFERENCES MAQUINA (COD_MAQUINA)
)
CREATE TABLE MAQUINA
(
    COD NUMBER(10),
    DESCRIPCION VARCHAR(100),
    SITUACION VARCHAR(30),
)