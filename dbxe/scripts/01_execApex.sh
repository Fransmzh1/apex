echo "Ini file akan eksekusi Apex"

if [ -f "$ORACLE_BASE"/oradata/.APEX.created ]; then
    echo "APEX sudah terinstall"
else
    echo "APEX belum terinstall. Akan install APEX" 
    cd /opt/oracle/scripts/apex

    sqlplus sys/${ORACLE_PWD}@XEPDB1 as sysdba <<EOF
    alter session set container=XEPDB1;
    @apxsilentins.sql SYSAUX SYSAUX TEMP /i/ ${APX_PWD} ${APX_PWD} ${APX_PWD} ${APX_PWD}
    exit;
EOF

    echo "$(date -Iseconds)" > "$ORACLE_BASE"/oradata/.APEX.created
    # rm -r /opt/oracle/script/apex
    echo Selesai install APEX!
fi
