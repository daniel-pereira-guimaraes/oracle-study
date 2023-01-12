SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE sp_insert_region(pid INTEGER, pname VARCHAR2)
AS
BEGIN
    INSERT INTO regions(region_id, region_name) VALUES(pid, pname);
END;

DECLARE
    vrec_count1 INTEGER;
    vrec_count2 INTEGER;
BEGIN
    SELECT COUNT(*) INTO vrec_count1 FROM regions;
    sp_insert_region(5, 'Other');
    SELECT COUNT(*) INTO vrec_count2 FROM regions;
    DBMS_OUTPUT.PUT_LINE('Record count before insert: ' || vrec_count1);
    DBMS_OUTPUT.PUT_LINE('Record count after insert: ' || vrec_count2);
    --COMMIT;
END;