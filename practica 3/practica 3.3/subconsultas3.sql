rem ejer 1
select avg(sum(l.cant*l.precio))
from lineas_fac l,facturas f
where f.codfac = l.codfac
group by f.codfac;

rem ejer 2
nullif toma valor null, si los parametros son nulos y sino no

rem ejer 3
select distinct EXTRACT (YEAR FROM FECHA) año, count(f.codfac) facturas, count(unique codcli) clientes, count(EXTRACT (day FROM FECHA)) dias
from facturas f
group by EXTRACT (YEAR FROM FECHA)
order by facturas desc;

rem ejer 4
select count(f.codfac) nFacturas,EXTRACT (YEAR FROM FECHA),f.codcli
from facturas f
group by EXTRACT (YEAR FROM FECHA), f.codcli
having count(distinct EXTRACT (month FROM FECHA))>2
order by EXTRACT (YEAR FROM FECHA),f.codcli;

rem ejer 5
select EXTRACT (month FROM FECHA) mes, count(f.codfac) facturas 
from  facturas f
where f.codcli in (select f.codcli
                    from facturas f
                    where EXTRACT (YEAR FROM FECHA) = '2020'
                    group by f.codcli
                    having count(f.codfac)>1) and EXTRACT (YEAR FROM FECHA) = '2020'
group by EXTRACT (month FROM FECHA)
order by mes

rem ejer 6
select EXTRACT (month FROM FECHA) mes, f.codcli,count(f.codfac) facturas 
from  facturas f
where f.codcli in (select f.codcli
                    from facturas f
                    where EXTRACT (YEAR FROM FECHA) = '2020'
                    group by f.codcli
                    having count(f.codfac)>1) and EXTRACT (YEAR FROM FECHA) = '2020'
group by EXTRACT (month FROM FECHA),f.codcli
order by mes

rem ejer 8
select c.*
from clientes c,facturas f
where c.codcli=f.codcli and EXTRACT (YEAR FROM FECHA) = '2020' and EXTRACT (month FROM FECHA) = '08'
order by SUBSTR(c.nombre, INSTR(nombre, ','),length(c.nombre));

rem ejer 9
select count( unique f.codcli)
from facturas f
where f.codcli not in (select distinct f.codcli
                    from facturas f
                    where f.iva = 16)