CREATE TABLE equipo ( 
 nomequipo    VARCHAR(20), 
 director     VARCHAR(35), 
 CONSTRAINT pk_equipo PRIMARY KEY ( nomequipo )
);

CREATE TABLE ciclista ( 
 dorsal       NUMBER, 
 nombre       VARCHAR(35), 
 edad         NUMBER, 
 nomequipo    VARCHAR(20),
 CONSTRAINT PK_ciclista PRIMARY KEY (dorsal),
 CONSTRAINT FK_cicl_equipo FOREIGN KEY (nomequipo) REFERENCES equipo ON DELETE CASCADE,
 CONSTRAINT ch_edad CHECK(edad BETWEEN 0 AND 65)
);

CREATE TABLE etapa (  
 numetapa     NUMBER, 
 kms          NUMBER NOT NULL, 
 salida       VARCHAR(40), 
 llegada      VARCHAR(40), 
 dorsal       NUMBER, 
 CONSTRAINT pk_etapa PRIMARY KEY ( numetapa ),
 CONSTRAINT FK_etapa_cicl FOREIGN KEY (dorsal) REFERENCES ciclista ON DELETE SET NULL
);

CREATE TABLE puerto (  
 nompuerto    VARCHAR(35), 
 altura       NUMBER, 
 categoria    VARCHAR(1), 
 pendiente    REAL, 
 numetapa     NUMBER,
 dorsal       NUMBER,
 CONSTRAINT PK_puerto PRIMARY KEY (nompuerto),
 CONSTRAINT FK_puerto_cicl FOREIGN KEY (dorsal) REFERENCES ciclista ON DELETE SET NULL,
 CONSTRAINT FK_puerto_etapa FOREIGN KEY (numetapa) REFERENCES etapa ON DELETE CASCADE,
 CONSTRAINT ch_puerto_pos CHECK (altura>0),
 CONSTRAINT ch_categoria CHECK(categoria IN ('E', '1', '2', '3'))
 );

CREATE TABLE maillot (  
 codigo       VARCHAR(3), 
 tipo         VARCHAR(20), 
 color        VARCHAR(20), 
 premio       NUMBER, 
 CONSTRAINT pk_maillot PRIMARY KEY ( codigo )
);

CREATE TABLE lleva (  
 dorsal       NUMBER,
 numetapa     NUMBER, 
 codigo       VARCHAR(3), 
 CONSTRAINT pk_lleva PRIMARY KEY ( codigo, numetapa ),
 CONSTRAINT fk_lleva_maillot FOREIGN KEY ( codigo ) REFERENCES maillot ON DELETE CASCADE,
 CONSTRAINT FK_lleva_cicl FOREIGN KEY (dorsal) REFERENCES ciclista ON DELETE SET NULL,
 CONSTRAINT FK_lleva_etapa FOREIGN KEY (numetapa) REFERENCES etapa ON DELETE CASCADE
);
