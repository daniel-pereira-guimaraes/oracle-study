-- As SYS user:
GRANT EXECUTE ON DBMS_FLASHBACK TO hr;

SELECT name, value FROM v$parameter WHERE name LIKE '%undo%';

SELECT value / 60 || ' minutes' AS retention_time  
FROM v$parameter WHERE name = 'undo_retention';

-- As HR user:

-- See current data:
SELECT * FROM employees;

-- Wrong update :(
UPDATE employees SET salary = salary * 2;
COMMIT;

-- See wrong updated data:
SELECT * FROM employees;

-- See data at 5 minutes ago!
SELECT * FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE);

-- Recovery from 5 minutos ago!
UPDATE employees a SET a.salary = 
    (SELECT salary FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE) b
     WHERE b.employee_id = a.employee_id);
COMMIT;

-- See recovered data!
SELECT * FROM employees;
