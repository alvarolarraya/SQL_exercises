select	'DROP TABLE '|| table_name||  ' CASCADE CONSTRAINTS;' AS "Copiar, pegar y ejecutar"
from user_tables;