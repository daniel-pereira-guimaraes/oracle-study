-- Set substitution variable value:
DEFINE employee_id = 170;

-- Show substitution variable:
DEFINE employee_id;

-- Use substitution variable:
SELECT * FROM employees WHERE employee_id = &employee_id;

-- Use and memorize substitution variable:
SELECT * FROM employees WHERE employee_id = &&employee_id;

-- Remove substitution variable:
UNDEFINE employee_id;