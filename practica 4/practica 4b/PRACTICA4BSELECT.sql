REM EJER1
SELECT *
FROM CLIENTE
WHERE NOMBRE = 'Naiara G�mez'

REM EJER2
SELECT COUNT(O.COD) ORDENES_DE_VENTA
FROM CLIENTE C,ORDEN O
WHERE C.CODCLI=O.CODCLI AND NOMBRE = 'Naiara G�mez'
GROUP BY O.COD

REM EJER3
SELECT SUM(CO.UDS) PEDIDAS
FROM CLIENTE CL, ORDEN O, CONTIENE CO
WHERE CL.CODCLI=O.CODCLI AND CO.COD=O.COD AND NOMBRE = 'Naiara G�mez'

REM EJER4
SELECT SUM(CO.UDS_OUT) SERVIDAS
FROM CLIENTE CL, ORDEN O, CONTIENE CO
WHERE CL.CODCLI=O.CODCLI AND CO.COD=O.COD AND NOMBRE = 'Naiara G�mez'

REM EJER5
SELECT SUM(CO.UDS) - SUM(CO.UDS_OUT)  PENDIENTES
FROM CLIENTE CL, ORDEN O, CONTIENE CO
WHERE CL.CODCLI=O.CODCLI AND CO.COD=O.COD AND NOMBRE = 'Naiara G�mez'

REM EJER6
SELECT CL.NOMBRE,O.FECHA,O.FPAGO,O.COD,CO.CODART
FROM CLIENTE CL,ORDEN O,CONTIENE CO
WHERE CO.UDS_OUT > 0 AND CL.CODCLI=O.CODCLI AND O.COD=CO.COD

REM EJER7
SELECT CL.NOMBRE,O.FECHA,O.FPAGO,O.COD,CO.CODART
FROM CLIENTE CL,ORDEN O,CONTIENE CO
WHERE CO.UDS_OUT=CO.UDS AND CL.CODCLI=O.CODCLI AND O.COD=CO.COD

REM EJER8
SELECT O.COD,CL.*,O.FECHA,O.FECHA_ENV
FROM ORDEN O,CLIENTE CL
WHERE O.FPAGO = 'A' AND O.CODCLI=CL.CODCLI

REM EJER9
SELECT COUNT(O.FECHA_ENV) ORDENES_VENTA
FROM ORDEN O
WHERE O.FECHA_ENV BETWEEN '01/12/2019' AND '01/03/2020'

REM EJER10
SELECT DISTINCT CO.FECH_ENV,A2.DESCRIP ARTICULO_ENVIADO,A1.DESCRIP ARTICULO_PRODUCIDO 
FROM ARTICULO A1,ARTICULO A2,CONTIENE CO,PRODUCE P
WHERE CO.CODART=A2.CODART AND A1.CODART=P.CODART AND CO.FECH_ENV=P.FECHA

REM EJER11
SELECT MAX(C.RED) MAYOR_ROJO,MIN(C.RED) MENOR_ROJO
FROM COLOR C

REM EJER12
SELECT DISTINCT CL.*
FROM CLIENTE CL, COLOR COL, ORDEN O, CONTIENE CON
WHERE CL.CODCLI=O.CODCLI AND CON.COD=O.COD AND CON.RAL=COL.RAL AND COL.RED > 100 AND COL.GREEN BETWEEN 100 AND 150 AND COL.BLUE >= 50

REM EJER13
SELECT SUM(CON.UDS) - SUM(CON.UDS_OUT) CANTIDAD_X_SUMINISTRAR
FROM ORDEN O, CONTIENE CON
WHERE O.COD=CON.COD