REM Carga de datos en BD Compras 

REM Datos de los artículos

INSERT INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES ('0001','MESA OFICINA 90x1,80',225,100,1);
INSERT INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES ('0002','SILLA ERGONOMIC MOD. MX',120,25,1);
INSERT INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES  ('0003','ARMARIO DIPLOMATIC',300,2,1);
INSERT INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES ('0004','ARCHIVADOR MOD. TR',180,3,1);
--- Para insertar varias filas a la vez:----
-- INSERT ALL 
-- INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES ('0001','MESA OFICINA 90x1,80',225,100,1);
-- INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES ('0002','SILLA ERGONOMIC MOD. MX',120,25,1);
-- INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES  ('0003','ARMARIO DIPLOMATIC',300,2,1);
-- INTO articulos (codigart , descrart,preunart , stockart,stockmin ) VALUES ('0004','ARCHIVADOR MOD. TR',180,3,1);
 
REM Datos de los proveedores

INSERT INTO  proveedores  ( codigpro , cifpro , nombrpro , direcpro , cpostpro ,  localpro  , faxpro ,telefpro, emailpro , procepro ) VALUES  ('P001','A39184215','Lesma Ruiz, Pablo','Mayor 3, 2º','31004','Pamplona','(34) 948 223 344','(34) 948 223 345','mailto:lesma@unavarra.es','UE');
INSERT INTO  proveedores  ( codigpro , cifpro , nombrpro , direcpro , cpostpro ,  localpro  , faxpro ,telefpro, emailpro , procepro ) VALUES  ('P002','A48162311','Zurutuza Gomez, Kepa','Abasolo 22, 1º','48002','Bilbao','(34) 94 865 434','(34) 94 865 413','mailto:zurutuza@yahoo.es','UE');
INSERT INTO  proveedores  ( codigpro , cifpro , nombrpro , direcpro , cpostpro ,  localpro  , faxpro ,telefpro, emailpro , procepro ) VALUES ('P003','B28373212','Agirre Sanz, Ane','Urbieta 14, 5º dcha.','20011','Donosti','(34) 943 677 889','(34) 943 677 829',NULL,'UE');
INSERT INTO  proveedores  ( codigpro , cifpro , nombrpro , direcpro , cpostpro ,  localpro  , faxpro ,telefpro, emailpro , procepro ) VALUES  ('P004','B85392314','Gil Perez, Jon','Uría 18, 2º','01008','Vitoria','(34) 945 345 678','(34) 945 345 6632',NULL,'UE');

REM Datos de los proveedores
INSERT INTO  pedidos  ( numped , codigpro , fechaped , ivaped , fentrped ) VALUES (1,'P001','22-05-2020',18,'16-06-2020');
INSERT INTO  pedidos  ( numped , codigpro , fechaped , ivaped , fentrped ) VALUES (2,'P002','10-06-2020',18,'15-08-2020');
INSERT INTO  pedidos  ( numped , codigpro , fechaped , ivaped , fentrped ) VALUES (3,'P003','15-10-2020',18,'15-12-2020');
INSERT INTO  pedidos  ( numped , codigpro , fechaped , ivaped , fentrped ) VALUES(4,'P001','13-08-2020',18,'10-09-2020');
 
REM Datos de las lineas de cada uno de los pedidos
 
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES (1,1,'0001',1,220,0);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES  (1,2,'0003',2,295,0);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES  (2,1,'0002',3,120,2);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES (2,2,'0003',2,300,3);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES (2,3,'0002',5,120,0);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES (3,1,'0002',1,110,0);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES (4,1,'0002',4,120,0);
INSERT INTO  lineas  ( numped , numlin , codigart , unilin , preunlin , desculin ) VALUES (4,2,'0004',10,180,0);
commit;