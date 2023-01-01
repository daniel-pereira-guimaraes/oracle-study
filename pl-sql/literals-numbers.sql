SET SERVEROUTPUT ON
DECLARE
    num1 NUMBER(11,2) := 3E2; -- 3E2 = 3*10^2
    num2 NUMBER(11,2) := 200.0d; -- d = double
    num3 NUMBER(11,2) := 500.0f; -- f = float
    num4 NUMBER(11,2);
BEGIN
    num4 := (num1 + num2 + num3) / 3;
    DBMS_OUTPUT.PUT_LINE('Number 1: ' || num1);
    DBMS_OUTPUT.PUT_LINE('Number 2: ' || num2);
    DBMS_OUTPUT.PUT_LINE('Number 3: ' || num3);
    DBMS_OUTPUT.PUT_LINE('Average: ' || num4);
END;