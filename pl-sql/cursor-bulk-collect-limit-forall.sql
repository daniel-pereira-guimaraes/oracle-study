SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_salary_increase(p_percent NUMBER) 
AS  
    CURSOR id_list_cursor IS SELECT employee_id FROM employees;
    TYPE id_list_type IS TABLE OF employees.employee_id%TYPE;
    id_list id_list_type;
    salary_factor NUMBER;
    update_limit CONSTANT INTEGER := 20;
    update_total INTEGER := 0;
BEGIN
    salary_factor := 1 + p_percent / 100;

    OPEN id_list_cursor;
    LOOP
        FETCH id_list_cursor BULK COLLECT INTO id_list LIMIT update_limit;
        
        EXIT WHEN id_list.COUNT = 0;

        DBMS_OUTPUT.PUT_LINE('Updating ' || id_list.COUNT || ' records...');
        
        FORALL i IN 1..id_list.COUNT 
            UPDATE employees SET 
                salary = salary * salary_factor 
            WHERE employee_id = id_list(i);
            
        update_total := update_total + id_list.COUNT;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Update total: ' || update_total || ' records...');
END;

EXEC sp_salary_increase(10);