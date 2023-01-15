-- DATA RECOVERY WITH DMBS_FLASHBACK

-- As SYS user:
GRANT EXECUTE ON DBMS_FLASHBACK TO hr;

-- Wrong update :(
UPDATE employees SET salary = salary * 2;
COMMIT;

-- Restore salary from 30 minutes ago
DECLARE
    CURSOR salary_cursor IS SELECT employee_id, salary FROM employees;
    salary_record salary_cursor%ROWTYPE;
BEGIN
    DBMS_FLASHBACK.ENABLE_AT_TIME(SYSDATE - 30 / 1440); -- 30 minutos ago!
    OPEN salary_cursor;
    DBMS_FLASHBACK.DISABLE; -- Now again!

    LOOP
        FETCH salary_cursor INTO salary_record;

        EXIT WHEN salary_cursor%NOTFOUND;

        UPDATE employees SET salary = salary_record.salary 
        WHERE employees.employee_id = salary_record.employee_id;
    END LOOP;

    CLOSE salary_cursor;
    COMMIT;
END;

SELECT * FROM employees