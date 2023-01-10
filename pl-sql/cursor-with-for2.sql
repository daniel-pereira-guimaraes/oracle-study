SET SERVEROUTPUT ON

BEGIN
    FOR countryRecord IN (SELECT country_id, country_name FROM countries) LOOP
        DBMS_OUTPUT.PUT_LINE(
            countryRecord.country_id || ' - ' ||
            countryRecord.country_name);
    END LOOP;
END;