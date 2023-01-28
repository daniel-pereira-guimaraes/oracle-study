CREATE OR REPLACE TYPE type_search_tips_row IS OBJECT (
    field_name VARCHAR2(30),
    search_value VARCHAR2(100)
);

CREATE OR REPLACE TYPE type_search_tips_table
    IS TABLE OF type_search_tips_row;

CREATE OR REPLACE PACKAGE pack_search_tips AS

    FUNCTION search_tips(p_sql VARCHAR2, p_text VARCHAR2) 
        RETURN type_search_tips_table;

END;

CREATE OR REPLACE PACKAGE BODY pack_search_tips AS

    TYPE type_string_list IS TABLE OF VARCHAR2(100);
    
    FUNCTION text_split(p_text VARCHAR2, p_separator CHAR) 
        RETURN type_string_list 
    AS
        v_length INTEGER;
        v_start INTEGER;
        v_end INTEGER;
        v_item VARCHAR2(100);
        v_result type_string_list := type_string_list();
    BEGIN
        v_length := LENGTH(p_text);
        v_start := 1;
        LOOP
            LOOP 
                EXIT WHEN v_start > v_length OR SUBSTR(p_text, v_start, 1) <> p_separator;
                v_start := v_start + 1;
            END LOOP;
            v_end := v_start + 1;
            LOOP
                EXIT WHEN v_end > v_length OR SUBSTR(p_text, v_end, 1) = p_separator;
                v_end := v_end + 1;
            END LOOP;
            v_item := NULLIF(TRIM(SUBSTR(p_text, v_start, v_end - v_start)), '');
            IF v_item IS NOT NULL THEN
                v_result.EXTEND;
                v_result(v_result.LAST) := v_item;
            END IF;
            v_start := v_end + 1;
            EXIT WHEN v_start > v_length;
        END LOOP;
        
        RETURN v_result;
    END;
    
    FUNCTION get_field_names(p_select VARCHAR2) RETURN type_string_list
    AS
        v_result type_string_list := type_string_list();
        v_select VARCHAR2(4000);
        v_cursor PLS_INTEGER;
        v_desc_tab DBMS_SQL.DESC_TAB;
        v_col_count INTEGER;
    BEGIN
        v_select := 'SELECT * FROM (' || p_select || ') WHERE 1=0';
        v_cursor := DBMS_SQL.OPEN_CURSOR;    
        DBMS_SQL.PARSE(v_cursor, v_select, DBMS_SQL.NATIVE);
        DBMS_SQL.DESCRIBE_COLUMNS(v_cursor, v_col_count, v_desc_tab);
        FOR i IN 1..v_desc_tab.COUNT LOOP
            v_result.EXTEND;
            v_result(v_result.LAST) := v_desc_tab(i).col_name;
        END LOOP;
        DBMS_SQL.CLOSE_CURSOR(v_cursor);
        RETURN v_result;        
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_SQL.CLOSE_CURSOR(v_cursor);
            RAISE;
    END;
    
    FUNCTION build_filter(p_fields type_string_list, p_values type_string_list)
        RETURN VARCHAR2
    AS
        v_result VARCHAR2(2000);
        v_field VARCHAR2(30);
        v_value VARCHAR2(100);
    BEGIN
        FOR i IN 1..p_fields.LAST LOOP
            FOR j IN 1..p_values.LAST LOOP
                IF v_result IS NULL THEN
                    v_result := '';
                ELSE
                    v_result := v_result || ' OR ';
                END IF;
                v_field := p_fields(i);
                v_value := '%' || REPLACE(p_values(j), '''', '''''') || '%';
                v_result := v_result || v_field || ' LIKE ''' || v_value || '''';
            END LOOP;
        END LOOP;
        RETURN v_result;
    END;
    
    FUNCTION search_tips(p_sql VARCHAR2, p_text VARCHAR2) 
        RETURN type_search_tips_table
    AS
        v_fields type_string_list;
        v_values type_string_list;
        v_filter VARCHAR2(2000);
        v_select VARCHAR2(4000);
        v_cursor NUMBER;
        v_exec_ret INTEGER;
        v_field_value VARCHAR2(2000);
        v_col_count INTEGER;
        v_result type_search_tips_table := type_search_tips_table();
    BEGIN
        v_fields := get_field_names(p_sql);
        v_values := text_split(p_text, ' ');
        v_filter := build_filter(v_fields, v_values);
        v_select := p_sql;
        IF v_filter IS NOT NULL THEN
            v_select := v_select || ' WHERE ' || v_filter;
        END IF;
        
        v_cursor := DBMS_SQL.OPEN_CURSOR;
        DBMS_SQL.PARSE(v_cursor, v_select, DBMS_SQL.NATIVE);
        v_exec_ret := DBMS_SQL.EXECUTE(v_cursor);
        
        FOR i IN 1..v_fields.LAST LOOP
            DBMS_SQL.DEFINE_COLUMN(v_cursor, i, v_field_value, 2000);
        END LOOP;
        
        LOOP
            EXIT WHEN DBMS_SQL.FETCH_ROWS(v_cursor) = 0;
            FOR i in 1..v_fields.LAST LOOP
                DBMS_SQL.COLUMN_VALUE(v_cursor, i, v_field_value);
                FOR j IN 1..v_values.LAST LOOP
                    IF INSTR(v_field_value, v_values(j)) > 0 THEN
                        v_result.EXTEND;
                        v_result(v_result.LAST) := 
                            type_search_tips_row(v_fields(i), v_values(j));
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_SQL.CLOSE_CURSOR(v_cursor);
        RETURN v_result;
    END;
END;

SET SERVEROUTPUT ON;
DECLARE
    v_sql VARCHAR2(30) := 'SELECT * FROM employees';
    v_text VARCHAR2(50) := 'Douglas Grant 9833';
BEGIN
    FOR r IN (SELECT * FROM pack_search_tips.search_tips(v_sql, v_text)) LOOP
        DBMS_OUTPUT.PUT_LINE(r.field_name || ': ' || r.search_value);
    END LOOP;
END;

SELECT * FROM pack_search_tips.search_tips(
    'SELECT * FROM employees',
    'Douglas Grant 9833');