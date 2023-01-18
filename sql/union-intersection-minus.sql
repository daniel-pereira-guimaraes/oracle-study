SELECT first_name, job_id, salary FROM employees WHERE job_id = 'IT_PROG'
UNION
SELECT first_name, job_id, salary FROM employees WHERE salary > 5000;

SELECT first_name, job_id, salary FROM employees WHERE job_id = 'IT_PROG'
UNION ALL
SELECT first_name, job_id, salary FROM employees WHERE salary = 5000;

SELECT first_name, job_id, salary FROM employees WHERE job_id = 'IT_PROG'
INTERSECT
SELECT first_name, job_id, salary FROM employees WHERE salary = 5000;

SELECT first_name, job_id, salary FROM employees WHERE job_id = 'IT_PROG'
MINUS
SELECT first_name, job_id, salary FROM employees WHERE salary = 5000;
