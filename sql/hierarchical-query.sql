CREATE TABLE item(
    item_id INTEGER NOT NULL,
    item_name VARCHAR(20) NOT NULL,
    owner_id INTEGER,
    CONSTRAINT pk_item PRIMARY KEY(item_id),
    CONSTRAINT fk_item_owner FOREIGN KEY(owner_id) REFERENCES item(item_id)
);

INSERT INTO item(item_id, item_name, owner_id) VALUES(1, 'Computer', null);
INSERT INTO item(item_id, item_name, owner_id) VALUES(2, 'Mainboard', 1);
INSERT INTO item(item_id, item_name, owner_id) VALUES(3, 'HD', 2);
INSERT INTO item(item_id, item_name, owner_id) VALUES(4, 'RAM', 2);
INSERT INTO item(item_id, item_name, owner_id) VALUES(5, 'Processor', 2);
INSERT INTO item(item_id, item_name, owner_id) VALUES(6, 'Clock', 5);
INSERT INTO item(item_id, item_name, owner_id) VALUES(7, 'Register', 5);
INSERT INTO item(item_id, item_name, owner_id) VALUES(8, 'Control Unit', 5);
INSERT INTO item(item_id, item_name, owner_id) VALUES(9, 'Partition A', 3);
INSERT INTO item(item_id, item_name, owner_id) VALUES(10, 'Partition B', 3);
INSERT INTO item(item_id, item_name, owner_id) VALUES(11, 'Directory1', 9);
INSERT INTO item(item_id, item_name, owner_id) VALUES(12, 'Directory2', 9);
INSERT INTO item(item_id, item_name, owner_id) VALUES(13, 'Document.pdf', 11);
INSERT INTO item(item_id, item_name, owner_id) VALUES(14, 'Text.txt', 12);
INSERT INTO item(item_id, item_name, owner_id) VALUES(15, 'Photo.jpg', 12);

SELECT * FROM item;

-- UP to DOWN:
SELECT RPAD(' ', 2 * (level - 1), ' ') || item_name FROM item 
START WITH owner_id IS NULL
CONNECT BY PRIOR item_id = owner_id

-- with WHERE:
SELECT RPAD(' ', 2 * (level - 1), ' ') || item_name FROM item 
WHERE level > 2
START WITH owner_id IS NULL
CONNECT BY PRIOR item_id = owner_id

-- Remove branch:
SELECT RPAD(' ', 2 * (level - 1), ' ') || item_name FROM item 
START WITH owner_id IS NULL
CONNECT BY PRIOR item_id = owner_id 
	AND item_id <> 5

-- DOWN to UP:
SELECT RPAD(' ', 2 * (level - 1), ' ') || item_name FROM item 
START WITH item_id = 9
CONNECT BY PRIOR owner_id = item_id;