CREATE TABLE job_salaries(
    year NUMBER(4) NOT NULL,
    month NUMBER(2) NOT NULL,
    it_prog NUMBER(8,2) NOT NULL,
    sa_man NUMBER(8,2) NOT NULL,
    st_man NUMBER(8,2) NOT NULL
);

INSERT INTO job_salaries (year, month, it_prog, sa_man, st_man)
VALUES (2015, 9, 31300, 61000, 36400);

INSERT INTO job_salaries (year, month, it_prog, sa_man, st_man)
VALUES (2015, 8, 35000, 79500, 37000);

COMMIT;

SELECT * FROM job_salaries;

CREATE TABLE job_total_salary(
    year NUMBER(4) NOT NULL,
    month NUMBER(2) NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    total_salary NUMBER(8,2) NOT NULL
);

INSERT ALL
    INTO job_total_salary VALUES(year, month, 'IT_PROG', it_prog)
    INTO job_total_salary VALUES(year, month, 'SA_MAN', sa_man)
    INTO job_total_salary VALUES(year, month, 'ST_MAN', st_man)
SELECT * FROM job_salaries;

COMMIT;

SELECT * FROM job_total_salary;
