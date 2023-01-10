SET SERVEROUTPUT ON

DECLARE
    TYPE TNumberTable IS TABLE OF NUMBER(4) INDEX BY BINARY_INTEGER;
    vNumberTable TNumberTable;
    vCount BINARY_INTEGER;
    vItem NUMBER(4);
BEGIN
    vCount := DBMS_RANDOM.VALUE(5,10);
    FOR i IN 1..vCount LOOP
        vNumberTable(i) := DBMS_RANDOM.VALUE(1000,2000);
    END LOOP;
    
    vItem := vNumberTable.FIRST;
    WHILE vItem IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(TRIM(TO_CHAR(vItem, '00')) || ': ' || vNumberTable(vItem));
        vItem := vNumberTable.NEXT(vItem);
    END LOOP;
END;