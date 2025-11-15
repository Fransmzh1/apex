#!/bin/bash

sqlplus -s "/ as sysdba" <<EOF
WHENEVER SQLERROR EXIT SQL.SQLCODE
startup
alter session set container=${PDB_NAME};
@@02_WKS1.sql

EOF
