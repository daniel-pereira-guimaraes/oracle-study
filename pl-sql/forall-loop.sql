SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_salary_increase(p_percent NUMBER) 
AS  
    TYPE id_list_type IS TABLE OF employees.employee_id%TYPE 
        INDEX BY BINARY_INTEGER;
    id_list id_list_type;
    v_factor NUMBER;
BEGIN
    v_factor := 1 + p_percent / 100;

    SELECT employee_id 
    BULK COLLECT INTO id_list 
    FROM employees;
        
    DBMS_OUTPUT.PUT_LINE('Updating ' || id_list.COUNT || ' records...');

    /* FORALL performs all updates with a single context switch 
        between SQL and PL/SQL (best performance).
    */
    FORALL i IN 1..id_list.COUNT 
        UPDATE employees SET salary = salary * v_factor 
        WHERE employee_id = id_list(i);
END;

EXEC sp_salary_increase(10);