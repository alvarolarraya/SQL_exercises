prompt ________________________________________
prompt EJERCICIO 1
select c.*,pue.nombre,prov.nombre
from facturas f 
    join clientes c on (f.codcli = c.codcli) 
    join pueblos pue on (c.codpue = pue.codpue) 
    join provincias prov on (pue.codpro = prov.codpro)
where f.codfac = 69;

prompt ________________________________________
prompt EJERCICIO 2
select f.codfac, c.nombre
from articulos a join lineas_fac l on (l.codart = a.codart) and (a.precio = (select max(precio) from articulos))
                join facturas f on (l.codfac = f.codfac) 
                join clientes c on (c.codcli = f.codcli)
order by c.nombre;                
                
prompt ________________________________________
prompt EJERCICIO 3
select v.nombre vendedor,jefes.nombre jefe
from vendedores v
    join pueblos pue on (pue.codpue = v.codpue)
    join provincias prov on (prov.codpro = pue.codpro)
    left join vendedores jefes on (jefes.codven = v.jefe)
where prov.nombre = 'CASTELLON';

prompt ________________________________________
prompt EJERCICIO 4
select c.codcli, c.nombre, c.codpostal, importes.importe
from clientes c 
        join (select f.codcli, sum(l.cant*l.precio) importe
                    from facturas f
                        join lineas_fac l on (f.codfac = l.codfac)
                    group by f.codcli
                    order by f.codcli
                ) importes on (importes.codcli = c.codcli)
group by c.codcli, c.nombre, c.codpostal, importes.importe
having importes.importe > 6000
order by c.codcli;

prompt ________________________________________
prompt EJERCICIO 5