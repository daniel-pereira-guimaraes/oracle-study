SET SERVEROUTPUT ON
DECLARE
    num1 CONSTANT NUMBER(11,2) := 300;
    num2 CONSTANT NUMBER(11,2) DEFAULT 200;
    num3 NUMBER(11,2) NOT NULL := 500;
    num4 NUMBER(11,2);
BEGIN
    num4 := (num1 + num2 + num3) / 2;
    DBMS_OUTPUT.PUT_LINE('Number 1: ' || num1);
    DBMS_OUTPUT.PUT_LINE('Number 2: ' || num2);
    DBMS_OUTPUT.PUT_LINE('Number 3: ' || num3);
    DBMS_OUTPUT.PUT_LINE('Average: ' || num4);
END;