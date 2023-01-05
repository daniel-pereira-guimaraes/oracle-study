SET SERVEROUTPUT ON;
BEGIN
    UPDATE employees SET salary = salary * 1.1 WHERE salary < 2500;
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Update OK!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not found!');
    END IF;
    ROLLBACK;
END;