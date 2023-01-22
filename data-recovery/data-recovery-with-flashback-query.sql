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

-- See data at specific timestamp:
SELECT * FROM employees AS OF TIMESTAMP 
	TO_TIMESTAMP('2023-01-22 11:50:00', 'YYYY-MM-DD HH24:MI:SS');

-- See data at 5 minutes ago!
SELECT * FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE);

-- Recovery from 5 minutos ago!
UPDATE employees a SET a.salary = 
    (SELECT salary FROM employees AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE) b
     WHERE b.employee_id = a.employee_id);
COMMIT;

-- See recovered data!
SELECT * FROM employees;


/* FLASHBACK QUERY VERSION */

SELECT DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER FROM dual;

UPDATE employees SET salary = 4000 WHERE employee_id = 150;
COMMIT;

UPDATE employees SET salary = 15000 WHERE employee_id = 150;
COMMIT;

SELECT DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER FROM dual;

SELECT 
    versions_startscn, 
    versions_starttime, 
    versions_endscn, 
    versions_endtime,
    versions_xid, 
    versions_operation,
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM employees VERSIONS BETWEEN SCN 5667046 AND 5668043
WHERE employee_id = 150;

SELECT 
    versions_startscn, 
    versions_starttime, 
    versions_endscn, 
    versions_endtime,
    versions_xid, 
    versions_operation,
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM employees VERSIONS BETWEEN TIMESTAMP 
    SYSDATE - INTERVAL '10' MINUTE AND
    SYSDATE - INTERVAL '5' SECOND
WHERE employee_id = 150;