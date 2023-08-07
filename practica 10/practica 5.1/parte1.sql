rem union mete las filas del select de debajo dentro del select de arriba, la unica condicion es que los dos sean del mismo tipo (con el all devuelve todo y sin él quita los duplicados)
rem la union es conmutativa y se puede ordenar
rem el natural join junta los campos iguales luego solo sacar uno de ellos
rem no hay diferencia entre inner join y join (es lo mismo)
rem se pueden poner varios join en una misma consulta


rem ejer 21
select name from reviewer
union all
select title from movie
order by name;

rem ejer 22
select distinct title
from movie full join rating on (movie.mid = rating.mid)
            full join reviewer on (rating.rid = reviewer.rid)
where title not in (select title
                    from movie join rating on (movie.mid = rating.mid)
                                join reviewer on (rating.rid = reviewer.rid)
                    where reviewer.name = 'Chris Jackson')
order by title;

