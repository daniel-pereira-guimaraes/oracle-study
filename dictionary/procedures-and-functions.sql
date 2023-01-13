desc procedure_name;

SELECT 
	object_name, 
	status 
FROM user_objects 
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

SELECT 
	object_name, 
	status 
FROM all_objects 
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

SELECT * FROM user_source;
SELECT * FROM all_source;
SELECT * FROM dba_source;

SELECT text FROM all_source 
WHERE name = 'SP_SQUARE' AND type = 'PROCEDURE'
ORDER BY line

SELECT * FROM user_errors;
SELECT * FROM all_errors;
SELECT * FROM dba_erros;

SHOW ERRORS PROCEDURE sq_square;