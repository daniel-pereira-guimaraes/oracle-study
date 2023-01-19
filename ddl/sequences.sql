CREATE SEQUENCE sq_example
INCREMENT BY 2
START WITH 1;

SELECT sq_example.nextval FROM dual;

SELECT sq_example.currval FROM dual; -- Require previos nextval access.