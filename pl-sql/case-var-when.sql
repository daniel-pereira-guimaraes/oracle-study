SET SERVEROUTPUT ON

DECLARE
    vWeekDayNumber NUMBER;
    vWeekDayName VARCHAR2(20);
BEGIN
    vWeekDayNumber := TO_NUMBER(TO_CHAR(SYSDATE, 'D'));
    CASE vWeekDayNumber 
        WHEN 1 THEN vWeekDayName := 'Sunday';
        WHEN 2 THEN vWeekDayName := 'Monday';
        WHEN 3 THEN vWeekDayName := 'Tuesday';
        WHEN 4 THEN vWeekDayName := 'Wednesday';
        WHEN 5 THEN vWeekDayName := 'Thursday';
        WHEN 6 THEN vWeekDayName := 'Friday';
        WHEN 7 THEN vWeekDayName := 'Saturday';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Week day name: ' || vWeekDayName);
END;