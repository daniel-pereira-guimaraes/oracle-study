SET SERVEROUTPUT ON

DECLARE
    i INTEGER(1);
    j INTEGER(1);
    v NUMBER(38);
BEGIN
    v := 1;
    <<LOOP1>>
    FOR i IN 1..8 LOOP
        FOR j IN 1..8 LOOP 
            DBMS_OUTPUT.PUT_LINE('(' || i || ',' || j || '): ' || TO_CHAR(v, '9G999G999G999G999G999G999'));
            v := v * 2;
            EXIT LOOP1 WHEN v > 999999999;
        END LOOP;
    END LOOP;
END;