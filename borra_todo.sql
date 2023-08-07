SELECT 'DROP '||OBJECT_TYPE||' '||object_name|| CASE OBJECT_TYPE WHEN 'TABLE' THEN ' CASCADE CONSTRAINTS;' ELSE ';' END "Consulta para generar Borrado" 
FROM USER_OBJECTS
WHERE OBJECT_TYPE NOT IN ('INDEX','TRIGGER','LOB');--para borar todos los objetos



SELECT * FROM USER_OBJECTS;--Para comprobar

