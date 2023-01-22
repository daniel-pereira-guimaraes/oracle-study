SPOOL C:\temp\employees.txt;
SELECT * FROM hr.employees;
SPOOL OFF;

SET HEADING OFF;
SPOOL C:\temp\inserts.sql;
SELECT 'INSERT INTO mytable(id,name) VALUES(' || 
    employee_id || ',''' || first_name || ''');'
FROM hr.employees;
SPOOL OFF;
