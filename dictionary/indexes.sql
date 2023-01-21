-- Indexes:

SELECT * FROM user_indexes;

SELECT * FROM all_indexes
WHERE table_owner = 'HR'
  AND table_name = 'EMPLOYEES';

SELECT * FROM dba_indexes;  

-- Indexes columns:
SELECT * FROM all_ind_columns;