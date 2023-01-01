SET SERVEROUTPUT ON

DECLARE
    date1 DATE := '25-12-22';
    date2 DATE := '25-12-2022';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Date 1: ' || date1);
    DBMS_OUTPUT.PUT_LINE('Date 2: ' || date2);
    DBMS_OUTPUT.PUT_LINE('Formatted date1: ' || TO_CHAR(date1, 'DD/MM/RRRR'));
    DBMS_OUTPUT.PUT_LINE('Formatted date1: ' || TO_CHAR(date1, 'DD/MON/RRRR'));
    DBMS_OUTPUT.PUT_LINE('Formatted date1: ' || TO_CHAR(date1, 'DD/MONTH/RRRR'));
END;