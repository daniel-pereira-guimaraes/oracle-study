SET SERVEROUTPUT ON

DECLARE
    TYPE countries_varray_type IS VARRAY(100) OF countries%rowtype;
    countries_varray countries_varray_type := countries_varray_type();
BEGIN
    SELECT * BULK COLLECT INTO countries_varray 
    FROM countries 
    ORDER BY country_id;
    
    FOR i IN countries_varray.FIRST..countries_varray.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(
            countries_varray(i).country_id || ' - ' || 
            countries_varray(i).country_name);
    END LOOP;
END;