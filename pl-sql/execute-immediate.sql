SET SERVEROUTPUT ON;

ACCEPT table_name PROMPT 'Enter table name: ';

DECLARE
    v_table_name VARCHAR(30) := '&table_name';
    v_sql VARCHAR(100);
    v_count INTEGER;
BEGIN
    v_sql := 'SELECT COUNT(*) FROM ' || v_table_name;
    EXECUTE IMMEDIATE v_sql INTO v_count;
    DBMS_OUTPUT.PUT_LINE('SQL: ' || v_sql);
    DBMS_OUTPUT.PUT_LINE('Table name: ' || v_table_name);
    DBMS_OUTPUT.PUT_LINE('Record count: ' || v_count);
END;