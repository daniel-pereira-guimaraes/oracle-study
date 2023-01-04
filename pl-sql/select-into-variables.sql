SET SERVEROUTPUT ON
DECLARE
    vCountryName countries.country_name%TYPE;
    vRegionName regions.region_name%TYPE;
BEGIN
    SELECT 
        c.country_name, 
        r.region_name 
    INTO 
        vCountryName, 
        vRegionName
    FROM countries c
    JOIN regions r ON r.region_id = c.region_id
    WHERE c.country_id = 'BR';

    DBMS_OUTPUT.PUT_LINE('Country: ' || vCountryName);
    DBMS_OUTPUT.PUT_LINE('Region: ' || vRegionName);
END;