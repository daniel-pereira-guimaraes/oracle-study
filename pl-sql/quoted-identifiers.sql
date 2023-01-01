SET SERVEROUTPUT ON
DECLARE
    "Number 1" NUMBER(11,2) := 10;
    "Number 2" NUMBER(11,2) := 5;
    "Arithmetic average" NUMBER(11,2);
BEGIN
    "Arithmetic average" := ("Number 1" + "Number 2") / 2;
    DBMS_OUTPUT.PUT_LINE('First number: ' || "Number 1");
    DBMS_OUTPUT.PUT_LINE('Second number: ' || "Number 2");
    DBMS_OUTPUT.PUT_LINE('Average: ' || "Arithmetic average");
END;