-- See: https://www.w3resource.com/oracle/datetime-functions/index.php
SELECT
    SYSDATE A
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') B
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') C
    ,TO_CHAR(SYSDATE + 1, 'YYYY-MM-DD') D
    ,TO_CHAR(SYSDATE - 1, 'YYYY-MM-DD') E
    ,TO_CHAR(SYSDATE - 1/24, 'YYYY-MM-DD HH24:MI:SS') F
    ,TO_CHAR(SYSDATE - INTERVAL '1' HOUR, 'YYYY-MM-DD HH24:MI:SS') G
    ,TO_CHAR(SYSDATE + 1/1440, 'YYYY-MM-DD HH24:MI:SS') F
    ,TO_CHAR(SYSDATE + INTERVAL '1' MINUTE, 'YYYY-MM-DD HH24:MI:SS') H
FROM dual;

SELECT
    SYSDATE A,
    MONTHS_BETWEEN(SYSDATE, SYSDATE - 365) B,
    ADD_MONTHS(SYSDATE, 2) C,
    NEXT_DAY(SYSDATE, 'SEXTA-FEIRA') D, -- PT-BR
    LAST_DAY(SYSDATE) E
FROM dual;

SELECT 
    TO_CHAR(ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS') A, 
    TO_CHAR(ROUND(SYSDATE, 'DAY'), 'YYYY-MM-DD HH24:MI:SS') B, 
    TO_CHAR(ROUND(SYSDATE, 'MONTH'), 'YYYY-MM-DD HH24:MI:SS') C, 
    TO_CHAR(ROUND(SYSDATE, 'YEAR'), 'YYYY-MM-DD HH24:MI:SS') D
FROM dual;

SELECT
    TO_CHAR(TRUNC(SYSDATE), 'YYYY-MM-DD HH24:MI:SS') A, 
    TO_CHAR(TRUNC(SYSDATE, 'DAY'), 'YYYY-MM-DD HH24:MI:SS') B, 
    TO_CHAR(TRUNC(SYSDATE, 'MONTH'), 'YYYY-MM-DD HH24:MI:SS') C, 
    TO_CHAR(TRUNC(SYSDATE, 'YEAR'), 'YYYY-MM-DD HH24:MI:SS') D 
FROM dual;

SELECT
    TO_CHAR(SYSDATE, 'D') A,
    TO_CHAR(SYSDATE, 'DD') B,
    TO_CHAR(SYSDATE, 'MM') C,
    TO_CHAR(SYSDATE, 'YYYY') D,
    TO_CHAR(SYSDATE, 'RRRR') E,
    TO_CHAR(SYSDATE, 'CC') F
FROM dual;

SELECT    
    TO_CHAR(SYSDATE, 'DAY') A,
    TO_CHAR(SYSDATE, 'MON') B,
    TO_CHAR(SYSDATE, 'MONTH') C,
    TO_CHAR(SYSDATE, 'DY') D,
    TO_CHAR(SYSDATE, 'YEAR') E
FROM dual;

SELECT 
    TO_CHAR(SYSDATE, 'DD - MONTH - YYYY') A,
    TO_CHAR(SYSDATE, 'DD - month - YYYY') B,
    TO_CHAR(SYSDATE, 'DD - Month - YYYY') C,
    TO_CHAR(SYSDATE, 'FMDD - MONTH - YYYY') D,
    TO_CHAR(SYSDATE, 'FMDD - month - YYYY') E,
    TO_CHAR(SYSDATE, 'FMDD - Month - YYYY') F
FROM dual;

SELECT 
    TO_CHAR(SYSDATE, 'HH') A,
    TO_CHAR(SYSDATE, 'HH12') B,
    TO_CHAR(SYSDATE, 'HH24') C,
    TO_CHAR(SYSDATE, 'MI') D,
    TO_CHAR(SYSDATE, 'SS') E
FROM dual