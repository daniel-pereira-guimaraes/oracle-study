CREATE OR REPLACE FUNCTION fn_milliseconds_between(
    a TIMESTAMP, b TIMESTAMP) 
    RETURN NUMBER 
AS
BEGIN
    RETURN EXTRACT(DAY FROM (b-a)) * 24 * 60 * 60 * 1000 +
        EXTRACT(HOUR FROM (b-a)) * 60 * 60 * 1000 +
        EXTRACT(MINUTE FROM (b-a)) * 60 * 1000 +
        EXTRACT(SECOND FROM (b-a)) * 1000;
END;

DECLARE
    t1 TIMESTAMP;
    t2 TIMESTAMP;
BEGIN
    t1 := SYSTIMESTAMP;
    FOR r IN (SELECT first_name FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(r.first_name);   
    END LOOP;
    t2 := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('t1: ' || t1);
    DBMS_OUTPUT.PUT_LINE('t2: ' || t2);
    DBMS_OUTPUT.PUT_LINE('t2-t1: ' || fn_milliseconds_between(t1, t2) || 'ms');
END;

