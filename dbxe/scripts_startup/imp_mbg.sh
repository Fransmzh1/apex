#!/bin/bash

if [ -f "${ORACLE_BASE}"/oradata/.mbg.created ]; then
    echo User MBG sudah ada.
    exit 1
fi

sqlplus -s / as sysdba <<EOF
alter session set container=${PDB_NAME};
CREATE DIRECTORY apex_dir AS '/opt/oracle/dpdump';
EOF

echo import on system/${ORACLE_PWD}@${PDB_NAME}
echo ""
impdp system/${ORACLE_PWD}@${PDB_NAME} schemas=MBG directory=APEX_DIR dumpfile=mbg_20251118.dmp logfile=mbg_import.log logtime=ALL

#EXCLUDE=SCHEMA:"='MBG'"

echo "$(date -Iseconds)" > ${ORACLE_BASE}/oradata/.mbg.created
