-- Create Example.java:
public class Example {

	static private String name;

	static public String getName() {
		return Example.name;
	}

	static public void setName(String name) {
		Example.name = name;
	}

}

-- Compile Example.java:
javac Example.java

-- Load java class into hr database:
loadjava -user hr/hr Example.class

-- Check Java object on database:
SELECT * FROM all_objects 
WHERE object_type='JAVA CLASS'
  AND object_name='Example';
  
-- Create procedure for Example.setName method:
CREATE OR REPLACE PROCEDURE sp_example_set_name(s VARCHAR2) 
AS LANGUAGE JAVA NAME 'Example.setName(java.lang.String)';

-- Create function for Example.getName method:
CREATE OR REPLACE FUNCTION fn_example_get_name RETURN VARCHAR2
AS LANGUAGE JAVA NAME 'Example.getName() return java.lang.String';

-- Test:
SET SERVEROUTPUT ON;
DECLARE
    ret VARCHAR2(100);
BEGIN
    sp_example_set_name('Daniel');
    ret := fn_example_get_name;
    DBMS_OUTPUT.PUT_LINE(ret);
END;