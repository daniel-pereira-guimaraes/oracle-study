SET SERVEROUTPUT ON;

ACCEPT in_percent PROMPT  'Enter percent:';
DECLARE
    v_sql VARCHAR(100) := 'UPDATE employees SET salary = salary * (1 + :p / 100)';
    v_percent NUMBER := &in_percent;
    v_cursor_id INTEGER;
    v_rows_affected INTEGER;
BEGIN
    v_cursor_id := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(v_cursor_id, v_sql, DBMS_SQL.NATIVE);
    DBMS_SQL.BIND_VARIABLE(v_cursor_id, ':p', v_percent);
    v_rows_affected := DBMS_SQL.EXECUTE(v_cursor_id);
    DBMS_SQL.CLOSE_CURSOR(v_cursor_id);
    --COMMIT;
    DBMS_OUTPUT.PUT_LINE('Rows affected: ' || v_rows_affected);
END;