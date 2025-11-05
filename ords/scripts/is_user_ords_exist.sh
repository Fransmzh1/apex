sql -s sys/${ORACLE_PWD}@db:1521/XEPDB1 as sysdba &> /dev/null <<EOF

WHENEVER SQLERROR EXIT FAILURE;
SET FEEDBACK OFF;
DECLARE
    l_username VARCHAR2(30);
BEGIN
    SELECT username INTO l_username FROM dba_users WHERE username = 'ORDS_PUBLIC_USR';
END;
/
exit;
EOF

