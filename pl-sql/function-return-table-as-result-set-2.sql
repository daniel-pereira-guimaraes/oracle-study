CREATE OR REPLACE TYPE salary_row IS OBJECT (
    first_name VARCHAR2(20),
    last_name VARCHAR2(25),
    salary NUMBER(8,2),
    total NUMBER(10,2)
);

CREATE OR REPLACE TYPE salary_table IS TABLE OF salary_row;

CREATE OR REPLACE FUNCTION fn_get_salary RETURN salary_table 
AS
    v_salary_table salary_table := salary_table();
    v_total NUMBER(10,2) := 0;
BEGIN
    FOR r IN (SELECT first_name, last_name, salary FROM employees) LOOP
        v_total := v_total + r.salary;
        v_salary_table.EXTEND;
        v_salary_table(v_salary_table.LAST) := 
            salary_row(r.first_name, r.last_name, r.salary, v_total);
    END LOOP;
    RETURN v_salary_table;
END;

SELECT * FROM TABLE(fn_get_salary);
