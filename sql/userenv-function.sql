SELECT
    USERENV('ENTRYID'),
    USERENV('ISDBA'),
    USERENV('LANG'),
    USERENV('LANGUAGE'),
    USERENV('SESSIONID'),
    USERENV('TERMINAL')
FROM dual;