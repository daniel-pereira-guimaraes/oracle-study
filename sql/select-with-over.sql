SELECT
    first_name, 
    last_name, 
    job_id,
    salary,
    MAX(salary) OVER (PARTITION BY job_id)
FROM employees;

-- Using OVER
SELECT job_id, salary FROM 
    (SELECT 
        job_id, 
        salary, 
        MAX(salary) OVER (PARTITION BY job_id) AS max_salary
     FROM employees)
WHERE salary = max_salary
ORDER BY job_id;

-- Using IN
SELECT job_id, salary FROM employees
WHERE (job_id, salary) IN 
    (SELECT job_id, MAX(salary) FROM employees
     GROUP BY job_id)
ORDER BY job_id;