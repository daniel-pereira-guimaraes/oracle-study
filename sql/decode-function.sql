SELECT first_name, last_name, job_id, salary, 
    DECODE(job_id, 
        'IT_PROG', salary * 1.1,
        'FI_ACCOUNT', salary * 1.2,
        'FI_MGR', salary * 1.3,
        salary) new_salary
FROM employees