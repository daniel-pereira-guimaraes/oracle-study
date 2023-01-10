SET SERVEROUTPUT ON

DECLARE
    CURSOR countriesCursor IS SELECT country_id, country_name FROM countries;
BEGIN
    FOR countryRecord IN countriesCursor LOOP
        DBMS_OUTPUT.PUT_LINE(
            countryRecord.country_id || ' - ' ||
            countryRecord.country_name);
    END LOOP;
END;