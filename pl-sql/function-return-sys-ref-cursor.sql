SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION fn_cursor_employees(p_job_id employees.job_id%TYPE) 
    RETURN SYS_REFCURSOR
AS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR 
        SELECT first_name, last_name FROM employees
        WHERE job_id = p_job_id;
    RETURN v_cursor;
END;

CREATE OR REPLACE PROCEDURE sp_call_fn_cursor_employees
AS
    v_cursor SYS_REFCURSOR;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
BEGIN
    v_cursor := fn_cursor_employees('IT_PROG');
    LOOP
        FETCH v_cursor INTO v_first_name, v_last_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_first_name || ' - ' || v_last_name);
    END LOOP;
END;

EXEC sp_call_fn_cursor_employees;
