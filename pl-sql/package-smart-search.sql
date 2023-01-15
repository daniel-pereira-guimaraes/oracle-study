CREATE OR REPLACE PACKAGE pkg_smart_search 
AS
    TYPE string_table IS TABLE OF VARCHAR(100);

    TYPE result_record IS RECORD (
        employee_id employees.employee_id%TYPE,
        first_name employees.first_name%TYPE,
        last_name employees.last_name%TYPE,
        email employees.email%TYPE,
        phone employees.phone_number%TYPE);

    TYPE result_table IS TABLE OF result_record;

    FUNCTION fn_split(
        p_text VARCHAR2, 
        p_sep CHAR) 
        RETURN string_table;
 
    FUNCTION fn_smart_search(
        p_fields VARCHAR2 DEFAULT NULL, 
        P_text VARCHAR2 DEFAULT NULL) 
        RETURN result_table;
END;

CREATE OR REPLACE PACKAGE BODY pkg_smart_search 
AS
    FUNCTION fn_split(p_text VARCHAR2, p_sep CHAR) RETURN string_table 
    AS
        len INTEGER;
        p INTEGER;
        i INTEGER;
        item VARCHAR2(100);
        ret string_table := string_table();
        ret_index INTEGER := 1;
    BEGIN
        len := LENGTH(p_text);
        p := 1;
        LOOP
            LOOP 
                EXIT WHEN p > len OR SUBSTR(p_text, p, 1) <> p_sep;
                p := p + 1;
            END LOOP;
            i := p + 1;
            LOOP
                EXIT WHEN i > len OR SUBSTR(p_text, i, 1) = p_sep;
                i := i + 1;
            END LOOP;
            item := NULLIF(TRIM(SUBSTR(p_text, p, i - p)), '');
            IF item IS NOT NULL THEN
                ret.extend;
                ret(ret_index) := item;
            END IF;
            ret_index := ret_index + 1;
            p := i + 1;
            EXIT WHEN p > len;
        END LOOP;
        
        RETURN ret;
    END;
    
    FUNCTION fn_smart_search(
        p_fields VARCHAR2 DEFAULT NULL, 
        P_text VARCHAR2 DEFAULT NULL) 
        RETURN result_table
    AS
        v_sql VARCHAR(1000) := '';
        v_fields string_table;
        v_values string_table;
        v_field VARCHAR(30);
        v_value VARCHAR(100);
        v_has_filter BOOLEAN := FALSE;
        v_result_record result_record;
        v_result_table result_table;
    BEGIN
        v_fields := fn_split(p_fields, ',');
        v_values := fn_split(p_text, ' ');
        FOR i IN 1..v_fields.COUNT LOOP
            FOR j IN 1..v_values.COUNT LOOP
                v_field := v_fields(i);
                v_value := UPPER(v_values(j));
                IF v_field IS NOT NULL AND v_value IS NOT NULL THEN
                    IF v_has_filter THEN
                        v_sql := v_sql || ' OR ';
                    END IF;
                    v_sql := v_sql || 'UPPER(' || v_field || ') LIKE ''%' || v_value || '%'' COLLATE BINARY_AI';
                    v_has_filter := TRUE;
                END IF;
            END LOOP;
        END LOOP;
        IF v_has_filter THEN
            v_sql := ' WHERE ' || v_sql;
        END IF;
        v_sql := 'SELECT employee_id, first_name, last_name, email, phone_number FROM employees' || v_sql;
        EXECUTE IMMEDIATE v_sql BULK COLLECT INTO v_result_table;
        RETURN v_result_table;
    END;

END;

DECLARE
    v pkg_smart_search.result_table;
BEGIN
    v := pkg_smart_search.fn_smart_search('first_name,last_name ', 'guimarães grant smith');
    DBMS_OUTPUT.PUT_LINE('Printing table...');
    FOR i IN 1..v.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v(i).first_name || ' ' || v(i).last_name);
    END LOOP;
END;