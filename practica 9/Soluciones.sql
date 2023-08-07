--1--
@CreaTablasFacturas

--2--
--a
ALTER TABLE facturas ADD (CONSTRAINT ch_descuento CHECK (dto BETWEEN 0 AND 20));
--b
ALTER TABLE facturas DROP CONSTRAINT ch_iva;
ALTER TABLE facturas ADD (CONSTRAINT ch_iva CHECK (iva IN (0,4,8,18)));
--c
ALTER TABLE articulos ADD (CONSTRAINT art_descrip_unico UNIQUE (descrip));


--3--
--a
ALTER TABLE pueblos DROP CONSTRAINT fk_pue_pro; 
ALTER TABLE pueblos ADD (CONSTRAINT fk_pue_pro FOREIGN KEY (codpro) REFERENCES provincias ON DELETE SET NULL);
--b
ALTER TABLE clientes DROP CONSTRAINT fk_cli_pue; 
ALTER TABLE clientes ADD (CONSTRAINT fk_cli_pue FOREIGN KEY (codpue) REFERENCES pueblos ON DELETE SET NULL);
--c
ALTER TABLE lineas_fac DROP CONSTRAINT fk_lin_fac;
ALTER TABLE lineas_fac ADD (CONSTRAINT fk_lin_fac FOREIGN KEY (codfac) REFERENCES facturas ON DELETE CASCADE);

ALTER TABLE facturas DROP CONSTRAINT fk_fac_cli;
ALTER TABLE facturas ADD (CONSTRAINT fk_fac_cli FOREIGN KEY (codcli) REFERENCES clientes ON DELETE CASCADE);
--d
ALTER TABLE lineas_fac DROP CONSTRAINT fk_lin_art;
ALTER TABLE lineas_fac ADD (CONSTRAINT fk_lin_art FOREIGN KEY (codart) REFERENCES articulos ON DELETE SET NULL);

--4--
-- INSERT INTO provincias (SELECT * FROM facturas.provincias);
@provincias;

-- INSERT INTO pueblos (SELECT * FROM facturas.pueblos);
@pueblos;

-- INSERT INTO clientes (SELECT * FROM facturas.clientes);
@clientes;

ALTER TABLE articulos MODIFY CONSTRAINT art_descrip_unico DISABLE;
--INSERT INTO articulos (SELECT * FROM facturas.articulos);
@articulos;


ALTER TABLE facturas MODIFY CONSTRAINT ch_descuento DISABLE;
ALTER TABLE facturas MODIFY CONSTRAINT ch_iva DISABLE;
-- INSERT INTO facturas (SELECT codfac, fecha, codcli, iva, dto FROM facturas.facturas);
@facturas;

-- INSERT INTO lineas_fac (SELECT * FROM facturas.lineas_fac);
@lineas_fac;

--5---
SELECT descrip, max(precio), count(*)
FROM articulos
GROUP BY descrip
HAVING count(*)>1;
--copiamos los reptidos (incluyendo los maxiomos)
CREATE TABLE duplicados AS (SELECT codart, descrip, precio FROM articulos WHERE descrip IN (SELECT descrip
FROM articulos
GROUP BY descrip
HAVING count(*)>1));
--borramosmax: se borran 25
DELETE FROM duplicados WHERE (descrip,precio) IN (SELECT descrip, MAX(precio) FROM articulos GROUP BY descrip);
--borramos los otros de la tabla: : se borran 36
DELETE FROM articulos WHERE (codart,descrip,precio) IN (SELECT * FROM duplicados);
ALTER TABLE articulos MODIFY CONSTRAINT art_descrip_unico ENABLE;

--6--
UPDATE facturas SET dto=20
WHERE dto>20; -- 14 filas updated
ALTER TABLE facturas MODIFY CONSTRAINT ch_descuento ENABLE;

--7--					
ALTER TABLE facturas ADD total number(8,2);

UPDATE facturas SET total= (SELECT SUMA FROM (SELECT facturas.codfac, (sum(lineas_fac.cant*lineas_fac.precio*(1-nvl(lineas_fac.dto, 0)/100)*(1+iva/100)*(1-nvl(lineas_fac.dto, 0)/100)))SUMA
							FROM lineas_fac, facturas
							WHERE lineas_fac.codfac=facturas.codfac
							GROUP BY facturas.codfac) F
						WHERE facturas.codfac = F.codfac);
						-- 112 filas updated
--8--
UPDATE facturas SET IVA = 8
WHERE IVA = 7;
UPDATE facturas SET IVA = 18
WHERE IVA = 16;
ALTER TABLE facturas MODIFY CONSTRAINT ch_iva ENABLE;
--32 rows updated.
--56 rows updated.


--9--

ALTER TABLE articulos ADD (iva NUMBER(2) DEFAULT 18);
ALTER TABLE facturas DROP CONSTRAINT ch_iva;
ALTER TABLE articulos ADD (CONSTRAINT ch_iva check (iva in(0,4,8,18)));
--es cerrado por la derecha y abierto por l a izquierda--
UPDATE articulos SET iva=0
WHERE descrip BETWEEN 'A%' AND 'E%' AND descrip NOT LIKE 'CAJA%';
UPDATE articulos SET iva=4
WHERE descrip BETWEEN 'E%' AND 'J%';
UPDATE articulos SET iva=18
WHERE descrip BETWEEN 'J%' AND 'S%';
UPDATE articulos SET iva=8
WHERE descrip > 'S%';


ALTER TABLE facturas DROP COLUMN iva;
UPDATE facturas SET total=NULL;

SELECT iva "TIPO DE IVA", count(*)RECUENTO
FROM articulos
GROUP BY iva
ORDER BY iva DESC;


--10--
UPDATE facturas SET total = (SELECT total FROM (SELECT facturas.codfac, SUMA*(1-dto/100) TOTAL
												FROM facturas, (SELECT codfac, sum(cant*lineas_fac.precio*(1-dto/100)*(iva/100+1)) SUMA
																FROM lineas_fac, articulos
																WHERE lineas_fac.codart = articulos.codart
																GROUP BY codfac) B
												WHERE facturas.codfac=B.codfac) C 
							WHERE C.codfac=facturas.codfac);

UPDATE facturas SET total = (SELECT total FROM (SELECT facturas.codfac, sum(cant*lineas_fac.precio*(1-nvl(lineas_fac.dto, 0)/100)*(articulos.iva/100+1)*(1-nvl(facturas.dto, 0)/100)) TOTAL
												FROM facturas, lineas_fac, articulos
												WHERE lineas_fac.codart = articulos.codart AND facturas.codfac = lineas_fac.codfac
												GROUP BY facturas.codfac) A
							WHERE A.codfac=facturas.codfac);

SELECT nombre, SUM(total) "COMPRAS AÑO 2020"
FROM clientes, facturas
WHERE clientes.codcli=facturas.codcli AND fecha BETWEEN '1/1/2020' AND '31/12/2020'
GROUP BY nombre
ORDER BY SUM(total) DESC;
						