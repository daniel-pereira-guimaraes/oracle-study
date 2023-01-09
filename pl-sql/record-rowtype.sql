SET SERVEROUTPUT ON

DECLARE
    e employees%rowtype;
BEGIN
    SELECT * INTO e FROM employees WHERE employee_id = 170;

    DBMS_OUTPUT.PUT_LINE('Name..: ' || e.first_name || ' ' || e.last_name);
    DBMS_OUTPUT.PUT_LINE('Phone.: ' || e.phone_number);
    DBMS_OUTPUT.PUT_LINE('E-mail: ' || e.email);
END;