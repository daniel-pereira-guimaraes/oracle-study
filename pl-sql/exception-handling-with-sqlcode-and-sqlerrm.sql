SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    i INTEGER;
    a INTEGER;
    b INTEGER;
    c INTEGER;
    d INTEGER;
    x INTEGER;
BEGIN
    FOR i IN 1..1000 LOOP
        BEGIN
            a := DBMS_RANDOM.VALUE(-100, 100);
            b := DBMS_RANDOM.VALUE(-10, 10);
            c := DBMS_RANDOM.VALUE(-100, 100);
            d := POWER(a / b, c);
            DBMS_OUTPUT.PUT_LINE(i || ': ' || d);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(SQLCODE || ' - ' || SQLERRM);
        END;
    END LOOP;
END;