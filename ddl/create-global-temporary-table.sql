CREATE GLOBAL TEMPORARY TABLE temp_table_one(
    id NUMBER(6) NOT NULL,
    name VARCHAR(50) NOT NULL
) ON COMMIT DELETE ROWS; -- Default!

CREATE GLOBAL TEMPORARY TABLE temp_table_two(
    id NUMBER(6) NOT NULL,
    name VARCHAR(50) NOT NULL
) ON COMMIT PRESERVE ROWS;

INSERT INTO temp_table_one SELECT employee_id, first_name FROM employees;

INSERT INTO temp_table_two SELECT employee_id, first_name FROM employees;

SELECT * FROM temp_table_one;

SELECT * FROM temp_table_two;

COMMIT;

SELECT * FROM temp_table_one;

SELECT * FROM temp_table_two;
