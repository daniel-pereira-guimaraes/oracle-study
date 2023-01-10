SET SERVEROUTPUT ON

DECLARE
    CURSOR countriesCursor(pRegionId INTEGER) IS 
        SELECT 
            c.country_name, 
            r.region_name
        FROM countries c
        JOIN regions r ON r.region_id = c.region_id
        WHERE r.region_id = pRegionId
        ORDER BY c.country_name;
     
    countryRecord countriesCursor%ROWTYPE;
BEGIN
    OPEN countriesCursor(2);
    LOOP 
        FETCH countriesCursor INTO countryRecord;
        
        EXIT WHEN countriesCursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(
            countryRecord.region_name || ' - ' ||
            countryRecord.country_name);
    END LOOP;
    CLOSE countriesCursor;
END;
