CREATE OR REPLACE FUNCTION fn_total_salary RETURN NUMBER 
AS
    vtotal NUMBER;
BEGIN
    SELECT SUM(salary) INTO vtotal FROM employees;
    RETURN vtotal;
END;

SELECT fn_total_salary() FROM dual;