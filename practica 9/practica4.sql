prompt CREO LAS TABLAS
@CreaTablasFacturas

prompt ___________________________________________________________
prompt EJERCICIO 2
prompt APARTADO A
ALTER TABLE facturas ADD
(CONSTRAINT menorDto20YPositivo check (dto <= 20 and dto >= 0));

prompt ___________________________________________________________
prompt APARTADO B
ALTER TABLE facturas DROP CONSTRAINT CH_IVA;
ALTER TABLE facturas ADD
(CONSTRAINT IVAEntreValores check (iva in (0,4,7,16)));

prompt ___________________________________________________________
prompt APARTADO C
ALTER TABLE articulos ADD
(CONSTRAINT UniqueDescripcion unique (descrip));

prompt ___________________________________________________________
prompt EJERCICIO 3
prompt APARTADO A
ALTER TABLE pueblos DROP CONSTRAINT FK_PUE_PRO;
ALTER TABLE pueblos ADD
(CONSTRAINT FK_PUE_PRO foreign key (codpro) references provincias (codpro) on delete set null);

prompt ___________________________________________________________
prompt APARTADO B
ALTER TABLE clientes DROP CONSTRAINT FK_CLI_PUE;
ALTER TABLE clientes ADD
(CONSTRAINT FK_CLI_PUE foreign key (CODPUE) references pueblos (CODPUE) on delete set null);

prompt ___________________________________________________________
prompt APARTADO C
ALTER TABLE lineas_fac DROP CONSTRAINT fk_lin_fac;
ALTER TABLE lineas_fac ADD (CONSTRAINT fk_lin_fac FOREIGN KEY (codfac) REFERENCES facturas ON DELETE CASCADE);
ALTER TABLE facturas DROP CONSTRAINT FK_FAC_CLI;
ALTER TABLE facturas ADD
(CONSTRAINT FK_FAC_CLI foreign key (CODCLI) references clientes (CODCLI) on delete cascade);

prompt ___________________________________________________________
prompt APARTADO D
ALTER TABLE lineas_fac DROP CONSTRAINT FK_LIN_ART;
ALTER TABLE lineas_fac ADD
(CONSTRAINT FK_LIN_ART foreign key (CODART) references articulos (CODART) on delete set null);

prompt ___________________________________________________________
prompt EJERCICIO 4
prompt PUEBLO LA TABLA PROVINCIAS
@provincias

prompt ___________________________________________________________
prompt PUEBLO LA TABLA PUEBLOS
@pueblos

prompt ___________________________________________________________
prompt PUEBLO LA TABLA CLIENTES
@clientes

prompt ___________________________________________________________
prompt PUEBLO LA TABLA FACTURAS
ALTER TABLE facturas MODIFY CONSTRAINT MENORDTO20YPOSITIVO DISABLE;
@facturas


prompt ___________________________________________________________
prompt PUEBLO LA TABLA ARTICULOS
ALTER TABLE articulos MODIFY CONSTRAINT UNIQUEDESCRIPCION DISABLE;
@articulos


prompt ___________________________________________________________
prompt PUEBLO LA TABLA LINEAS FACTURAS
ALTER TABLE lineas_fac MODIFY CONSTRAINT FK_LIN_ART DISABLE;
@lineas_fac

prompt ___________________________________________________________
prompt EJERCICIO 5
CREATE TABLE duplicados AS (select codart,descrip,precio
                            from articulos
                            where descrip in (select descrip
                                                from articulos
                                                group by descrip
                                                having count(descrip) > 1));
select *
from (select descrip, max(precio)
        from duplicados d
        group by descrip
        order by descrip) maximosDuplicados