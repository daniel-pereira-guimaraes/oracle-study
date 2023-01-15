SET SERVEROUTPUT ON;

DECLARE
    v_sql VARCHAR(100) := 'SELECT first_name FROM employees WHERE employee_id = :p';
    v_id INTEGER := 160;
    v_name employees.first_name%TYPE;
BEGIN
    EXECUTE IMMEDIATE v_sql INTO v_name USING v_id;
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
END;