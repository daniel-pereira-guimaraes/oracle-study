SET SERVEROUTPUT ON;

DECLARE
    c_sql CONSTANT VARCHAR(100) := 'SELECT first_name, last_name FROM employees WHERE job_id = :p_job_id';
    c_job_id VARCHAR(7) := 'IT_PROG';
    v_cursor_id INTEGER;
    v_row_count INTEGER;
    v_first_name VARCHAR(20);
    v_last_name VARCHAR(25);
BEGIN
    v_cursor_id := DBMS_SQL.OPEN_CURSOR;
    
    DBMS_SQL.PARSE(v_cursor_id, c_sql, DBMS_SQL.NATIVE);

    DBMS_SQL.BIND_VARIABLE(v_cursor_id, ':p_job_id', c_job_id);
    
    DBMS_SQL.DEFINE_COLUMN(v_cursor_id, 1, v_first_name, 20);
    DBMS_SQL.DEFINE_COLUMN(v_cursor_id, 2, v_last_name, 25);
    
    v_row_count := DBMS_SQL.EXECUTE_AND_FETCH(v_cursor_id);

    LOOP 
        EXIT WHEN DBMS_SQL.FETCH_ROWS(v_cursor_id) = 0;
        
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, 1, v_first_name);
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, 2, v_last_name);
        
        DBMS_OUTPUT.PUT_LINE(v_first_name || ' - ' || v_last_name);
    END LOOP;

    DBMS_SQL.CLOSE_CURSOR(v_cursor_id);
END;