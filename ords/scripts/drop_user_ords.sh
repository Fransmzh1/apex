sql -s sys/${ORACLE_PWD}@db:1521/XEPDB1 as sysdba <<EOF

    SET FEEDBACK OFF;
    drop user ORDS_PUBLIC_USER cascade;
    drop user ORDS_METADATA cascade;
    drop role ords_administrator_role;
    drop role ords_runtime_role;
    exit;
EOF

