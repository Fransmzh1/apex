#!/bin/bash

cd /opt/oracle/scripts/apex

echo "Waiting for Oracle Database to start..."
sqlplus -s / as sysdba <<EOF
    prompt Akan start database
    startup;

    alter session set container=XEPDB1;
    @apxsilentins.sql SYSAUX SYSAUX TEMP /i/ ${APX_PWD} ${APX_PWD} ${APX_PWD} ${ADMIN_PWD} 

    prompt akan shutdown database...
    shutdown
    exit
EOF


