echo "Ini file akan eksekusi Apex"

if [ -f "$ORACLE_BASE"/oradata/.APEX.created ]; then
    echo "APEX sudah terinstall"
else
    echo "APEX belum terinstall. Akan install APEX" 
    cd /opt/oracle/scripts/apex

    sqlplus sys/${ORACLE_PWD}@XEPDB1 as sysdba <<EOF
    alter session set container=XEPDB1;
    @apxsilentins.sql SYSAUX SYSAUX TEMP /i/ ${APX_PWD} ${APX_PWD} ${APX_PWD} ${APX_PWD}
    alter session set container=XEPDB1;
    prompt
    prompt ...Akan update APEX_PUBLIC_USER
    prompt 
    alter user APEX_PUBLIC_USER account unlock identified by ${APX_PWD};
    alter user APEX_240200 account unlock identified by ${APX_PWD};
    exit;
EOF
    sts=$?
    if [ $sts -ne 0 ]; then
        echo "Gagal install APEX"
        exit $sts
    fi
    
    echo "$(date -Iseconds)" > "$ORACLE_BASE"/oradata/.APEX.created
    # rm -r /opt/oracle/script/apex
    echo Selesai install APEX!
fi
