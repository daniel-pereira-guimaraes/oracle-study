CREATE TABLE job_salary_range(
    job_id VARCHAR2(10) NOT NULL,
    min_salary NUMBER(8,2) NOT NULL,
    max_salary NUMBER(8,2) NOT NULL
);

MERGE INTO job_salary_range jsr
USING (
    SELECT
        job_id,
        MIN(salary) min_sal,
        MAX(salary) max_sal
    FROM employees
    GROUP BY job_id) sel
ON (jsr.job_id = sel.job_id)
WHEN MATCHED THEN
    UPDATE SET 
        jsr.min_salary = sel.min_sal,
        jsr.max_salary = sel.max_sal
WHEN NOT MATCHED THEN
    INSERT(job_id, min_salary, max_salary)
    VALUES(sel.job_id, sel.min_sal, sel.max_sal);
    
SELECT * FROM job_salary_range;