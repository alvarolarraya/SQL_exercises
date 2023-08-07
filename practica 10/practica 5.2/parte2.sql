rem ejer 29
select *
from proveedores left join pedidos on (proveedores.codigpro = pedidos.codigpro)
rem si quieres sacar un atributo solo de los que unes
select pedidos.codigpro
from proveedores left join pedidos on (proveedores.codigpro = pedidos.codigpro)

rem ejer 30
select *
from proveedores left join pedidos on proveedores.codigpro = pedidos.codigpro
where localpro = 'Pamplona'

rem ejer 31
select proveedores.codigpro,nombrpro,numped
from proveedores left join pedidos on proveedores.codigpro = pedidos.codigpro and localpro = 'Pamplona'

rem ejer 32
select codigpro, nombrpro, localpro
from proveedores
union
select codigpro, nombrpro, localpro
from  proveedores_anulados 

rem ejer 33
