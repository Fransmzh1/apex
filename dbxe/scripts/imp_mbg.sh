#!/bin/bash

impdp system/${ORACLE_PWD}@${PDB_NAME} \
schemas=MBG \
directory=APEX_DIR \
dumpfile=mbg_20251118.dmp \
logfile=mbg_import.log \
logtime=ALL

#EXCLUDE=SCHEMA:"='MBG'"