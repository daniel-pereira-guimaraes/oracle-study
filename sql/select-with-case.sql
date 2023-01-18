SELECT 
    first_name || ' ' || last_name name,
    CASE 
        WHEN salary <= 0 THEN 'None'
        WHEN salary <= 10000 THEN 'Low'
        WHEN salary <= 20000 then 'Middle'
    ELSE
        'High'
    END salary
FROM employees;
