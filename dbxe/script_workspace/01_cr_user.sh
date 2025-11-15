#!/bin/bash

sqlplus -s "/ as sysdba" <<EOF
startup
WHENEVER SQLERROR EXIT SQL.SQLCODE

alter session set container=${PDB_NAME};

CREATE USER MBG IDENTIFIED BY ${MBG_PWD}
      DEFAULT TABLESPACE SYSAUX
      TEMPORARY TABLESPACE TEMP;

ALTER USER MBG quota unlimited ON SYSAUX;

GRANT CREATE SESSION TO MBG;
GRANT CREATE TABLE TO MBG;
GRANT CREATE CLUSTER TO MBG;
GRANT CREATE SYNONYM TO MBG;
GRANT CREATE VIEW TO MBG;
GRANT CREATE SEQUENCE TO MBG;
GRANT CREATE PROCEDURE TO MBG;
GRANT CREATE TRIGGER TO MBG;
GRANT CREATE MATERIALIZED VIEW TO MBG;
GRANT CREATE TYPE TO MBG;
GRANT CREATE OPERATOR TO MBG;
GRANT CREATE INDEXTYPE TO MBG;
GRANT CREATE DIMENSION TO MBG;
GRANT CREATE JOB TO MBG;
GRANT EXECUTE DYNAMIC MLE TO MBG;

GRANT EXECUTE ON SYS.JAVASCRIPT TO MBG;

EOF

if [ $? -ne 0 ]; then
  echo "Error creating user MBG"
  exit 1
fi    

exit 

### di bagian ini untuk test build image 1.2-apex241210
###
lsnrctl start
echo ""
echo TEST: sqlplus system/${ORACLE_PWD}@${PDB_NAME}
sqlplus system/${ORACLE_PWD} <<EOF
alter session set container=${PDB_NAME};
EOF

echo "impdp --"
# impdp system/${ORACLE_PWD}@localhost:1521/xepdb1 directory=apex_dir dumpfile=expdat.dmp schemas=MBG exclude=user
