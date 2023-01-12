SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE sp_insert_region(
    pid OUT regions.region_id%TYPE, 
    pname regions.region_name%TYPE
) 
AS
BEGIN
    SELECT NVL(MAX(region_id), 0) + 1 INTO pid FROM regions;
    INSERT INTO regions(region_id, region_name) VALUES(pid, pname);
END;

DECLARE
    vid regions.region_id%TYPE;
    vname regions.region_name%TYPE := 'Other';
BEGIN
    sp_insert_region(vid, vname);
    DBMS_OUTPUT.PUT_LINE('Inserted region: ' || vid || ' - ' || vname);
    --COMMIT;
END;