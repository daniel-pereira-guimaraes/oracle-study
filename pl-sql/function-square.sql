CREATE OR REPLACE FUNCTION fn_square(x NUMBER) RETURN NUMBER 
AS
BEGIN
    RETURN x * x;
END;


SELECT fn_square(15) FROM dual;