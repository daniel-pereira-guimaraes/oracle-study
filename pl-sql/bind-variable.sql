SET SERVEROUTPUT ON;

VARIABLE total NUMBER

DECLARE 
    value1 NUMBER(11,2) := 20;
    value2 NUMBER(11,2) := 30;
BEGIN
    :total := value1 + value2;
    DBMS_OUTPUT.PUT_LINE(value1 || ' + ' || value2 || ' = ' || :total);
END;

BEGIN
    :total := :total * 2;
    DBMS_OUTPUT.PUT_LINE('total: ' || :total);
END;