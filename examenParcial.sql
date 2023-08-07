rem ejer 1
select v.nombre
from vendedores v
    join lineas_fac l on (l.codven = v.codven)
where v.nombre like 'M%'
group by v.nombre
having sum(l.precio * l.cant) > 95000;

rem ejer 2
rem apartado a
ALTER TABLE facturas DROP CONSTRAINT FK_FAC_VEN;
ALTER TABLE facturas ADD (CONSTRAINT FK_FAC_VEN foreign KEY (CODVEN) REFERENCES vendedores (codven) on delete cascade);

ALTER TABLE lineas_fac DROP CONSTRAINT FK_LIN_VEN;
ALTER TABLE lineas_fac ADD (CONSTRAINT FK_LIN_VEN foreign KEY (CODVEN) REFERENCES vendedores (codven) on delete set null);

rem apartado b
ALTER TABLE articulos ADD (CONSTRAINT StockMin2 CHECK (stock_min >= 2) NOVALIDATE);

ALTER TABLE articulos MODIFY (stock_min NOT NULL NOVALIDATE);



UPDATE articulos
SET stock_min = stock_min * 1.4
WHERE stock_min in (select stock_min
                    from articulos a
                    where a.stock_min between 40 and 50);
              
UPDATE articulos
SET stock_min = ((stock_min * 2) / 3)
WHERE stock_min in (select stock_min
                    from articulos a
                    where a.stock_min between 200 and 400);
                    
                    
UPDATE articulos
SET stock_min = 1
WHERE stock_min is null;

rem apartado c
UPDATE lineas_fac
SET dto = dto+10
WHERE cant >= 11;

rem apartado d
CREATE TABLE vendedores_vip AS(select distinct l.codven codven, 2 clase
                                from lineas_fac l
                                where precio > 5000);
                                
rem apartado e
UPDATE vendedores_vip
SET clase = 1
WHERE codven in (select distinct l.codven codven
                from lineas_fac l
                where precio > 8000);
                
rem ejercicio 4
select distinct pue.nombre || ' ('|| prov.nombre || ')'
from vendedores v
    join pueblos pue on (v.codpue = pue.codpue)
    join provincias prov on (prov.codpro = pue.codpro)
where v.comision > 12
minus
select distinct pue.nombre || ' ('|| prov.nombre || ')'
from clientes c
    join pueblos pue on (c.codpue = pue.codpue)
    join provincias prov on (prov.codpro = pue.codpro)
    join facturas f on (f.codcli = c.codcli)
where f.dto <= 2
union
select distinct pue.nombre || ' ('|| prov.nombre || ')'
from clientes c
    join pueblos pue on (c.codpue = pue.codpue)
    join provincias prov on (prov.codpro = pue.codpro)
    join facturas f on (f.codcli = c.codcli)
where extract (year from f.fecha) = 2019 and f.iva = 16;

rem ejercicio 5
select a.descrip || ' ('|| a.codart ||')', count(f.codcli) total_clientes, sum(cant) total_unidades_vendidas
from articulos a
    join lineas_fac l on (a.codart = l.codart)
    join facturas f on (f.codfac = l.codfac)
group by a.descrip, a.codart
having count(a.descrip) > 1
order by a.descrip asc;

rem ejercicio 3
select avg(count(f.codfac))
from facturas f
    join clientes c on (c.codcli = f.codcli)
    join pueblos pue on (pue.codpue = c.codpue)
    join provincias prov on (prov.codpro = pue.codpro)
group by f.codfac
