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
    
    FUNCTION search_tips(p_sql VARCHAR2, p_text VARCHAR2) 
        RETURN type_search_tips_table
    AS
        v_values type_string_list;
        v_result type_search_tips_table := type_search_tips_table();
    BEGIN
        v_values := text_split(p_text, ' ');
        FOR i IN 1..v_values.LAST LOOP
            DBMS_OUTPUT.PUT_LINE(v_values(i));
        END LOOP;
        RETURN v_result;
    END;

END;

SET SERVEROUTPUT ON;

BEGIN
    FOR r IN (SELECT * FROM pack_search_tips.search_tips('', 'Daniel Pereira Guimarães')) LOOP
        DBMS_OUTPUT.PUT_LINE(r.field_name || ': ' || r.search_value);
    END LOOP;
END;