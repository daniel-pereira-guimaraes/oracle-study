SET SERVEROUTPUT ON;
BEGIN
    UPDATE employees SET salary = salary * 1.1 WHERE salary < 2500;
    DBMS_OUTPUT.PUT_LINE('Update row count: ' || SQL%ROWCOUNT);
    ROLLBACK;
END;