#!/bin/bash

cd /opt/oracle/scripts/apex

_APX_PWD=${APX_PWD:-${_APX_PWD}}
_ADMIN_PWD=${ADMIN_PWD:-${_ADMIN_PWD}}

echo "Waiting for Oracle Database to start..."
sqlplus -s / as sysdba <<EOF
    prompt Akan start database
    startup;

    alter session set container=XEPDB1;
    @apxsilentins.sql SYSAUX SYSAUX TEMP /i/ ${_APX_PWD} ${_APX_PWD} ${_APX_PWD} ${_ADMIN_PWD} 

    prompt akan shutdown database...
    shutdown
    exit
EOF


