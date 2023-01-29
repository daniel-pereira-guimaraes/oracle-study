CREATE OR REPLACE FUNCTION fn_get_sys_milliseconds RETURN NUMBER 
AS
    t TIMESTAMP := SYSTIMESTAMP;
BEGIN
    RETURN EXTRACT(DAY FROM t) * 24 * 60 * 60 * 1000 +
        EXTRACT(HOUR FROM t) * 60 * 60 * 1000 +
        EXTRACT(MINUTE FROM t) * 60 * 1000 +
        EXTRACT(SECOND FROM t) * 1000;
END;

DECLARE
    t1 NUMBER;
    t2 NUMBER;
BEGIN
    t1 := fn_get_sys_milliseconds();
    FOR r IN (SELECT first_name FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(r.first_name);   
    END LOOP;
    t2 := fn_get_sys_milliseconds();
    DBMS_OUTPUT.PUT_LINE('t1: ' || t1);
    DBMS_OUTPUT.PUT_LINE('t2: ' || t2);
    DBMS_OUTPUT.PUT_LINE('t2-t1: ' || (t2 - t1));
END;

