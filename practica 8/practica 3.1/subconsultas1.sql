rem ejer 15
select distinct m.title
from movie m, rating r
where m.mid not in (select distinct r.mid
                    from rating r);
                    
rem ejer 16
select antes.media-despues.media
from (select avg(med.medias) media
        from (select avg(ra.stars) medias
            from rating ra,movie m
            where ra.mid = m.mid and m.year < '1980'
            group by ra.mid) med) antes, (select avg(med.medias) media
                                        from (select avg(ra.stars) medias
                                                from rating ra,movie m
                                                where ra.mid = m.mid and m.year > '1980'
                                                group by ra.mid) med) despues

rem ejer 17
select ra1.stars stars, re1.name name, m1.title
from rating ra1, reviewer re1, movie m1
where ra1.rid = re1.rid and ra1.mid = m1.mid and ra1.stars <= all (select ra2.stars
                                                        from rating ra2);
                    
rem ejer 18
select m1.title, m1.director
from movie m1
where m1.director in (select m2.director
                    from movie m2
                    group by m2.director
                    having count(m2.director) > 1);
                   
                    
rem ejer 19
select m1.mid mid , m1.title title, avg(ra1.stars)
from movie m1, rating ra1
where ra1.mid = m1.mid
group by m1.mid , m1.title
having avg(ra1.stars) >= all(select avg(ra2.stars)
                    from rating ra2, movie m2
                    where ra2.mid = m2.mid
                    group by m2.mid);
                    
rem ejer 20
select m1.mid mid , m1.title title, avg(ra1.stars)
from movie m1, rating ra1
where ra1.mid = m1.mid
group by m1.mid , m1.title
having avg(ra1.stars) <= all(select avg(ra2.stars)
                    from rating ra2, movie m2
                    where ra2.mid = m2.mid
                    group by m2.mid);
                    
rem ejer 23
insert into reviewer values ('209','Roger Ebert');

rem ejer 24
insert into rating select re.rid,m.mid,5,sysdate
                    from reviewer re, movie m
                    where name = 'James Cameron';

rem ejer 25
update movie 
set year = year+25
where mid in (select mid
            from rating
            where rating.stars >= 4);
            
rem ejer 26
delete from rating ra
where ra.rid in 
                (select distinct ra.rid
                from movie m, rating ra
                where ra.mid = m.mid and ra.stars < 4 and m.year between '1970' and '2000') and ra.mid in (select distinct ra.mid
                                                                                                            from movie m, rating ra
                                                                                                            where ra.mid = m.mid and ra.stars < 4 and m.year between '1970' and '2000') and ra.ratingdate in
                                                                                                                                                                                                            (select distinct ra.ratingdate
                                                                                                                                                                                                            from movie m, rating ra
                                                                                                                                                                                                            where ra.mid = m.mid and ra.stars < 4 and m.year between '1970' and '2000');
                                                                                                                                                                        