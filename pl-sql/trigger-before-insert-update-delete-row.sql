DROP TABLE employees_salary_log;

CREATE TABLE employees_salary_log(
    date_time TIMESTAMP DEFAULT SYSDATE NOT NULL,
    user_name VARCHAR2(128) DEFAULT USER NOT NULL,
    operation CHAR(1) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    employee_name VARCHAR2(50) NOT NULL,
    old_salary NUMBER(8,2),
    new_salary NUMBER(8,2)
);

-- biudr = before, insert, update, delete, row
CREATE OR REPLACE TRIGGER tg_biudr_employees_salary
    BEFORE INSERT OR UPDATE OF salary OR DELETE 
    ON employees FOR EACH ROW 
DECLARE
    v_operation CHAR(1);
    v_id employees_salary_log.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    v_name employees_salary_log.employee_name%TYPE;
BEGIN
    IF INSERTING THEN
        v_operation := 'I';
    ELSIF UPDATING THEN
        v_operation := 'U';
    ELSE
        v_operation := 'D';
    END IF;

    IF DELETING THEN
        v_id := :OLD.employee_id;
        v_first_name := :OLD.first_name;
        v_last_name := :OLD.last_name;
    ELSE 
        v_id := :NEW.employee_id;
        v_first_name := :NEW.first_name;
        v_last_name := :NEW.last_name;
    END IF;
    
    v_name := NVL(v_first_name || ' ', '') || v_last_name;
    
    INSERT INTO employees_salary_log(
        operation, 
        employee_id, 
        employee_name,
        old_salary, 
        new_salary)
    VALUES(
        v_operation, 
        v_id, 
        v_name,
        :OLD.salary, 
        :NEW.salary);
END;

INSERT INTO employees(
    employee_id, 
    first_name, 
    last_name, 
    email, 
    hire_date, 
    job_id, 
    salary)
values(
    employees_seq.nextval,
    'Daniel',
    'Guimarães',
    'dguimaraes',
    sysdate,
    'IT_PROG',
    10000);

UPDATE employees SET salary = salary * 1.1 WHERE job_id = 'IT_PROG';

DELETE FROM employees WHERE email = 'dguimaraes';

SELECT * FROM employees_salary_log;