--Ejemplos
--Suponer que tenemos 2 tablas, con 2 columnas cada una, y datos como se muestra:
CREATE TABLE A (
id number,
des varchar2(10)
);

CREATE TABLE B (
id number,
des varchar(10)
);

INSERT INTO  A VALUES (1,'UNO');
INSERT INTO  A VALUES (2,'DOS');
INSERT INTO  A VALUES (3,'TRES');
INSERT INTO  A VALUES (4,'CUATRO');

INSERT INTO B VALUES (3,'TRES');
INSERT INTO B VALUES (4,'CUATRO');
INSERT INTO B VALUES (5,'CINCO');
INSERT INTO B VALUES (6,'SEIS');
--Tener en cuenta que (1,2) son únicos de A, (3,4) son comunes en A y B, y (5,6) son únicos de B.

--CONJUNTISTAS ALGEBRA RELACIONAL FUNDAMENTAL
--Producto cartesiano
SELECT *
FROM A,B;

--Union
select * from a
UNION
select * from B;

select * from a
UNION ALL
select * from B;

--Intersect
select * from a
INTERSECT
select * from B;

--minus
select * from a
MINUS
select * from B;

select * from b
MINUS
select * from a;

--REUNION ALGEBRA RELACIONAL NO FUNDAMENTAL
--JOIN
SELECT *
FROM A,B
WHERE A.ID=B.ID;

SELECT *
FROM A NATURAL JOIN B;

SELECT *
FROM A JOIN B USING(ID);

SELECT *
FROM A JOIN B ON A.ID=B.ID;

--LEFT JOIN
SELECT *
FROM A LEFT JOIN B ON A.ID=B.ID;

--RIGHT JOIN
SELECT *
FROM A RIGHT JOIN B ON A.ID=B.ID;

--FULL JOIN
SELECT *
FROM A FULL JOIN B ON A.ID=B.ID;