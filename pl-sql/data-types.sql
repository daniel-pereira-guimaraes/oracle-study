SET SERVEROUTPUT ON

DECLARE
    num1 NUMBER(11,2) := 18.55;
    num2 NUMBER(11,1) := 18.55;
    num3 NUMBER(11,1) := 18.65;
    num4 NUMBER(5) := 18;
    num5 NUMBER(5) := 18.5;
    num6 NUMBER(25,15) := 1234567890.123456789012345;
    
    int1 BINARY_INTEGER := 12345;
    int2 BINARY_INTEGER := -54321;
    
    float1 BINARY_FLOAT := 15.56;
    float2 BINARY_FLOAT := -123.45;
    
    double1 BINARY_DOUBLE := 1234567890.12345;
    double2 BINARY_DOUBLE := -1234567890.12345;

    char1 CHAR(10) := 'BRAZIL';
    char2 CHAR(2) := 'BR';
    
    vchar1 VARCHAR2(10) := 'BRAZIL';
    vchar2 VARCHAR2(2) := 'BR';
    
    long1 LONG := 'Long text';
    long2 LONG RAW := HEXTORAW('434152'); -- LONG RAW is binary!
    
    nchar1 NCHAR(2) := 'BR'; -- Unicode!
    nvchar1 NVARCHAR2(10) := 'BRAZIL'; -- Unicode!
    
    bool1 BOOLEAN := TRUE;
    bool2 BOOLEAN := FALSE;
    bool3 BOOLEAN := NULL;
    
    date1 DATE := '25-12-22';
    date2 DATE := '25-12-2022';
    date3 DATE := SYSDATE;
    
    dateTime1 TIMESTAMP := SYSTIMESTAMP;
    dateTime2 TIMESTAMP(3) := SYSTIMESTAMP;
    dateTime3 TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;
    dateTime4 TIMESTAMP WITH LOCAL TIME ZONE := SYSTIMESTAMP;
BEGIN
    DBMS_OUTPUT.PUT_LINE('num1: ' || num1);
    DBMS_OUTPUT.PUT_LINE('num2: ' || num2);
    DBMS_OUTPUT.PUT_LINE('num3: ' || num3);
    DBMS_OUTPUT.PUT_LINE('num4: ' || num4);
    DBMS_OUTPUT.PUT_LINE('num5: ' || num5);
    DBMS_OUTPUT.PUT_LINE('num6: ' || num6);

    DBMS_OUTPUT.PUT_LINE('int1: ' || int1);
    DBMS_OUTPUT.PUT_LINE('int2: ' || int2);

    DBMS_OUTPUT.PUT_LINE('float1: ' || float1);
    DBMS_OUTPUT.PUT_LINE('float2: ' || float2);

    DBMS_OUTPUT.PUT_LINE('double1: ' || double1);
    DBMS_OUTPUT.PUT_LINE('double2: ' || double2);

    DBMS_OUTPUT.PUT_LINE('char1: ' || char1);
    DBMS_OUTPUT.PUT_LINE('char2: ' || char2);
    DBMS_OUTPUT.PUT_LINE('char1/char2: ' || char1 || '/' || char2);
    
    DBMS_OUTPUT.PUT_LINE('vchar1: ' || vchar1);
    DBMS_OUTPUT.PUT_LINE('vchar2: ' || vchar2);
    DBMS_OUTPUT.PUT_LINE('vchar1/vchar2: ' || vchar1 || '/' || vchar2);

    DBMS_OUTPUT.PUT_LINE('nchar1: ' || nchar1);
    DBMS_OUTPUT.PUT_LINE('nvchar1: ' || nvchar1);

    DBMS_OUTPUT.PUT_LINE('long1: ' || long1);
    DBMS_OUTPUT.PUT_LINE('long2: ' || long2);
    
    DBMS_OUTPUT.PUT_LINE('bool1: ' || SYS.DIUTIL.BOOL_TO_INT(bool1));
    DBMS_OUTPUT.PUT_LINE('bool2: ' || SYS.DIUTIL.BOOL_TO_INT(bool2));
    DBMS_OUTPUT.PUT_LINE('bool3: ' || SYS.DIUTIL.BOOL_TO_INT(bool3));
    
    DBMS_OUTPUT.PUT_LINE('date1: ' || date1);
    DBMS_OUTPUT.PUT_LINE('date2: ' || date2);
    DBMS_OUTPUT.PUT_LINE('date3: ' || date3);

    DBMS_OUTPUT.PUT_LINE('dateTime1: ' || dateTime1);
    DBMS_OUTPUT.PUT_LINE('dateTime2: ' || dateTime2);
    DBMS_OUTPUT.PUT_LINE('dateTime3: ' || dateTime3);
    DBMS_OUTPUT.PUT_LINE('dateTime4: ' || dateTime4);
END;