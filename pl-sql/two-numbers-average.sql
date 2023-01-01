SET SERVEROUTPUT ON
DECLARE
    num1 NUMBER(11,2) := 10;
    num2 NUMBER(11,2) := 5;
    num3 NUMBER(11,2);
BEGIN
    num3 := (num1 + num2) / 2;
    DBMS_OUTPUT.PUT_LINE('First number: ' || num1);
    DBMS_OUTPUT.PUT_LINE('Second number: ' || num2);
    DBMS_OUTPUT.PUT_LINE('Average: ' || num3);
END;