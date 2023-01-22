CREATE TABLE no_salary(
    first_name VARCHAR2(20) NOT NULL
);

CREATE TABLE low_salary(
    first_name VARCHAR2(20) NOT NULL,
    salary NUMBER(8,2) NOT NULL
);

CREATE TABLE middle_salary(
    first_name VARCHAR2(20) NOT NULL,
    salary NUMBER(8,2) NOT NULL
);

CREATE TABLE high_salary(
    first_name VARCHAR2(20) NOT NULL,
    salary NUMBER(8,2) NOT NULL
);

/*
Syntax:

INSERT FIRST
	WHEN condition1 THEN
		INTO ... VALUES(...)
		INTO ... VALUES(...)
		...
	WHEN condition2 THEN
		INTO ... VALUES(...)
		INTO ... VALUES(...)
		...
	...
	WHEN conditionN THEN
		INTO ... VALUES(...)
		INTO ... VALUES(...)
		...
	ELSE
		INTO ... VALUES(...)
		INTO ... VALUES(...)
		...
SELECT ... FROM ...	
*/

INSERT FIRST
    WHEN salary IS NULL OR salary <= 0 THEN
        INTO no_salary(first_name) VALUES(first_name)
    WHEN salary <= 5000 THEN
        INTO low_salary(first_name, salary) VALUES(first_name, salary)
    WHEN salary <= 10000 THEN
        INTO middle_salary(first_name, salary) VALUES(first_name, salary)
    ELSE
        INTO high_salary(first_name, salary) VALUES(first_name, salary)
SELECT
    first_name, 
    salary
FROM employees;