INSERT   INTO   Proveedores   (codigpro,   cifpro,   nombrpro,   direcpro,   cpostpro,   localpro,  telefpro,  faxpro,  procepro)  VALUES  ('P005',  'A12345678',  'Gomez  Sanz,  Antonio', 'Mayor,18', '26070', 'Logroño', '(34) 942 202 022', '(34) 941 123 123', 'UE');


SELECT *
FROM Proveedores

SELECT *
FROM PROVEEDORES
where localpro = 'Logroño'

UPDATE Proveedores SET emailpro = 'mailto:gil@cancan.es' WHERE nombrpro='Gil Perez, Jon'

delete from proveedores where localpro = 'Logroño' 

SELECT *
FROM ARTICULOS

SELECT *
from proveedores

select *
from articulos
where preunart>180 and stockart<=100

select *
from articulos
where preunart between 180 and 300


select *
from proveedores
where localpro in ('Pamplona','Donosti','Barcelona')

select codigpro, nombrpro,direcpro,cpostpro,localpro,telefpro
from proveedores
where emailpro is null

select distinct pr.codigpro, pr.nombrpro,pr.direcpro,pr.localpro
from proveedores pr,pedidos pe
where pe.codigpro=pr.codigpro and pe.fechaped between '20/1/2020' and '15/9/2020'

select distinct a.*
from articulos a, pedidos pe, lineas l
where pe.fechaped between '15/5/2020' and '30/5/2020' and l.codigart=a.codigart and pe.numped=l.numped


select pe.numped,l.numlin,a.codigart
from pedidos pe,lineas l, articulos a
where l.codigart=a.codigart and pe.numped=l.numped
group by count(l.numlin)>1