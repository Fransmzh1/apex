#!/bin/bash

cd /opt/oracle/scripts/patchset10

NLS_LANG=American_America.AL32UTF8
export NLS_LANG

echo "Waiting for Oracle Database to start..."
sqlplus -s / as sysdba <<EOF
    prompt Akan upgrade APEX
    startup;

    alter session set container=XEPDB1;
    @catpatch.sql 

    prompt akan shutdown database...
    shutdown
    exit
EOF
