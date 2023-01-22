CREATE TABLE person(
    id NUMBER(6) NOT NULL 
        CONSTRAINT pk_person PRIMARY KEY
        USING INDEX (CREATE INDEX idx_person_id ON person(id)),
    first_name VARCHAR2(20) NOT NULL
);

-- OR --

CREATE TABLE person(
    id NUMBER(6) NOT NULL,
    first_name VARCHAR2(20) NOT NULL
);

CREATE INDEX idx_person_id ON person(id);

ALTER TABLE person
ADD CONSTRAINT pk_person PRIMARY KEY(Id) USING INDEX idx_person_id;
