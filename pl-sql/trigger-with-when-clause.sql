DROP TABLE salary_increase;

CREATE TABLE salary_increase(
    date_time TIMESTAMP DEFAULT SYSDATE NOT NULL,
    user_name VARCHAR2(128) DEFAULT USER NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    old_salary NUMBER(8,2),
    new_salary NUMBER(8,2)
);

-- bur = before update row
CREATE OR REPLACE TRIGGER tg_bur_employees_salary_inc
    BEFORE UPDATE OF salary
    ON employees FOR EACH ROW 
    WHEN (NEW.salary > OLD.salary)
BEGIN
    INSERT INTO salary_increase(
        employee_id, 
        old_salary, 
        new_salary)
    VALUES(
        :NEW.employee_id,
        :OLD.salary, 
        :NEW.salary);
END;

UPDATE employees SET salary = salary * 1.1 WHERE job_id = 'IT_PROG';

SELECT * FROM salary_increase;

UPDATE employees SET salary = salary * 0.9 WHERE job_id = 'IT_PROG';

SELECT * FROM salary_increase;
