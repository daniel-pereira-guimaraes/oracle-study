CREATE OR REPLACE TYPE multiplication_table_row IS OBJECT (
    first_number INTEGER,
    second_number INTEGER,
    result_number INTEGER
)

CREATE OR REPLACE TYPE multiplication_table IS TABLE OF multiplication_table_row;

CREATE OR REPLACE FUNCTION fn_multiplication_table(n NUMBER)
    RETURN multiplication_table
AS
    v_table multiplication_table := multiplication_table();
    v_second_number INTEGER;
BEGIN
    FOR v_second_number IN 1..10 LOOP
        v_table.extend;
        v_table(v_second_number) := multiplication_table_row(n, v_second_number, n * v_second_number);
    END LOOP;
    RETURN v_table;    
END;

SELECT * FROM TABLE(fn_multiplication_table(5));