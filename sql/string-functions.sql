SELECT 
    UPPER('daniel pereira guimarães')
    ,LOWER('Daniel Pereira Guimarães')
    ,INITCAP('daniel pereira guimarães')
    ,CONCAT('Daniel', 'Guimarães')
    ,LENGTH('Daniel')
    ,INSTR('Daniel', 'ie')
    ,LPAD('Daniel', 10, '*')
    ,RPAD('Daniel', 10, '*')
    ,REPLACE('Daniel Pereira Guimarães', 'Pereira ', '')
    ,'X' || TRIM('  Daniel  ') || 'X'
    ,'X' || RTRIM('  Daniel  ') || 'X'
    ,'X' || LTRIM('  Daniel  ') || 'X'
FROM dual
