CREATE TABLE person(id NUMBER(6) NOT NULL, first_name VARCHAR2(20) NOT NULL);

ALTER TABLE person ADD last_name VARCHAR2(30) NOT NULL;

ALTER TABLE person MODIFY first_name VARCHAR(25);

ALTER TABLE person MODIFY id VARCHAR(6);

ALTER TABLE person DROP COLUMN last_name;