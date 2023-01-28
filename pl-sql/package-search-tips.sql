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
        v_select := 'SELECT * FROM (' || p_select || ') temp WHERE 1=0';
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
    
    FUNCTION search_tips(p_sql VARCHAR2, p_text VARCHAR2) 
        RETURN type_search_tips_table
    AS
        v_fields type_string_list;
        v_values type_string_list;
        v_result type_search_tips_table := type_search_tips_table();
        c_cursor SYS_REFCURSOR;
        n_cursor NUMBER;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- FIELDS ---');
        v_fields := get_field_names(p_sql);
        FOR i IN 1..v_fields.LAST LOOP
            DBMS_OUTPUT.PUT_LINE(v_fields(i));
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('--- VALUES ---');
        v_values := text_split(p_text, ' ');
        FOR i IN 1..v_values.LAST LOOP
            DBMS_OUTPUT.PUT_LINE(v_values(i));
        END LOOP;
        
        RETURN v_result;
    END;

END;

SET SERVEROUTPUT ON;

DECLARE
    v_sql VARCHAR2(30) := 'SELECT * FROM employees';
    v_text VARCHAR2(50) := 'Daniel Pereira Guimarães';
BEGIN
    FOR r IN (SELECT * FROM pack_search_tips.search_tips(v_sql, v_text)) LOOP
        DBMS_OUTPUT.PUT_LINE(r.field_name || ': ' || r.search_value);
    END LOOP;
END;