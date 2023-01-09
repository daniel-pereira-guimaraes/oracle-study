SET SERVEROUTPUT ON

DECLARE
    i NUMBER;
BEGIN
    i := 1;
    LOOP 
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
        EXIT WHEN i > 10;
    END LOOP;
END;