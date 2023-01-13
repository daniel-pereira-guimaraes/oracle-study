DESC user_dependencies;
DESC all_dependencies;
DESC dba_dependencies;

-- Direct dependencies:
SELECT * FROM all_dependencies
WHERE referenced_owner = 'HR' 
  AND referenced_name = 'EMPLOYEES'
  AND referenced_type = 'TABLE';
  
-- Hierarchical dependencies:
SELECT level, name, type 
FROM all_dependencies
START WITH 
    referenced_owner = 'HR' AND
    referenced_name = 'EMPLOYEES' AND 
    referenced_type = 'TABLE'
CONNECT BY 
    PRIOR owner = referenced_owner AND
    PRIOR name = referenced_name AND
    PRIOR type = referenced_type;
	

/* Install deptree on Oracle Database XE 19 on Linux VM */

-- Check utldtree.sql path:
find / -name utldtree.sql

-- Execute on sqlplus:
@/u01/app/oracle/product/version/db_1/rdbms/admin/utldtree.sql


/* Using deptree */

EXEC deptree_fill('TABLE', 'HR', 'EMPLOYEES');
SELECT * FROM deptree ORDER BY seq#;
SELECT * FROM ideptree;