DESC tableName;

SELECT * FROM user_tables;
SELECT * FROM all_tables;
SELECT * FROM dba_tables; -- DBA access required!

SELECT * FROM user_objects 
WHERE object_type = 'TABLE';

SELECT object_name FROM user_objects 
WHERE object_type = 'TABLE';

SELECT
	c.column_id, 
	c.column_name, 
	c.data_type, 
	c.data_length, 
	c.data_precision, 
	c.data_scale, 
	c.nullable
FROM sys.all_tab_columns c
INNER JOIN sys.all_tables t on c.owner = t.owner and c.table_name = t.table_name
WHERE c.owner = 'HR' and c.table_name = 'REGIONS'
ORDER BY c.column_id;

SELECT
    owner,
    table_name, 
    tablespace_name,
    status,
    num_rows
FROM sys.all_tables;