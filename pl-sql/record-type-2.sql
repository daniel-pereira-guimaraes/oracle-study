SET SERVEROUTPUT ON

DECLARE
    TYPE employeeRecordType IS RECORD (
        name VARCHAR2(46),
        phone employees.phone_number%TYPE,
        email employees.email%TYPE);
    vEmployeeRecord employeeRecordType;
BEGIN
    SELECT
        first_name || ' ' || last_name,
        phone_number,
        email
    INTO 
        vEmployeeRecord
    FROM employees
    WHERE employee_id = 170;

    DBMS_OUTPUT.PUT_LINE('Name..: ' || vEmployeeRecord.name);
    DBMS_OUTPUT.PUT_LINE('Phone.: ' || vEmployeeRecord.phone);
    DBMS_OUTPUT.PUT_LINE('E-mail: ' || vEmployeeRecord.email);
END;