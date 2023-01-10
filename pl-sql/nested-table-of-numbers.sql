SET SERVEROUTPUT ON

DECLARE
    TYPE number_table_type IS TABLE OF NUMBER(4);
    number_table number_table_type := number_table_type();
BEGIN
    FOR i IN 1..10 LOOP
        number_table.extend;
        number_table(i) := DBMS_RANDOM.VALUE(1000, 2000);
    END LOOP;

    FOR i IN number_table.FIRST..number_table.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(TRIM(TO_CHAR(i, '00')) || ': ' || number_table(i));
    END LOOP;
END;