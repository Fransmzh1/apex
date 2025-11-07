#!/bin/bash

cd ${ORACLE_BASE}/scripts

if [[ -z "$ADMIN_PWD" ]] && [[ "$ADMIN_PWD" == "$_ADMIN_PWD" ]]; then
   echo "No APEX ADMIN password set, not updating"
   exit;
fi

_ADMIN_PWD=$ADMIN_PWD

sqlplus -s / as sysdba <<EOF
alter session set container=XEPDB1;
@apxchpwd.sql $_ADMIN_PWD
EOF

