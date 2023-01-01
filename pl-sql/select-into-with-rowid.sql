SET SERVEROUTPUT ON

DECLARE
    vRowId ROWID;
    vFirstName employees.first_name%TYPE;
    vLastName employees.last_name%TYPE;
BEGIN
    SELECT
        ROWID,
        first_name,
        last_name
    INTO
        vRowId,
        vFirstName,
        vLastName
    FROM employees
    WHERE employee_id = 200;
    
    DBMS_OUTPUT.PUT_LINE('vRowId: ' || vRowId);
    DBMS_OUTPUT.PUT_LINE('vFirstName: ' || vFirstName);
    DBMS_OUTPUT.PUT_LINE('vLastName: ' || vLastName);
END;