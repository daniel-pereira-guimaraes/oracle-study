CREATE TABLE salary_history(
    employee_id NUMBER(6) NOT NULL,
    year NUMBER(4) NOT NULL,
    month NUMBER(2) NOT NULL,
    salary NUMBER(8,2),
    CONSTRAINT pk_salary_history PRIMARY KEY(employee_id, year, month)
);

CREATE TABLE email_list(
    email VARCHAR(70) NOT NULL PRIMARY KEY,
    name VARCHAR2(50) NOT NULL
);
    
-- Inconditional insert all
INSERT ALL
    INTO salary_history(employee_id, year, month, salary) 
        VALUES(employee_id, EXTRACT(YEAR FROM hire_date), 
            EXTRACT(MONTH FROM hire_date), salary)
    INTO email_list(email, name) 
        VALUES(email, COALESCE(first_name || ' ', '') || last_name)
SELECT * FROM employees;

-- Prepare for next test:
DELETE FROM salary_history;
DELETE FROM email_list;

-- Conditional insert all:
INSERT ALL
    WHEN salary IS NOT NULL THEN
        INTO salary_history(employee_id, year, month, salary) 
        VALUES(employee_id, EXTRACT(YEAR FROM hire_date), 
            EXTRACT(MONTH FROM hire_date), salary)
    WHEN email LIKE '%@%' THEN
        INTO email_list(email, name) 
        VALUES(email, COALESCE(first_name || ' ', '') || last_name)
SELECT * FROM employees;  