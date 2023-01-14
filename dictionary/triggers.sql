SELECT * FROM user_triggers;
SELECT * FROM all_triggers;
SELECT * FROM dba_triggers;

SELECT * FROM user_triggers 
WHERE table_owner = 'HR' AND table_name = 'EMPLOYEES';