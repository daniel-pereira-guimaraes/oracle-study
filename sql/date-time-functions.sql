-- See: https://www.w3resource.com/oracle/character-functions/index.php
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
FROM dual