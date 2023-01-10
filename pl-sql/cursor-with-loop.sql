SET SERVEROUTPUT ON

DECLARE
    CURSOR countriesCursor IS SELECT country_id, country_name FROM countries;
    countryRecord countriesCursor%ROWTYPE;
BEGIN
    OPEN countriesCursor;
    
    DBMS_OUTPUT.PUT_LINE('--- Begin ---');
    LOOP 
        FETCH countriesCursor INTO countryRecord;
        EXIT WHEN countriesCursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            countryRecord.country_id || ' - ' ||
            countryRecord.country_name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('--- End ---');
    
    CLOSE countriesCursor;
END;