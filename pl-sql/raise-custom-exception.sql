SET SERVEROUTPUT ON

ACCEPT pId NUMBER PROMPT 'Enter employee ID: ';
DECLARE
    vId INTEGER := &pId;
    vName VARCHAR2(50);
    vSalary employees.salary%TYPE;
    vJobId employees.job_id%TYPE;
    eAccessDenied EXCEPTION;
BEGIN
    SELECT first_name || ' ' || last_name, salary, job_id
    INTO vName, vSalary, vJobId
    FROM employees
    WHERE employee_id = vId;

    IF vJobId = 'AD_PRES' THEN
        RAISE eAccessDenied;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Name..: ' || vName);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || vJobId);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || TRIM(TO_CHAR(vSalary, '999G999D99')));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee ID not found: ' || vId);
    WHEN eAccessDenied THEN
        RAISE_APPLICATION_ERROR(-20002, 'Access denied!');
END;