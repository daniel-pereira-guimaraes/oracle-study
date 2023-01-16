-- As HR user:
CREATE TABLE employees_copy AS SELECT * FROM employees;
ALTER TABLE employees_copy ENABLE ROW MOVEMENT;

-- As SYS user:
GRANT FLASHBACK ON hr.employees_copy TO hr;

-- As HR user:
SELECT * FROM employees_copy;

DELETE FROM employees_copy;

SELECT * FROM employees_copy;

FLASHBACK TABLE employees_copy TO TIMESTAMP SYSTIMESTAMP - INTERVAL '2' MINUTE;

SELECT * FROM employees_copy;