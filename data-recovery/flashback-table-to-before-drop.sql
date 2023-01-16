-- ATENTION! 
-- a) Flashback not restore foreign keys!
-- b) Check index names after restore!

CREATE TABLE flashback_drop_test(test_id INTEGER, test_name VARCHAR2(20));

INSERT INTO flashback_drop_test VALUES(1, 'First');
INSERT INTO flashback_drop_test VALUES(2, 'Second');

SELECT * FROM flashback_drop_test;

DROP TABLE flashback_drop_test;

SELECT * FROM user_recyclebin ORDER BY droptime DESC;

FLASHBACK TABLE flashback_drop_test TO BEFORE DROP;

SELECT * FROM user_recyclebin ORDER BY droptime DESC;

SELECT * FROM flashback_drop_test;