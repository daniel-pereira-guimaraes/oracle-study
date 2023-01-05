BEGIN
    INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
    VALUES('FI_PLAN', 'Finance Planner', 5000, 10000);

    SAVEPOINT insert_ok;
    UPDATE jobs SET min_salary = 7000 WHERE job_id = 'FI_PLAN';
    
    ROLLBACK TO SAVEPOINT insert_ok;
    
    COMMIT;
END;