#!/bin/bash

sqlplus -s / as sysdba <<EOF
startup
alter session set container=${PDB_NAME};
CREATE DIRECTORY apex_dir AS '/opt/oracle/dpdump';
EOF

export ORACLE_PDB_SID=XEPDB1

echo import on system/${ORACLE_PWD}
echo ""
impdp system/${ORACLE_PWD}@XE schemas=MBG directory=APEX_DIR dumpfile=mbg_20251118.dmp logfile=mbg_import.log logtime=ALL

#EXCLUDE=SCHEMA:"='MBG'"