-- REGEXP_LIKE 

SELECT * FROM employees
WHERE REGEXP_LIKE(phone_number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$');

SELECT first_name, last_name FROM employees
WHERE REGEXP_LIKE(first_name, 'H(e|n)', 'i');

SELECT first_name, last_name FROM employees
WHERE REGEXP_LIKE(first_name, '^H.*n$', 'i');

DROP TABLE employees_copy;

CREATE TABLE employees_copy AS SELECT * FROM employees WHERE 1=2;

ALTER TABLE employees_copy
ADD CONSTRAINT check_phone_number CHECK(
    REGEXP_LIKE(phone_number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$'));

-- REGEXP_REPLACE

SELECT 
    phone_number phone1, 
    REGEXP_REPLACE(phone_number, '\.[0-9]{2}\.', '.XX.') phone2
FROM employees;

-- REGEXP_SUBSTR

CREATE TABLE person_names AS 
    SELECT first_name || ' ' || last_name AS full_name FROM employees;

SELECT 
    full_name, 
    RTRIM(REGEXP_SUBSTR(full_name, '^[A-Z][[:alpha:]]+ ')) first_name,
    RTRIM(REGEXP_SUBSTR(full_name, ' [A-Z][[:alpha:]]+$')) last_name
FROM person_names;

-- REGEXP_INSTR

SELECT * FROM (
    SELECT 
        first_name,
        REGEXP_INSTR(first_name, '(e|i)l{1,2}(e|i|y)', 1, 1, 0, 'i') AS pos
    FROM employees
    ORDER BY first_name) temp
WHERE temp.pos > 0;

-- REGEXP_COUNT

SELECT * FROM (
    SELECT 
        first_name,
        REGEXP_COUNT(first_name, '(a|e|e|i|o|u)') AS lower_vowel_count
    FROM employees
    ORDER BY first_name) temp
WHERE temp.lower_vowel_count > 0;

SELECT * FROM (
    SELECT 
        first_name,
        REGEXP_COUNT(first_name, '(a|e|e|i|o|u)', 1, 'i') AS vowel_count
    FROM employees
    ORDER BY vowel_count DESC) temp
WHERE temp.vowel_count > 0;
