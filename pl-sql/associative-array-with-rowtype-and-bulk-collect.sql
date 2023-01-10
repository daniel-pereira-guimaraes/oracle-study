SET SERVEROUTPUT ON

DECLARE
    TYPE countries_table_type IS TABLE OF countries%rowtype INDEX BY BINARY_INTEGER;
    countries_table countries_table_type;
BEGIN
    SELECT * BULK COLLECT INTO countries_table 
    FROM countries 
    ORDER BY country_id;
    
    FOR i IN countries_table.FIRST..countries_table.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(
            countries_table(i).country_id || ' - ' || 
            countries_table(i).country_name);
    END LOOP;
END;