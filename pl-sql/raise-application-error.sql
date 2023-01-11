SET SERVEROUTPUT ON

ACCEPT pId NUMBER PROMPT 'Enter employee ID: ';
DECLARE
    vId INTEGER := &pId;
    vName VARCHAR2(50);
BEGIN
    SELECT first_name || ' ' || last_name  
    INTO vName
    FROM employees 
    WHERE employee_id = vId;

    DBMS_OUTPUT.PUT_LINE('Name: ' || vName);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee ID not found: ' || vId);
END;