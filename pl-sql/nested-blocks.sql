SET SERVEROUTPUT ON
DECLARE 
    stateName VARCHAR2(10) := 'Rondônia';
    countryName VARCHAR2(10) := 'Brazil';
    salary NUMBER(11,2) := 5000;
BEGIN

    DBMS_OUTPUT.PUT_LINE('--- MAIN BLOCK ---');
    DBMS_OUTPUT.PUT_LINE('State: ' || stateName);
    DBMS_OUTPUT.PUT_LINE('Country: ' || countryName);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(salary, '999G999D99'));
    DBMS_OUTPUT.PUT_LINE('');
    
    DECLARE
        stateName VARCHAR2(15) := 'New York';
        countryName VARCHAR(30) := 'United States of America';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- CHILD BLOCK 1 ---');
        DBMS_OUTPUT.PUT_LINE('State: ' || stateName);
        DBMS_OUTPUT.PUT_LINE('Country: ' || countryName);
        DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(salary, '999G999D99'));
        DBMS_OUTPUT.PUT_LINE('');
        salary := salary * 1.1;
    END;
    
    DECLARE
        stateName VARCHAR2(10) := 'Padova';
        countryName VARCHAR(5) := 'Italy';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- CHILD BLOCK 2 ---');
        DBMS_OUTPUT.PUT_LINE('State: ' || stateName);
        DBMS_OUTPUT.PUT_LINE('Country: ' || countryName);
        DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(salary, '999G999D99'));
        DBMS_OUTPUT.PUT_LINE('');
        salary := salary + 1000;
    END;

    DBMS_OUTPUT.PUT_LINE('--- MAIN BLOCK END ---');
    DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(salary, '999G999D99'));
END;