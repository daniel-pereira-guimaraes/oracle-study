SET SERVEROUTPUT ON
DECLARE
    num$1 NUMBER(11,2) := 10;
    num#2 NUMBER(11,2) := 5;
    num_3 NUMBER(11,2);
BEGIN
    num_3 := (num$1 + num#2) / 2;
    DBMS_OUTPUT.PUT_LINE('First number: ' || num$1);
    DBMS_OUTPUT.PUT_LINE('Second number: ' || num#2);
    DBMS_OUTPUT.PUT_LINE('Average: ' || num_3);
END;