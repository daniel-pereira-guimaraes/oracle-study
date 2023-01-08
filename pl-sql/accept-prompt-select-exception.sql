SET SERVEROUTPUT ON

ACCEPT vEmployeeId NUMBER PROMPT 'Enter employee ID:';

DECLARE
    vEmployeeId NUMBER := &vEmployeeId;
    vName VARCHAR2(46);
    vEmail employees.email%TYPE;
    vPhone employees.phone_number%TYPE;
    vJob jobs.job_title%TYPE;
    vSalary employees.salary%TYPE;
    vComission employees.commission_pct%TYPE;
    vManager employees.first_name%TYPE;
    vDepartment departments.department_name%TYPE;
BEGIN
    SELECT 
        e.first_name || ' ' || e.last_name,
        e.email,
        e.phone_number,
        j.job_title,
        e.salary,
        e.commission_pct,
        m.first_name,
        d.department_name 
    INTO
        vName,
        vEmail,
        vPhone,
        vJob,
        vSalary,
        vComission,
        vManager,
        vDepartment
    FROM employees e
    LEFT JOIN jobs j ON j.job_id = e.job_id
    LEFT JOIN employees m ON m.employee_id = e.manager_id
    LEFT JOIN departments d ON d.department_id = e.department_id
    WHERE e.employee_id = vEmployeeId;

    DBMS_OUTPUT.PUT_LINE('Name......: ' || vName);
    DBMS_OUTPUT.PUT_LINE('E-mail....: ' || vEmail);
    DBMS_OUTPUT.PUT_LINE('Phone.....: ' || vPhone);
    DBMS_OUTPUT.PUT_LINE('Job.......: ' || vJob);
    DBMS_OUTPUT.PUT_LINE('Salary....: ' || TRIM(TO_CHAR(vSalary, '99G999D99')));
    DBMS_OUTPUT.PUT_LINE('Comission.: ' || TRIM(TO_CHAR(vComission * 100, '99D99')) || '%');
    DBMS_OUTPUT.PUT_LINE('Manager...: ' || vManager);
    DBMS_OUTPUT.PUT_LINE('Department: ' || vDepartment);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID not found: ' || vEmployeeId);
END;