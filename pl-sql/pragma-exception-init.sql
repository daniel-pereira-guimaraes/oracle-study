SET SERVEROUTPUT ON

ACCEPT pId NUMBER PROMPT 'Enter employee ID: ';
DECLARE
    vCountryId countries.country_id%TYPE := 'BR';
    vRegionId regions.region_id%TYPE := 10; -- Not found!
    eFkNotFound EXCEPTION;
    PRAGMA EXCEPTION_INIT(eFkNotFound, -2291); -- SQLCODE for FK not found!
BEGIN
    UPDATE countries SET region_id = vRegionId WHERE country_id = vCountryId;
    DBMS_OUTPUT.PUT_LINE('Update success!');
EXCEPTION
    WHEN eFkNotFound THEN
        DBMS_OUTPUT.PUT_LINE('Foreign key not found!');
END;