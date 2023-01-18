SELECT 
    first_name || ' ' || last_name name,
    NVL(commission_pct, 0) commission,
    NVL2(manager_id, 'Managed', 'Not managed') management,
    COALESCE(phone_number, email, 'Incommunicable') phone_or_email
FROM employees;
