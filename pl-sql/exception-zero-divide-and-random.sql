SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    i INTEGER;
    a INTEGER;
    b INTEGER;
    c INTEGER;
BEGIN
    FOR i IN 1..1000 LOOP
        BEGIN
            a := DBMS_RANDOM.VALUE(-10, 10);
            b := DBMS_RANDOM.VALUE(-10, 10);
            c := a / b;
            DBMS_OUTPUT.PUT_LINE(i || ': ' || a || ' / ' || b || ' = ' || c);
        EXCEPTION
            WHEN ZERO_DIVIDE THEN
                DBMS_OUTPUT.PUT_LINE(i || ': Division by zero!');
        END;
    END LOOP;
END;