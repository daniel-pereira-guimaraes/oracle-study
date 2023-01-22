DROP TABLE person;

CREATE TABLE person(
    person_id INTEGER NOT NULL PRIMARY KEY,
    person_name VARCHAR2(50) NOT NULL,
    person_email VARCHAR2(70)
);

INSERT INTO person VALUES(1, 'Maria', 'maria@example.com.br');
INSERT INTO person VALUES(2, 'Jhon', 'jhon@example.com');

CREATE INDEX idx_person_email_reverse ON person(REVERSE(person_email));
CREATE INDEX idx_person_name_length ON person(LENGTH(person_name));

SELECT * FROM person 
WHERE REVERSE(person_email) LIKE REVERSE('%.com.br');

SELECT * FROM person ORDER BY LENGTH(person_name);