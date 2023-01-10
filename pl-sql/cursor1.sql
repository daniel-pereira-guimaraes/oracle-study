SET SERVEROUTPUT ON

DECLARE
    CURSOR countriesCursor IS SELECT country_id, country_name FROM countries;
    countryRecord countriesCursor%ROWTYPE;
BEGIN
    OPEN countriesCursor;
    FETCH countriesCursor INTO countryRecord;
    DBMS_OUTPUT.PUT_LINE('--- Begin ---');
    WHILE countriesCursor%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(
            countryRecord.country_id || ' - ' ||
            countryRecord.country_name);
        FETCH countriesCursor INTO countryRecord;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('--- End ---');
    CLOSE countriesCursor;
END;