#!/bin/bash

if [ -f "${ORACLE_BASE}"/oradata/.mbg.created ]; then
    echo Schema MBG already created.
    exit 1
fi


sqlplus -s / as sysdba <<EOF
alter session set container=${PDB_NAME};
CREATE DIRECTORY apex_dir AS '/opt/oracle/dpdump';
EOF

cd /opt/oracle/dpdump
FILE_NAME=$(ls -v *.dmp | tail -n1)

echo import file $FILE_NAME
echo ""
impdp system/${ORACLE_PWD}@${PDB_NAME} schemas=MBG directory=APEX_DIR dumpfile=$FILE_NAME logfile=mbg_import.log logtime=ALL

#EXCLUDE=SCHEMA:"='MBG'"

echo "$(date -Iseconds)" > ${ORACLE_BASE}/oradata/.mbg.created
