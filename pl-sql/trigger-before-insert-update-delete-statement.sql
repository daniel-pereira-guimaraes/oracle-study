-- biuds = before, insert, update, delete, statement
CREATE OR REPLACE TRIGGER tg_biuds_employees_salary_inc
    BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
    IF TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18 OR
        TO_NUMBER(TO_CHAR(SYSDATE, 'D')) NOT BETWEEN 2 AND 6 
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Perform this operation from Monday to Friday, from 8:00 am to 6:00 pm.');
    END IF;
END;
