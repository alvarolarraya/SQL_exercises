rem ejer 27
select a.*
from articulos a, (select sum(l.unilin) suma, a.codigart
                    from lineas l, articulos a
                    where a.codigart = l.codigart
                    group by a.codigart) lineasArt
where a.stockart > lineasArt.suma and a.codigart = lineasArt.codigart;
                            
rem ejer 28
select a.*
from articulos a
where a.codigart not in (select a.codigart
                    from pedidos p, lineas l, articulos a
                    where a.codigart = l.codigart and l.numped = p.numped and p.fechaped between '24/09/20' and '21/11/20');


