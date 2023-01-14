-- Enable server output
SET SERVEROUTPUT ON;

-- Package specification (public interface)
CREATE OR REPLACE PACKAGE pkg_counter
AS
    g_value INTEGER;
    PROCEDURE sp_inc(p_inc_value INTEGER);
    PROCEDURE sp_dec(p_dec_value INTEGER);
    PROCEDURE sp_print;
    FUNCTION fn_get RETURN INTEGER;
END;

-- Package body (implementation)
CREATE OR REPLACE PACKAGE BODY pkg_counter
AS
    PROCEDURE sp_inc(p_inc_value INTEGER) AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Incrementing: +(' || p_inc_value || ')');
        g_value := g_value + p_inc_value;
    END;
    
    PROCEDURE sp_dec(p_dec_value INTEGER) AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Decrementing... -(' || p_dec_value || ')');
        g_value := g_value - p_dec_value;
    END;

    PROCEDURE sp_print AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Printing... (' || g_value || ')');
    END;
    
    FUNCTION fn_get RETURN INTEGER AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Getting... (' || g_value || ')');
        RETURN g_value;
    END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting package for current session.');
    g_value := 0;
END;

-- Re-compile package
ALTER PACKAGE pkg_counter COMPILE SPECIFICATION;
ALTER PACKAGE pkg_counter COMPILE BODY;

-- Package test.
DECLARE 
    v NUMBER;
BEGIN
    pkg_counter.sp_inc(1); -- 1
    pkg_counter.sp_inc(2); -- 3
    pkg_counter.sp_inc(1); -- 4
    pkg_counter.sp_dec(3); -- 1
    pkg_counter.sp_print;
    v := pkg_counter.fn_get;
    DBMS_OUTPUT.PUT_LINE('Value: ' || v);
END;

-- Dropping packge body
DROP PACKAGE BODY pkg_counter;

-- Dropping package body and specification
DROP PACKAGE pkg_counter;