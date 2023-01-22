CREATE TABLE person(
    person_id INTEGER NOT NULL PRIMARY KEY,
    person_name VARCHAR2(50) NOT NULL,
    person_email VARCHAR2(70),
    insert_date DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO person(person_id, person_name, person_email, insert_date)
VALUES(1, 'Emma', 'emma@example.com', DEFAULT);

INSERT INTO person(person_id, person_name, person_email)
VALUES(2, 'Jhon', 'jhon@example.com');

SELECT * FROM person;
