SET SERVEROUTPUT ON;

DECLARE
    TYPE list_cursor_type IS REF CURSOR;
    TYPE list_record_type IS RECORD (first_name VARCHAR(20), last_name VARCHAR(25));
    list_cursor list_cursor_type;
    list_record list_record_type;
    c_sql CONSTANT VARCHAR(100) := 'SELECT first_name, last_name FROM employees WHERE job_id = :p_job_id';
    c_job_id VARCHAR(7) := 'IT_PROG';
BEGIN
    OPEN list_cursor FOR c_sql USING c_job_id;
    LOOP
        FETCH list_cursor INTO list_record;
        
        EXIT WHEN list_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(list_record.first_name || ' - ' || list_record.last_name);
    END LOOP;
    CLOSE list_cursor;
END;