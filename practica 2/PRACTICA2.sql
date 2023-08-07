REM EJER1
SELECT COUNT(*)
FROM ASIGNATURAS


REM EJER2
SELECT COUNT(*)NUMANUALES
FROM ASIGNATURAS
WHERE ANUALIDAD LIKE 'A'


REM EJER3
SELECT MAX(ALUMNOS)MAXALUMNOS
FROM ASIGNATURAS


REM EJER4
SELECT AVG(ALUMNOS)MEDIAALUMNOS
FROM ASIGNATURAS


REM EJER5
SELECT SUM(ALUMNOS) SUMAALUMNOS
FROM ASIGNATURAS


REM EJER6
SELECT PROFESOR, COUNT(*)DOCENCIA 
FROM DOCENCIA
GROUP BY PROFESOR
ORDER BY PROFESOR


REM EJER7
SELECT PROFESOR, COUNT(*)DOCENCIA 
FROM DOCENCIA
GROUP BY PROFESOR
HAVING COUNT(*)>10
ORDER BY PROFESOR


REM EJER8
SELECT SUM(HORAS_PRACTICA) TOTALHORASPRACTICA, SUM(HORAS_TEORIA) TOTALHORASTEORIA
FROM ASIGNATURAS,DOCENCIA
WHERE DOCENCIA.SIGLAS=ASIGNATURAS.SIGLAS


REM EJER9
SELECT SUM(A.HORAS_PRACTICA)TOTALPRACTICA, SUM(A.HORAS_TEORIA)TOTALHORASTEORIA
FROM ASIGNATURAS A, DOCENCIA D
WHERE D.SIGLAS=A.SIGLAS AND A.ANUALIDAD LIKE 'A' AND D.PROFESOR>30

REM EJER10
SELECT COUNT(*) NUMASIG, AVG(A.HORAS_PRACTICA) MEDIAHORASPRACTICA
FROM ASIGNATURAS A, DOCENCIA D
WHERE D.SIGLAS=A.SIGLAS AND A.ANUALIDAD LIKE 'A' AND D.PROFESOR>30

REM EJER11
SELECT MAX(L.CAPACIDAD)MAXCAPACIDAD
FROM LOCALES L

REM EJER12
SELECT MAX(L.CAPACIDAD)MAXCAPACIDAD
FROM LOCALES L,DOCENCIA D,ASIGNATURAS A
WHERE L.CODIGO = D.LOCAL AND D.SIGLAS=A.SIGLAS AND HORAS_TEORIA>0

REM EJER13
SELECT COUNT(*)LOCALES1
FROM LOCALES L
WHERE SITUACION LIKE 'Planta Primera%'

REM EJER14
SELECT SITUACION, COUNT(*)NUMLOCAL
FROM LOCALES
GROUP BY SITUACION
ORDER BY NUMLOCAL ASC

REM EJER15
SELECT DIA, MIN(HORA) PRIMERA_HORA, MAX(HORA) ULTIMA_HORA
FROM DOCENCIA D
WHERE DIA BETWEEN 1 AND 5
GROUP BY DIA

REM EJER16
SELECT ANUALIDAD, COUNT(*)NUM_ASIGNATURAS, AVG(CREDITOS) MEDIA_CREDITOS, MIN(ALUMNOS) MINIMO_ALUMNOS
FROM ASIGNATURAS A
WHERE ANUALIDAD NOT LIKE 'A' OR ANUALIDAD IS NULL
GROUP BY ANUALIDAD
ORDER BY ANUALIDAD

REM EJER17
SELECT A.SIGLAS, A.NOMBRE
FROM ASIGNATURAS A, DOCENCIA D
WHERE D.SIGLAS = A.SIGLAS
GROUP BY A.SIGLAS, A.NOMBRE
HAVING COUNT(D.ID) BETWEEN 10 AND 20
ORDER BY A.NOMBRE ASC

REM EJER18
SELECT D.HORA, COUNT(D.DIA) NUM_DIAS
FROM DOCENCIA D, ASIGNATURAS A
WHERE A.SIGLAS = 'Alg' AND D.SIGLAS=A.SIGLAS
GROUP BY D.HORA
HAVING COUNT(D.DIA)>=2
ORDER BY NUM_DIAS DESC, D.HORA ASC