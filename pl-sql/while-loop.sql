SET SERVEROUTPUT ON

DECLARE
    i INTEGER(3);
BEGIN
    i := 1;
    WHILE i <= 100 LOOP 
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('End loop!');
END;