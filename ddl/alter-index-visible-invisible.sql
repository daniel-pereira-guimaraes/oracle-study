CREATE INDEX idx_person_name ON person(person_name);

ALTER INDEX idx_person_name INVISIBLE;

CREATE BITMAP INDEX idx_person_name2 ON person(person_name);

ALTER INDEX idx_person_name2 INVISIBLE;

ALTER INDEX idx_person_name VISIBLE;