#!/bin/bash

cd /opt/oracle/scripts

sqlplus -s / as sysdba <<EOF
prompt Akan start database
startup;

alter session set container=XEPDB1;
@02_WKS1.sql
EOF

