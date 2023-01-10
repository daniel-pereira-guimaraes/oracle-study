SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT countryCode PROMPT 'Enter country code: ';
DECLARE
    TYPE country_table_type IS TABLE OF VARCHAR2(20) INDEX BY VARCHAR2(2);
    country_table country_table_type;
BEGIN
    country_table('BR') := 'Brazil';
    country_table('IT') := 'Italy';
    country_table('US') := 'United States';
    country_table('PT') := 'Portugal';
    DBMS_OUTPUT.PUT_LINE('Country name: ' || country_table(UPPER('&countryCode')));
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Country code not found!');
END;