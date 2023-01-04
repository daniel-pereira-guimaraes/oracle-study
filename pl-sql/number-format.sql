SET SERVEROUTPUT ON
DECLARE 
    salary NUMBER(11,2) := 5000.0;
    taxRate NUMBER(4,2) := 15.0;
    taxValue NUMBER(11,2);
BEGIN
    taxValue := salary * taxRate / 100;
    DBMS_OUTPUT.PUT_LINE('Salary: $ ' || TRIM(TO_CHAR(salary, '999G999D99')));
    DBMS_OUTPUT.PUT_LINE('Tax rate: ' || TRIM(TO_CHAR(taxRate, '99D99')) || '%');
    DBMS_OUTPUT.PUT_LINE('Tax value: $ ' || TRIM(TO_CHAR(taxValue, '999G999D99'))); 
END;