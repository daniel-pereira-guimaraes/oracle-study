SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_cursor_employees(
    pcursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN pcursor FOR SELECT first_name, last_name FROM employees;
END;

CREATE OR REPLACE PROCEDURE sp_list_employees
AS
    v_cursor SYS_REFCURSOR;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
BEGIN
    sp_cursor_employees(v_cursor);
    LOOP
        FETCH v_cursor INTO v_first_name, v_last_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_first_name || ' - ' || v_last_name);
    END LOOP;
END;

EXEC sp_list_employees;
