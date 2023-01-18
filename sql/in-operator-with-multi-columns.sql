SELECT first_name, last_name, job_id, salary FROM employees
WHERE (job_id, salary) IN 
    (SELECT job_id, MAX(salary) FROM employees GROUP BY job_id)