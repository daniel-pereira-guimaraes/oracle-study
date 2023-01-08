SET SERVEROUTPUT ON

ACCEPT id NUMBER PROMPT 'Enter employee ID: ';

DECLARE
    vCommission employees.commission_pct%TYPE;
    vFmtCommission VARCHAR2(10);
BEGIN
    SELECT commission_pct INTO vCommission 
    FROM employees 
    WHERE employees.employee_id = &id;
    
    vFmtCommission := TRIM(TO_CHAR(vCommission * 100, '99D99')) || '%';
    
    CASE 
        WHEN vCommission IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Undefined commission percent!');
        WHEN vCommission < 0.2 THEN
            DBMS_OUTPUT.PUT_LINE('Low commission percent: ' || vFmtCommission);
        ELSE 
            DBMS_OUTPUT.PUT_LINE('Normal commission percent: ' || vFmtCommission);
    END CASE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found!');
END;