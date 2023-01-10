SET SERVEROUTPUT ON

DECLARE
    CURSOR employeesCursor(pJobId VARCHAR2) IS 
        SELECT * FROM employees 
        WHERE job_id = pJobId 
        FOR UPDATE;
BEGIN
    FOR employeeRecord IN employeesCursor('AD_VP') LOOP
        UPDATE employees SET
            salary = salary * 1.1
        WHERE CURRENT OF employeesCursor;
    END LOOP;
    COMMIT;
END;