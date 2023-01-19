-- As DBA:
CREATE SYNONYM emp FOR employees;

SELECT * FROM emp;

-- As DBA:
DROP SYNONYM emp;

-- As DBA
CREATE PUBLIC SYNONYM emp FOR hr.employees;
DROP PUBLIC SYNONYM emp;

-- As DBA:
CREATE SYNONYM user1.emp FOR user2.tablename;