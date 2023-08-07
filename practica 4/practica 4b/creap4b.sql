CREATE TABLE ARTICULO(
    CODART     VARCHAR2(4),
    DESCRIP    VARCHAR2(35)    NOT NULL,
    STOCK      NUMBER(4, 0)    NOT NULL,
    CONSTRAINT PK_ARTICULO PRIMARY KEY (CODART)
);

CREATE TABLE CLIENTE(
    CODCLI       VARCHAR2(3),
    NOMBRE       VARCHAR2(25)    NOT NULL,
    DIRECCION    VARCHAR2(40)    NOT NULL,
    TELEFONO     VARCHAR2(15)    NOT NULL,
    TIPOCLI      VARCHAR2(1)     NOT NULL,
    CONSTRAINT CH_TIPO CHECK (TIPOCLI IN ('E','B', 'N')),
    CONSTRAINT PK_CLIENTE PRIMARY KEY (CODCLI)
);

CREATE TABLE COLOR(
    RAL      NUMBER(5, 0),
    RED      NUMBER(3, 0)    NOT NULL,
    GREEN    NUMBER(3, 0)    NOT NULL,
    BLUE     NUMBER(3, 0)    NOT NULL,
    CONSTRAINT CH_BLUE CHECK (BLUE BETWEEN 0 AND 255),
    CONSTRAINT CH_RED CHECK (RED BETWEEN 0 AND 255),
    CONSTRAINT CH_GREEN CHECK (GREEN BETWEEN 0 AND 255),
    CONSTRAINT PK_COLOR PRIMARY KEY (RAL)
);

CREATE TABLE ORDEN(
    COD          VARCHAR2(4),
    FPAGO        VARCHAR2(1)    NOT NULL,
    FECHA        DATE           NOT NULL,
    FECHA_ENV    DATE           NOT NULL,
    CODCLI       VARCHAR2(3)    NOT NULL,
    CONSTRAINT CH_FPAGO CHECK (FPAGO IN ('A','C','G')),
    CONSTRAINT CH_FECHA_ENV CHECK (FECHA_ENV > FECHA),
    CONSTRAINT PK_ORDEN PRIMARY KEY (COD), 
    CONSTRAINT FK_ORDEN_CLI FOREIGN KEY (CODCLI)
    REFERENCES CLIENTE(CODCLI)
);

CREATE TABLE CONTIENE(
    COD         VARCHAR2(4),
    CODART      VARCHAR2(4),
    RAL         NUMBER(5, 0),
    UDS         NUMBER(3, 0)    NOT NULL,
    UDS_OUT     NUMBER(3, 0),
    FECH_ENV    DATE,
    CONSTRAINT CH_UDS CHECK (UDS>0),
    CONSTRAINT PK_CONTIENE PRIMARY KEY (COD, CODART, RAL), 
    CONSTRAINT FK_CONT_ORDEN FOREIGN KEY (COD)
    REFERENCES ORDEN(COD),
    CONSTRAINT FK_CONT_ART FOREIGN KEY (CODART)
    REFERENCES ARTICULO(CODART),
    CONSTRAINT FK_CONT_COLOR FOREIGN KEY (RAL)
    REFERENCES COLOR(RAL)
);

CREATE TABLE MAQUINA(
    COD          NUMBER(3, 0),
    DESCRIP      VARCHAR2(25)    NOT NULL,
    SITUACION    VARCHAR2(20)    NOT NULL,
    CONSTRAINT PK_MAQUINA PRIMARY KEY (COD)
);

CREATE TABLE PRODUCE(
    CODART       VARCHAR2(4),
    COD          NUMBER(3, 0),
    FECHA        DATE,
    UDS_OK       NUMBER(4, 0)    NOT NULL,
    UDS_NO_OK    NUMBER(4, 0)    NOT NULL,
    TIEMPO       NUMBER(4, 0),
    CONSTRAINT CH_UDS_OK CHECK (UDS_OK>=0),
    CONSTRAINT CH_UDS_NO_OK CHECK (UDS_NO_OK>=0),
    CONSTRAINT PK_PRODUCE PRIMARY KEY (CODART, COD, FECHA), 
    CONSTRAINT FK_PROD_ART FOREIGN KEY (CODART)
    REFERENCES ARTICULO(CODART),
    CONSTRAINT FK_PROD_MAQ FOREIGN KEY (COD)
    REFERENCES MAQUINA(COD)
);