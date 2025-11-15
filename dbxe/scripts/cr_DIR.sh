#!/bin/bash

sqlplus -s / as sysdba <<EOF
prompt Akan create APEX directory
startup
alter session set container=${PDB_NAME};
CREATE DIRECTORY apex_dir AS '/opt/oracle/dpdump';
EOF
